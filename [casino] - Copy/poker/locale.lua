local lang = {}

--default language at last line
lang.en = {
    --------------------------------------------------------------
    --Notifications | optional features check function config.lua
    create = function (tableName)
        local name = tostring(tableName):gsub('_', ' ')
        return "", "You have created "..name.." Poker Table!", 5000, true
        --return title(string), message(string), timer(ms -> number), display(boolean)
    end,
    create_blinds = function ()
        return "", "Please select the amount of blinds!", 5000, true
    end,
    join = function (tableName)
        local name = tostring(tableName):gsub('_', ' ')
        return "", "You have joined "..name.." Poker Table!", 5000, true
    end,
    err_create = function (tableName)
        local name = tostring(tableName):gsub('_', ' ')
        return "", name.." Poker Table has already been created!", 5000, true
    end,
    err_create_busy = function (tableName)
        local name = tostring(tableName):gsub('_', ' ')
        return "", name.." Poker Table, is busy setting up by another player!", 5000, true
    end,
    err_start = function ()
        return "", "Attempted to start an already started game!", 5000, true
    end,
    err_enough_players = function ()
        return "", "Not enough players to start a game!", 5000, true
    end,
    err_join = function (tableName)
        local name = tostring(tableName):gsub('_', ' ')
        return "", name.." Poker Table is full at the moment!", 5000, true
    end,
    err_seat = function ()
        return "", "Poker Table Seat has not been found!", 5000, true
    end,
    err_money = function ()
        return "", "You do not have enough money!", 5000, true
    end,
    err_404 = function ()
        return "", "Poker Table has not been found!", 5000, true
    end,
    err_input = function ()
        return "", "Wrong Input!", 5000, true
    end,
    err_name = function ()
        return "", "Player Name is invalid!", 5000, true
    end,
    err_previous_join = function ()
        return "", "You previously left an active game, you need to wait for this game to end!", 5000, true
    end,
    --------------------------------------------------------------

    ----------------------
    --Script Translations
    leave = "Leave",
    start = "Start",
    raise = "Raise",
    allin = "All-In",
    check = "Check",
    call  = "Call",
    fold  = "Fold",
    tJoin = "Join Table",
    label_joinPrompt = "Poker Table",
    texasholdem = "Texas hold 'em",
    dollarSign = "$",
    input_raise = function (number)
        return "Raise Amount (min. $"..tostring(number)..")"
    end,
    input_buyin = function (number)
        return "Buy-In Amount (min. $"..tostring(number)..")"
    end,
    input_blind = function (number)
        return "set Small Blind (min. $"..tostring(number)..")"
    end,
    ----------------------

    -------------------------
    --Poker HUD Translations
    --class key should not be changed
    --(uppercase will be applied by script)
    hud = {
        noplay  = 'not playing',
        allin   = 'all-in',
        check   = 'check',
        raise   = 'raise',
        call    = 'call',
        fold    = 'fold',
        play    = 'playing',
        next    = 'next',
        wait    = 'waiting',
        left    = 'left',
        big     = 'big blind',
        small   = 'small blind',
        winner  = 'win',
        loser   = 'loss',
        won     = 'won',
        lost    = 'lost',
        split   = 'split',
        bet     = 'bet',
        symbol  = '$',
        mainpot = 'main pot',
        kicker  = 'kicker',
        high    = 'at',
        main_symbol = '(M)'
    },
    hands = {
        [0] = "High Card",
        [1] = "Pair",
        [2] = "Two Pair",
        [3] = "Three of a Kind",
        [4] = "Straight",
        [5] = "Flush",
        [6] = "Full House",
        [7] = "Four of a Kind",
        [8] = "Straight Flush",
        [9] = "Royal Flush",
    },
    cards = {
        [2] = "2",
        [3] = "3",
        [4] = "4",
        [5] = "5",
        [6] = "6",
        [7] = "7",
        [8] = "8",
        [9] = "9",
        [10] = "10",
        [11] = "J",
        [12] = "Q",
        [13] = "K",
        [14] = "A",
    },
    -------------------------
}

render = lang.en