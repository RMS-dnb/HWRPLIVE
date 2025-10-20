var currentGame = {}
var myId = -1
var PlayerStates = {}
$(function() {
    // fade in/out wrapper element (show/hide NUI)
    function display(bool) {
        if (bool) {
            $("#blackjack-wrapper").fadeIn(400);
        } else {
            $("#blackjack-wrapper").fadeOut(250);
            currentGame = {}
        }
    };

    // sort array by key parameter asc & desc
    // https://koukia.ca/sorting-an-array-of-objects-with-jquery-d01e12047ce4
    function sortByKeyAsc(array, key) {
        return array.sort(function (a, b) {
            var x = a[key]; var y = b[key];
            return ((x > y) ? -1 : ((x < y) ? 1 : 0));
        });
    }
    
    //generate a tempate string at runtime
    //https://stackoverflow.com/questions/29182244/convert-a-string-to-a-template-string
    var generateTemplateString = (function(){
        var cache = {};
        function generateTemplate(template){
            var fn = cache[template];
            if (!fn){
                var sanitized = template
                    .replace(/\$\{([\s]*[^;\s\{]+[\s]*)\}/g, function(_, match){
                        return `\$\{map.${match.trim()}\}`;
                        })
                    .replace(/(\$\{(?!map\.)[^}]+\})/g, '');
                fn = Function('map', `return \`${sanitized}\``);
            }
            return fn;
        }
        return generateTemplate;
    })();

    // listen for NUI events
    window.addEventListener("message", function(event) {
        //show/hide the whole NUI 
        if (event.data.type === "ui") {
            display(event.data.status)
        } 
        else if (event.data.type === "gamestate") {
            if (event.data.state) {
                $(".cardinfo").html("")
                currentGame = event.data.state
                updatePlayer(currentGame.players)
            }
            if (event.data.playerId) { 
                myId = event.data.playerId
            }
        }
        else if (event.data.type === "localization") {
            PlayerStates = event.data.playerstates
        }
    })

    function getCardVal(card) {
        var c = card.split("-");
        if      (c[0] == "♦") { c[0] = "diamonds" }
        else if (c[0] == "♤") { c[0] = "spades" }
        else if (c[0] == "♥") { c[0] = "hearts" }
        else if (c[0] == "♧") { c[0] = "clubs" }  
        c[1] = c[1].toLowerCase();
        return c
    }

    function oneHand(data) {
        return data.count.length == 1
    }

    function delimiter(data) {
        return data.count.length == 1 ? "" : "<br>"
    }

    function updatePlayer(players) {
        var playerHTML = ""
        $("#player-cards").html(playerHTML)
        // playerlist needs to be sorted. So for that we build an Array out of that object
        var playerlist = []
        for (const [key, value] of Object.entries(players)) {
            value.id = key
            playerlist.push(value)
        }
        playerlist = sortByKeyAsc(playerlist, "seat");
        $.each( playerlist, function( id, data ) {
            if (data.type == "player") {
                // Depending on playerstate do some animations in the gui
                var state = "" 
                if ((data.playerstate[0] == "input move" || data.playerstate[1] == "input move") && myId == data.id ) {
                    state = "active yourself"
                } else if ((data.playerstate[0] == "input move" || data.playerstate[1] == "input move") && myId != data.id ) {
                    state = "active otherplayer"
                } else if (data.playerstate[0] == "bust" && data.playerstate[1] == "bust") {
                    state = "bust"
                }

                var currentState = ""
                // Set playerstate per hand
                for (hand in data.count) {
                    var counter = "[<span class='monowidth'>" + data.count[hand] + "</span>] "
                    // Translate playerstates to actual information to display and add card counter when needed.
                    // Also if player has two hands (splitted before), add up the displayed player states and card counter to one string 
                    if (data.playerstate[hand] == "waiting for start") {
                        currentState = PlayerStates.waiting; 
                    } else if (data.playerstate[hand] == "input bet") {
                        currentState = PlayerStates.inputBet; 
                    } else if (data.playerstate[hand] == "placed bet") {
                        var money = data.bet.toFixed(2)
                        currentState = generateTemplateString(PlayerStates.betPlaced)({money: money})
                    } else if (data.playerstate[hand] == "input move") {
                        if (myId == data.id) {
                            currentState = oneHand(data) ? counter + PlayerStates.inputSelf : currentState + counter + PlayerStates.inputSelf + delimiter(data)
                        } else {
                            var name = data.name
                            var template = generateTemplateString(PlayerStates.inputOther)({name: name})
                            currentState =  oneHand(data) ? counter + template : currentState + counter + template + delimiter(data)
                        }
                    } else if (data.playerstate[hand] == "doubledown"  || data.playerstate[hand] == "move:doubledown") {
                        var money = data.bet.toFixed(2)
                        var template = generateTemplateString(PlayerStates.doubleDown)({money: money})
                        currentState = oneHand(data) ? counter + template : currentState + counter + template + delimiter(data)
                    } else if (data.playerstate[hand] == "bust") {
                        currentState = oneHand(data) ? counter + PlayerStates.bust : currentState + counter + PlayerStates.bust + delimiter(data)
                    } else if (data.playerstate[hand] == "hit" || data.playerstate[hand] == "move:hit") {
                        currentState = oneHand(data) ? counter + PlayerStates.hit : currentState + counter + PlayerStates.hit + delimiter(data)
                    } else if (data.playerstate[hand] == "stand"  || data.playerstate[hand] == "move:stand") {
                        currentState = oneHand(data) ? counter + PlayerStates.stand : currentState + counter + PlayerStates.stand + delimiter(data)
                    } else if (data.playerstate[hand] == "split" || data.playerstate[hand] == "move:split") {
                        currentState = oneHand(data) ? counter + PlayerStates.split : currentState + counter + PlayerStates.split + delimiter(data)
                    } else if (data.playerstate[hand] == "blackjack") {
                        currentState = oneHand(data) ? counter + PlayerStates.blackjack : currentState + counter + PlayerStates.blackjack + delimiter(data)
                    } else if (data.playerstate[hand] == "waiting for player") {
                        currentState = oneHand(data) ? counter + PlayerStates.waitOnPlayer : currentState + counter + PlayerStates.waitOnPlayer + delimiter(data)
                    } else if (data.playerstate[hand] == "waiting for cards") {
                        currentState = oneHand(data) ? counter + PlayerStates.waitOnCards : currentState + counter + PlayerStates.waitOnCards + delimiter(data)
                    } else if (data.playerstate[hand] == "tie") {
                        currentState = oneHand(data) ? PlayerStates.tie : currentState + PlayerStates.tie + delimiter(data)
                    } else if (data.playerstate[hand] == "loose") {
                        var money = data.bet.toFixed(2) 
                        var template = generateTemplateString(PlayerStates.loose)({money: money}) 
                        currentState = oneHand(data) ? template : currentState + template + delimiter(data)
                    } else if (data.playerstate[hand] == "win") {
                        var money = 0
                        if (data.cards[0].length == 2 && data.cards[0].count == 21) {
                            var nBet = data.bet * 1.5
                            money = nBet.toFixed(2) 
                        } else {
                            money = data.bet.toFixed(2) 
                        }
                        var template = generateTemplateString(PlayerStates.win)({money: money}) 
                        currentState = oneHand(data) ? template : currentState + template + delimiter(data)
                    }
                }
                // Create the player box with cardinfo and append it to the main player container
                playerHTML = "<div class='player' id='player-"+data.id+"'><div id='player-"+data.id+"-pic' class='player-pic player-pic-h" + data.count.length + " "+ state +"'>" + data.seat + "</div><ul id='pCards-"+data.id+"'></ul><div class='cardinfo "+ state +"'><span>" + currentState + "</span></div></div>"
                $("#player-cards").append(playerHTML)
            }
            if (data.type == "dealer" && data.cards[0].length > 0) { 
                // Update card info for dealer
                $("#dealer-cards .cardinfo").html("[<span class='monowidth'>"+ data.count +"</span>]" )
            }
        });
        // Create visible player deck or display moneypot + name when in idle mode
        $.each( players, function( id, data ) {   
            if(currentGame.state == "idle" && data.type == "player") {
                var pot = data.pot[0].toFixed(2)
                var MoneyAndName = "<li class='name redtext'>" + data.name + "<li/><li class='money'>$" + pot + "</li>"
                $("#pCards-" + id).html(MoneyAndName )
            } else {  
                           
                $.each( data.cards, function( handid, hand ) {
                    var iscurrenthand = "handnormal"
                 /*    if (data.type == "player") {console.log(handid + 1 != data.currentHand , currentGame.currentCardTo == id)} */
                    if (handid + 1 != data.currentHand && currentGame.currentCardTo == id && data.type == "player") {iscurrenthand = "nothandcurrent"}
                    var cardHTML = "<ul class='hand_" + (handid + 1) + " " + iscurrenthand +"'>"   
                    
                    $.each( hand, function( i, card ) {
                        var count = getCardVal(card)
                        // If first card of dealer is not visible, render its back side
                        if (data.type == "dealer" && !currentGame.showDealerHand && i==0 ) {
                            cardHTML = cardHTML + "<li class='card'><img class='card-blank' src='img/cards/playing_cards_0" + currentGame.deckStyle + "/back.png'/></li>"            
                        } else {
                            cardHTML = cardHTML + "<li class='card'><img class='card-" + card + "' src='img/cards/playing_cards_0" + currentGame.deckStyle + "/" + count[0] + "_" + count[1] + ".png'/></li>"            
                        }
                    })

                    cardHTML = cardHTML + "</ul>"   

                    // Attach it to the dealer or player box
                    if (data.type == "player") {
                        $("#pCards-" + id).append(cardHTML)
                        if (currentGame.currentCardTo == id && data.currentHand == handid + 1) {
                            $("#pCards-" + id + " ul.hand_" + data.currentHand + " li:last-child" ).addClass("animate__animated").addClass("animate__bounceIn")    
                        }
                    } else if (data.type == "dealer") {
                        $("#dCards").html(cardHTML)
                        if (currentGame.currentCardTo == id) {
                            $("#dCards li:last-child" ).addClass("animate__animated").addClass("animate__bounceIn")    
                        }
                    }

                })

               
            }
        });
    }
})
