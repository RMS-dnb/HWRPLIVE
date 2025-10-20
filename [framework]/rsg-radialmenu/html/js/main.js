'use strict';

var QBRadialMenu = null;
var isListening = false;

$(document).ready(function(){
    window.addEventListener('message', function(event){
        switch (event.data.action) {
            case "ui":
                if (event.data.radial) {
                    createMenu(event.data.items)
                    QBRadialMenu.open();
                    
                    // Only start listening for the Escape key after menu is opened
                    if (!isListening) {
                        isListening = true;
                        $(document).on('keydown.radialmenu', function(e) {
                            if (e.key === "Escape") {
                                QBRadialMenu.close();
                                // Clean up the event handler
                                $(document).off('keydown.radialmenu');
                                isListening = false;
                            }
                        });
                    }
                } else {
                    QBRadialMenu.close(true);
                    // Clean up the event handler
                    $(document).off('keydown.radialmenu');
                    isListening = false;
                }
                break;
        }
    });
});

function createMenu(items) {
    QBRadialMenu = new RadialMenu({
        parent      : document.body,
        size        : 375,
        menuItems   : items,
        onClick     : function(item) {
            if (item.shouldClose) {
                QBRadialMenu.close(true);
                // Clean up the event handler
                $(document).off('keydown.radialmenu');
                isListening = false;
            }
            
            if (item.items == null && item.shouldClose != null) {
                $.post('https://rsg-radialmenu/selectItem', JSON.stringify({
                    itemData: item
                }))
            }
        }
    });
}

// IMPORTANT: Remove the keyup handler completely