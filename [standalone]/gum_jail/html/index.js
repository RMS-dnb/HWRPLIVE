var jailTable = []
var mouseOverNow = false
var language = []
$(document).keydown(function(e) {
    var close = 27;
    var close2 = 8;
    switch (e.keyCode) {
        case close:
            $.post('http://gum_jail/close', JSON.stringify({}));
            $("#jailMenu").fadeOut(200);
        break;
        case close2:
            $.post('http://gum_jail/close', JSON.stringify({}));
            $("#jailMenu").fadeOut(200);
        break;
    }
});

$(function() {
    function display2(bool) {
        if (bool) {
            $("#container").fadeIn(100);
        } else {
            $("#container").fadeOut(200);
        }
    }

    display2(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "notify") {
            if (item.status == true) {
                setTimeout(function(){ 
                    document.getElementById("text_system").innerHTML = item.text;
                    display2(true)
                }, 400);
            } else {
                display2(false)
            }
        }
    })

})

function mouseOver() {
    mouseOverNow = true
}
function mouseOut() {
    mouseOverNow = false
}