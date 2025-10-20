local Translations = {

    client = {
        lang_1 = 'You don\'t have a weed plant pot',
        lang_2 = 'Plant Info',
        lang_3 = 'Male',
        lang_4 = 'Female',
        lang_5 = 'Destroy Plant',
        lang_6 = 'Gender : ',
        lang_7 = 'Growth : ',
        lang_8 = 'Quality : ',
        lang_9 = 'Thirst : ',
        lang_10 = 'Hunger : ',
        lang_11 = 'Water Plant',
        lang_12 = 'Feed Plant',
        lang_13 = 'Harvest Plant',
        lang_14 = 'You have no water',
        lang_15 = 'You have no fertilizer',
        lang_16 = 'Harvesting Plant',
        lang_17 = 'Destroying Plant',
        lang_18 = 'Process Cannabis',
        lang_19 = 'Pack Cannabis',
        lang_20 = 'Enter Lab',
        lang_21 = 'Exit Lab',
        lang_22 = 'No Key',
        lang_23 = 'You don\'t have any cannabis buds',
        lang_24 = 'Processing Weed Bud',
        lang_25 = 'You don\'t have enough cannabis',
        lang_26 = 'You don\'t have enough baggys',
        lang_27 = 'Packing Weed',
        lang_28 = 'Drug sale in progress',
        lang_29 = 'Dropoff Location',
        lang_30 = 'Make Deal',
        lang_31 = 'Start Job',
        lang_32 = 'Stop Job',
        lang_33 = 'Not enough weed baggy\'s',
        lang_34 = 'Not enough weed baggy\'s to continue!',
        lang_35 = 'Job stopped',
    },

    server = {
        lang_1 = 'You already have ',
        lang_2 = ' plants down',
        lang_3 = 'You destroyed the plant',
        lang_4 = 'plant cron job ran',
        lang_5 = 'Not enough weed',
    },

    config = {
        lang_1 = 'add here',
    },

}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

-- Lang:t('client.lang_1')
-- Lang:t('server.lang_1')
-- Lang:t('config.lang_1')
