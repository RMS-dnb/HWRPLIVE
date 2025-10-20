$('body').fadeOut(0);
/*----------------------------------------------------------------------------------------------------------------------------------------------------------*/
window.addEventListener('message', function(event) {
    switch (event.data.action) {
        case 'timer':
            var data = $("<div>").html(event.data.html);
            $('body').append(data);
            $('body').fadeIn(0);
            break;
        case 'close':
            CloseMenu()
            break;
        case 'invite':
            $('body').append(event.data.html);
            $('body').fadeIn(0);
            break;
        case 'close2':
            $('#invite').remove();
            break;
        default:
            break;
    }
});
/*----------------------------------------------------------------------------------------------------------------------------------------------------------*/
function CloseMenu() {
    setTimeout(() => {
        $('#timer').remove();
    }, 1000);
}
/*----------------------------------------------------------------------------------------------------------------------------------------------------------*/