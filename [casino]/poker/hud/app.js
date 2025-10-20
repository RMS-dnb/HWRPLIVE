let resource

window.onload = (e)=>{

window.addEventListener('message', (event) => {	            
    var item = event.data;

    if (item !== undefined && item.type==='post_holdCard1') {
        $('html').css('display', 'initial')
        $('hold card').eq(0).css('background-image', `url('./images/`+item.data+`.png')`)
        $('hold card').eq(0).animate({
            bottom: "0"
        }, 500, function() {
            $('hold card').eq(0).css('transform', 'rotate(-10deg)')
        });
    }

    if (item !== undefined && item.type==='post_holdCard2') {
        $('html').css('display', 'initial')
        $('hold card').eq(1).css('background-image', `url('./images/`+item.data+`.png')`)
        $('hold card').eq(1).animate({
            bottom: "0"
        }, 500, function() {
            $('hold card').eq(1).css('transform', 'rotate(10deg)')
        });
    }

    if (item !== undefined && item.type==='post_flop') {
        $('html').css('display', 'initial')
        $('shared card').eq(0).css('background-image', `url('./images/`+item.data[0]+`.png')`)
        $('shared card').eq(1).css('background-image', `url('./images/`+item.data[1]+`.png')`)
        $('shared card').eq(2).css('background-image', `url('./images/`+item.data[2]+`.png')`)
        $('shared card').eq(0).animate({ left: "0" }, 250);
        $('shared card').eq(1).animate({ left: "0" }, 500);
        $('shared card').eq(2).animate({ left: "0" }, 750);
    }

    if (item !== undefined && item.type==='post_turn') {
        $('html').css('display', 'initial')
        $('shared card').eq(3).css('background-image', `url('./images/`+item.data+`.png')`)
        $('shared card').eq(3).animate({ left: "0" }, 250);
    }

    if (item !== undefined && item.type==='post_river') {
        $('html').css('display', 'initial')
        $('shared card').eq(4).css('background-image', `url('./images/`+item.data+`.png')`)
        $('shared card').eq(4).animate({ left: "0" }, 250);
    }

    if (item !== undefined && item.type==='post_resetCards') {
        $('html').css('display', 'initial')
        $('shared card').eq(4).animate({
            left: "54vh"
        }, 250, function() {
            $('shared card').eq(4).css('background-image', 'none')
        });
        $('shared card').eq(3).animate({
            left: "54vh"
        }, 500, function() {
            $('shared card').eq(3).css('background-image', 'none')
        });
        $('shared card').eq(2).animate({
            left: "54vh"
        }, 750, function() {
            $('shared card').eq(2).css('background-image', 'none')
        });
        $('shared card').eq(1).animate({
            left: "54vh"
        }, 1000, function() {
            $('shared card').eq(1).css('background-image', 'none')
        });
        $('shared card').eq(0).animate({
            left: "54vh"
        }, 1250, function() {
            $('shared card').eq(0).css('background-image', 'none')
        });
        $('hold card').eq(0).css('transform', 'rotate(0deg)')
        $('hold card').eq(1).css('transform', 'rotate(0deg)')
        setTimeout(() => {
            $('hold card').eq(0).animate({
                bottom: "-5vh"
            }, 500, function() {
                $('hold card').eq(0).css('background-image', 'none')
            });
            $('hold card').eq(1).animate({
                bottom: "-5vh"
            }, 500, function() {
                $('hold card').eq(1).css('background-image', 'none')
            });
        }, 500);
    }

    if (item !== undefined && item.type==='post_playerUpdate') {
        $('html').css('display', 'initial')
        let seat = 0
        $('pot span').eq(0).html(item.data.pot[0]+` -`)
        $('pot span').eq(1).html(item.data.pot[1])
        for (const player of item.data.hud) {
            if (player.display === true) {
                let getClass = $('person').eq(seat).find('info').attr('class')
                if (getClass !== player.case) {
                    $('person').eq(seat).find('info').removeClass().addClass(player.case)
                }
                if (player.ending === true) {
                    $('person').eq(seat).find('#vw25').attr('src',`./images/`+player.cards[0]+`.png`)
                    $('person').eq(seat).find('#vw254').attr('src',`./images/`+player.cards[1]+`.png`)
                    $('person').eq(seat).find('#vw25').css('opacity','0')
                    $('person').eq(seat).find('#vw254').css('opacity','0')
                    $('person').eq(seat).find('info img').css('display', 'initial')
                    $('person').eq(seat).find('#vw25').animate({
                        opacity: 1
                    }, 150);
                    $('person').eq(seat).find('#vw254').animate({
                        opacity: 1
                    }, 150);
                }else{
                    $('person').eq(seat).find('info img').css('display', 'none')
                    $('person').eq(seat).find('#vw25').attr('src','')
                    $('person').eq(seat).find('#vw254').attr('src','')
                }
                $('person').eq(seat).find('name span').html(player.name)
                $('person').eq(seat).find('info money').html(player.money)
                $('person').eq(seat).find('info action').html(player.action)
                $('person').eq(seat).find('info bet span').eq(0).html(player.betspan+`:`)
                $('person').eq(seat).find('info bet span').eq(1).html(player.bet)
                $('person').eq(seat).css('display', 'flex')
            }else{
                $('person').eq(seat).css('display', 'none')
                $('person').eq(seat).find('info img').css('display', 'none')
                $('person').eq(seat).find('#vw25').attr('src','')
                $('person').eq(seat).find('#vw254').attr('src','')
                $('person').eq(seat).find('info').removeClass().addClass('wait')
                $('person').eq(seat).find('name span').html('')
                $('person').eq(seat).find('info money').html('')
                $('person').eq(seat).find('info action').html('')
                $('person').eq(seat).find('info bet span').eq(0).html('')
                $('person').eq(seat).find('info bet span').eq(1).html('')
            }
            seat += 1
        }
    }

    if (item !== undefined && item.type==='terminate') {
        window.location.reload();
    }
    
});

}