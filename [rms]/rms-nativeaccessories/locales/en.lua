local Translations = {

    client = {
        -- BUY
        lang_1 = 'Shopping or selling?',
        lang_2 = 'Store closed',
        lang_3 = 'Come back after ',
        lang_4 = 'am',
        lang_5 = 'Native shop',
        lang_6 = 'Native Shop',
        lang_7 = 'Sell Item',
        lang_8 = 'View Item List',
        lang_9 = 'Buy Items',
        lang_10 = 'View Item List',

        -- SELL
        lang_13 = 'Error',
        lang_14 = 'There are no items available to sell.',
        lang_15 = 'Items to sell',
        lang_16 = 'List of items to sell',
        lang_17 = 'Sell all items',
        lang_18 = 'Sell all available items',
        lang_19 = 'Do you want to sell, do you have what I need',
        lang_20 = 'Do you have ',
        lang_21 = ' | Ud.:',
        lang_22_0 = 'Error',
        lang_22 = 'Please enter a valid numeric value',
        lang_23 = 'Insufficient quantity',
        lang_24 = 'The minimum quantity to be sold is 1',
        lang_25 = 'Unable to sell',
        lang_26 = 'You do not have enough items to sell.',
        lang_27 = 'Are you sure?',
        lang_28 = 'Sell all items in the list',
        lang_29 = 'Yes',
        lang_30 = 'No',
        lang_31 = 'Sale cancelled',
        lang_32 = 'Sale was canceled.',
        lang_33 = 'Negotiation...',
        lang_34 = 'Sale cancelled',
        lang_35 = 'Sale was cancelled',
    },

    server = {
        -- SELL
        lang_13 = 'Sell',
        lang_14 = ' | $:',
        lang_15 = 'You items to sell.',
        lang_16 = 'Total earnings | $',
        lang_17 = 'All items sold',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

-- Lang:t('client.lang_1')
-- Lang:t('server.lang_1')
-- Lang:t('config.lang_1')
