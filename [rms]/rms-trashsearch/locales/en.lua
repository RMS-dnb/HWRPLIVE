local Translations = {

    client = {
        lang_1 = 'Search',
        lang_2 = 'Searching Trash',
        lang_3 = 'Already Searched..',
    },

    server = {
        lang_1 = 'Nothing Found!',
    },

}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

-- Lang:t('client.lang_1')
-- Lang:t('server.lang_1')
