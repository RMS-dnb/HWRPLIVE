local Translations = {

    client = {
        lang_1 = 'Open Smelting',
        lang_2 = 'Smelting',
        lang_3 = 'Smelt Item',
        lang_4 = 'Smelting ',
        lang_5 = 'Smelting items missing!',
    },

    server = {
        lang_1 = 'Item Smelted',
        lang_2 = ') smelted a ',
    },

}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

-- Lang:t('client.lang_1')
-- Lang:t('server.lang_1')
