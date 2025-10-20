Config = {}
Config.RefreshRate = 5
Config.Debug = false
Config.framework = "rsg"--"redemrp" or "vorp" or "qbr" or "qbr2" or "redemrp-reboot" or "rsg" or "rpx"
Config.customRPX_Inventory = false

Config.DisablePropsOption = false --Disables the prop menu option

Config.CoronaObj = true 

Config.GiveBackTotemAtDisband = true
Config.DisbandCampPrice = 0 

Config.DeliveryRewardItems = {
    pelt = {
        {id = "bread", label = "Bread", amount = {min = 1, max = 2}, chance = 20},
        {id = "water", label = "Water", amount = {min = 1, max = 2}, chance = 20},
    },
    meat = {
        {id = "bread", label = "Bread", amount = {min = 1, max = 2}, chance = 20},
        {id = "water", label = "Water", amount = {min = 1, max = 2}, chance = 20},
    },
    reward_texture = {dict = "menu_textures", texture = "log_gang_bag", color = "COLOR_GOLD"},
}

Config.CampBlipCommand = "camp_blips"

Config.LockerForMembersOnly = false

Config.CanMembersStartDelivery = false

Config.TurnOffSupplyCheckLogic = false -- if true then camps wont be checked for supply to keep the camp

Config.BuySupplyPrice = 10 -- $10 / supply

Config.MaxCampMembers = 8 

Config.ModelZPos = {
    --EXPAND WITH PROPS TO HAVE CUSTOM Z POSITION
    [`mp005_p_veh_trader_resupply01x`] = 0.0, -- + 0.0 extra Z to the object model when spawned as placed Prop 
    --[`p_chestmedice01x`] = 0.0, -- + 0.0 extra Z to the object model when spawned as placed Prop 
    
}

Config.VegModifierMultiplier = 1.5 -- Vegetation Modifier Multiplier for placed objects
Config.VegModifierExtra = 1.0 --Vegetation Modifier Extra Amount for placed objects

Config.RSGStash = {maxweight = 10000, slots = 20}
Config.VORPLockerLimit = 100
Config.VORPLockerAPI = {acceptWeapons = true, shared  = true, stack = true, listonly = false, usepermissions = false, useBlackList = false, ListWeapons = false}

Config.SupplyItemSupplyAmount = 1 --the amount of Camp Supply added for each Camp Supply Inventory Item
--SUPPLY TABLE
Config.DisableSupplyTableOption = true 
Config.SupplyTablePrice = 300
Config.SupplyTableObject = `mp005_p_veh_trader_resupply01x`
Config.SupplyItems = {-- only standard/base inventory items!
     {item = "water", label = "Water", supply = 1},
     {item = "bread", label = "Bread", supply = 1},
}
--SUPPLY TABLE
Config.ButcherTableAddSkinnedCarcass = false

Config.DisablePeltOption = true 
Config.PeltTraderPrice = 200
Config.PeltTraderObject = `p_hidedisplay05x`
Config.PeltDeliveryAmount = {min = 1, max = 25}

Config.AllowMembersToPlaceProp = true

Config.MenuCloseDistance = 25.0
Config.MaxDistanceToPlaceProp = 25.0

Config.ViewDistanceObject = 70.0
Config.CampsPerPlayer = 2
Config.MaxPropsPerCamp = 20

Config.DisableButcherOption = true 

Config.CampBlip = 327180499

Config.LockpickTry = 5
Config.LockpickCD = 60--seconds

Config.Prompts = {
    PromptPlace = 0xD7DE6B1E,
    PromptCancel = 0xA65EBAB4,
    PromptRotate = 0x62800C92,
    PromptManage = 0xD7DE6B1E,
    PromptAddSupply = 0xA65EBAB4,
    PromptAddMoney = 0x156F7119,
    PromptOpen = 0xD7DE6B1E,
    PromptLock = 0x156F7119,
    --PromptLockPick = 0xA65EBAB4,
    PromptAddMeat = 0x156F7119,
    --PromptBDelivery = 0xA65EBAB4,
    PromptAddPelt = 0x156F7119,
    PromptAddPelt2 = 0x8AAA0AD4,
    PromptPropList = 0x8AAA0AD4,
    PromptSupplyMenu = 0x8AAA0AD4,
    PromptZ = 0x6319DB71,
    PromptZ2 = 0x05CA7C52,
    --PromptBuySupply = 0x6319DB71,
    PromptRotate2 = 0x8BDE7443,
}

Config.Marker = {
    rgba = {126, 0, 0, 100},
    size = {2.0, 2.0, 0.3},
}

Config.showyear = {true, "1899"}

Config.DisbandText = "DISBAND"
Config.LockpickItem = "lockpick"

Config.AcceptKey = {"U", 0xD8F73058}
Config.DeclineKey = {"Q", 0x06052D11}

Config.Texts = {
    --PROMPTS
    PromptPlace = "Place",
    PromptCancel = "Cancel",
    PromptRotate = "Rotate",
    PromptManage = "Manage",
    PromptAddSupply = "Add Supply",
    PromptAddMoney = "Deposit Money",
    PromptOpen = "Open",
    PromptLock = "Lock",
    PromptLockPick = "Lockpick",
    PromptAddMeat = "Add Meat",
    PromptBDelivery = "Start Delivery",
    PromptAddPelt = "Add Pelt",
    PromptAddPelt2 = "Select Pelt Item",
    PromptPropList = "Prop List",
    PromptSupplyMenu = "Supply Menu",
    PromptZ = "Z +",
    PromptZ2 = "Z -",
    PromptBuySupply = "Buy Supply",
    PromptRotate2 = "Rotate",
    --TEXTS
    AddAmount = "Add Amount",
    AddServerID = "Add Server ID",
    Press = "Press",
    toAccept = "to accept Camp Invite",
    toDecline = "to decline Camp Invite",
    CampTotem = "Camp Totem",
    Supply = "Supply",
    TotemClose = "Its too close to another camp!",
    CantDo = "Cant do that now!",
    M_Invite = "Invite Member",
    M_InviteD = "Invite new Member to Camp",
    M_Members = "Members",
    M_MembersD = "Check the Camp's Members",
    M_Props = "Props",
    M_PropsD = "Buy new props or change current ones",
    M_Locker = "Place Locker",
    M_LockerD = "Place a locker $",
    M_LockerD2 = "or change position",
    M_Withdraw = "Withdraw Money",
    M_WithdrawD = "Bank: $",
    M_Disband = "Disband Camp",
    M_Disband2 = "Disband the Camp and DELETE EVERYTHING",
    CampManage = "Camp Manage",
    Options = "Options",
    M_Kick = "Kick Member",
    Members = "Members",
    M_KickD = "Select to Kick Member from Camp",
    M_BuyProp = "Buy New Prop",
    M_BuyPropD = "Open Props list",
    EditProp = "Edit Prop",
    PropOptions = "Prop Options",
    Delete_Prop = "Delete Prop",
    BuyProp = "Buy Prop",
    PlaceLocker = "Place Locker",
    NeedMoreSupply = "You need more camp supply to place!",
    NoData = "No Camp data was found!",
    CampManage = "Camp Manage",
    WithdrawS = "Withdraw successful!",
    WithdrawF = "Withdraw failed!",
    NoMoney = "You dont have enough money!",
    SupplyAdded = "Supply added!",
    NoSupply = "Not enough supply!",
    NoSupplyAtAll = "You have no supply!",
    KickS = "Member was kicked from Camp!",
    NoMember = "No member was found to kick!",
    NotMember = "You don't belong to this Camp!",
    PropAdded = "Prop was added to Camp!",
    NoCampMoney = "Camp has not enough money!",
    PropRemoved = "Prop was removed from Camp!",
    LockerPurchased = "Locker was purchased!",
    LockerUpdated = "Locker was updated!",
    AlreadyCampMember = "Player is already member of the Camp!",
    AnotherCampMember = "Player is already a Camp's member!",
    InviteSent = "Invite sent to Player",
    AlreadyInvited = "Player is already invited, try later!",
    NotPossible = "This is not possible!",
    InviteCanceled = "Invite canceled!",
    CampInvite = "Camp Invite",
    InviteCanceled2 = "Player declined the invite!",
    InviteAccepted = "Accepted the invite!",
    InviteAccepted2 = "Player accepted the invite!",
    CampDisbanded = "Camp was disbanded!",
    DisbandT = "To disband Camp, type:",
    LockerD = "Locker",
    DepositS = "Deposit successful!",
    BankD = "Bank",
    UpkeepD = "Upkeep",
    DecayD = "Decay (if no supply)",
    SupplyD = "Supply",
    M_ChangeName = "Change Name",
    M_ChangeNameD = "Change the camp name",
    AddNewName = "Add New Name",
    NameChanged = "Name changed for camp!",
    CampLimitReached = "Camp Limit reached!",
    NewInvite = "You got a new invite to Camp!",
    CampLocker = "Camp Locker",
    NotOwner = "You are not the owner!",
    Owner = "You are the owner!",
    LockChanged = "Lock status changed!",
    LockerLocked = "Locker is locked!",
    LockerOpen = "The locker is open!",
    NoLockpick = "You dont have any lockpick",
    LockpickFail = "Lockpicking failed!",
    LockpickSuccess = "Lockpick success!",
    NotAtTown = "You cant do it at town!",
    WaitLockpick = "You have to wait before to do that again!",
    NotYourself = "You cant invite yourself!",
    NoMembers = "No member was found in camp!",
    SelectCategory = "Select Category",
    Remove = "Remove",
    EditPos = "Edit Position",
    EditPosDesc = "Change the position of the prop",
    PlaceButcher = "Place Butcher Table",
    M_Butcher = "Place Butcher Table",
    ButcherUpdated = "Butcher Table is updated!",
    ButcherPurchased = "Butcher Table purchased!",
    ButcherD = "Add Meat",
    ButcherTable = "Butcher Table",
    Meat = "Meat",
    CantAddModel = "You can't add this carcass!",
    NotHoldingCarcass = "You are not holding any carcass!",
    AddedCarcass = "Carcass added!",
    FullButcher = "The Butcher is full, you can deliver now!",
    PropLimit = "Prop Limit reached!",
    M_DeliveryVehicle = "Buy Delivery Vehicle",
    M_DeliveryVehicleD = "Delivery Meats with Wagon",
    AlreadyHaveWagon = "You already have Delivery Wagon",
    PurchasedWagon = "Delivery Wagon purchased!",
    NotEnoughMeat = "There is not enough Meat to deliver!",
    Distance = "Distance",
    Routes = "Routes",
    TooFarWagon = "You are too far from Camp! Canceled Delivery",
    MeatDestination = "Meat Destination",
    DeliveryFinished = "Delivery Finished!",
    FailedDelivery = "Failed Delivery!",
    GoDestination = "Go to the Destination!",
    --2023 July
    M_PeltTrader = "Pelt Trader Table",
    PlacePeltTrader = "Place Pelt Table",
    PeltTablePurchased = "Pelt Trader Table purchased!",
    PeltTableUpdated = "Pelt Trader updated!",
    AddedPelt = "Added pelt!",
    CantAddModel2 = "You can't add this pelt!",
    SelectDelivery = "Select to Delivery",
    SelectRoute = "Select Destination",
    StoredPelts = "Stored Pelts",
    --SUPPLY TABLE
    M_SupplyTable = "Supply Table",
    PlaceSupplyTable = "Place Supply Table",
    SupplyTablePurchased = "Supply Table Purchased!",
    SupplyTableUpdated = "Supply Table Updated!",
    AddProduct = "Add Product",
    SupplyAdd = "Supply Adding",
    --LOCKER TEXT FIX
    OthersClose = "You must be alone near the Locker to open!",
    --MAX MEMBER UPDATE
    MaxMemberReached = "Max member reached already!",
    CampFull = "Camp is full!",
    NotEnoughPelt = "Not enough pelt!",
    --
    NoPeltHand = "No pelt in your hand!",
    --
    NoVehicle = "No Delivery Vehicle purchased!",
    --
    PlaceCloser = "Place Butcher/Pelt Table closer to Flag!",
    NoMoneyItem = "No money at Camp, or you dont have the items!",
    --
    Locked = "Locked",
    Opened = "Opened",
    --
    DeliveryPropAdded = "Delivery Vehicle Prop was added already!",
    --
    NoPeltInv = "No pelt in your inventory!",
    NoPeltDelivery = "No pelt for delivery!",
    --
    Camp = "Camp",
}

Config.Textures = {
    cross = {"scoretimer_textures", "scoretimer_generic_cross"},
    locked = {"menu_textures","stamp_locked_rank"},
    tick = {"scoretimer_textures","scoretimer_generic_tick"},
    money = {"inventory_items", "money_moneystack"},
    alert = {"menu_textures", "menu_icon_alert"},
}

Config.MinimumDistanceBewteenCamps = 150.0

Config.CampProps = {
    {
        category_name = "Hitching Posts",
        items = { 
            {model = `p_hitchingpost01x`, name = "Hitching Post 1", upkeep = 1, cost = {{id = "woodlog", label = "Woodlog", amount = 2, type = "item"}, {type = "money", amount = 5}}, sell = 5},
            {model = `p_hitchingpost04x`, name = "Hitching Post 2", upkeep = 1, cost = 10},
            {model = `p_hitchingpost05x`, name = "Hitching Post 3", upkeep = 1, cost = 10},
            {model = `s_hitchpo02x`, name = "Hitching Post 4", upkeep = 1, cost = 10},
            {model = `p_hitchpostbla01x`, name = "Hitching Post 5", upkeep = 1, cost = 10},
            {model = `p_horsehitchnbd01x`, name = "Hitching Post 6", upkeep = 1, cost = 10},
        }
    },
    {
        category_name = "Torch",
        items = { 
            {model = `p_torchpostalwayson01x`, name = "Torch 1", upkeep = 1, cost = 5},
            {model = `p_torchpost01x`, name = "Torch 2", upkeep = 1, cost = 5},
            {model = `mp004_p_torchposttall01x`, name = "Torch 3", upkeep = 1, cost = 5},
        }
    },
    {
        category_name = "Tables",
        items = { 
            {model = `p_table11x`, name = "Table 1", upkeep = 1, cost = 15},
            {model = `mp005_p_mp_tableplank04x`, name = "Table 2", upkeep = 1, cost = 15},
            {model = `mp009_p_mp009_cratetable01x`, name = "Table 3", upkeep = 1, cost = 15},
            {model = `p_bespoketable01x`, name = "Table 4", upkeep = 1, cost = 15},
            {model = `p_blackjacktable02x`, name = "Table 5", upkeep = 1, cost = 15},
            {model = `p_cratetablemil01x`, name = "Table 6", upkeep = 1, cost = 15},
            {model = `p_gen_table01x`, name = "Table 7", upkeep = 1, cost = 15},
            {model = `p_gen_table02x`, name = "Table 8", upkeep = 1, cost = 15},
            {model = `p_gen_table03x`, name = "Table 9", upkeep = 1, cost = 15},
            {model = `p_gen_table04x`, name = "Table 10", upkeep = 1, cost = 15},
        }
    },
    {
        category_name = "Tents",
        items = { 
            {model = `p_cs_camptent01x`, name = "Tent 1", upkeep = 3, cost = 50},
            {model = `p_ambtentleather01b`, name = "Tent 2", upkeep = 1, cost = 30},
            {model = `p_gangtentlemoyne01x`, name = "Tent 3", upkeep = 1, cost = 30},
            {model = `mp001_p_mp_tent_leento03x`, name = "Tent 4", upkeep = 1, cost = 30},
            {model = `mp005_s_tentdoctor01x`, name = "Tent 5", upkeep = 1, cost = 30},
            {model = `mp007_p_tentharriet01x`, name = "Tent 6", upkeep = 1, cost = 30},
            {model = `p_ambtentbark01b`, name = "Tent 7", upkeep = 1, cost = 30},
            {model = `p_ambtentdebris01x`, name = "Tent 8", upkeep = 1, cost = 40},
            {model = `p_ambtentgrass01x`, name = "Tent 9", upkeep = 1, cost = 40},
            {model = `p_ambtenthide01b`, name = "Tent 10", upkeep = 1, cost = 40},
            {model = `p_ambtenthide01x`, name = "Tent 11", upkeep = 1, cost = 50},
            {model = `p_sap_maple_aa_sim`, name = "Tent 12", upkeep = 2, cost = 40},
            {model = `p_ambtentleather01b`, name = "Tent 13", upkeep = 1, cost = 30},
            {model = `p_ambtentleather01x`, name = "Tent 14", upkeep = 2, cost = 40},
            {model = `p_ambtentoilskin01b`, name = "Tent 15", upkeep = 2, cost = 40},
            {model = `p_ambtentoilskin01x`, name = "Tent 16", upkeep = 2, cost = 40},
            {model = `p_ambtentscrub01b`, name = "Tent 17", upkeep = 1, cost = 30},
            {model = `p_ambtentscrub01x`, name = "Tent 18", upkeep = 1, cost = 30},
            {model = `p_ambtentsticks01x`, name = "Tent 19", upkeep = 2, cost = 40},
            {model = `p_ambtentswamp01x`, name = "Tent 20", upkeep = 2, cost = 40},
            {model = `p_tentmexican01x`, name = "Tent 21", upkeep = 3, cost = 50},
            {model = `p_tentplain01x`, name = "Tent 22", upkeep = 3, cost = 50},
            {model = `s_tentbison01x`, name = "Tent 23", upkeep = 2, cost = 40},
            {model = `s_tentwedge01x`, name = "Tent 23", upkeep = 2, cost = 40},
            {model = `p_ambtentmulch01x`, name = "Tent 24", upkeep = 2, cost = 40},
            {model = `p_gangtentlemoyne01x`, name = "Tent 25", upkeep = 2, cost = 40},
        }
    },
    -- {
    --     category_name = "Tippis",
    --     items = { 
    --         {model = `tippi1`, name = "Tippi 1", upkeep = 3, cost = 30},
    --         {model = `tippi2`, name = "Tippi 2", upkeep = 1, cost = 30},
            
    --     }
    -- },
    -- {
    --     category_name = "Chest Props",
    --     items = { 
    --         {model = `s_waterloggedchest01x`, name = "Chest 1 (not Locker)", upkeep = 2, cost = 40},
    --         {model = `p_chestmedice01x`, name = "Chest 2 (not Locker)", upkeep = 2, cost = 40},
    --         {model = `p_chestmedbin01x`, name = "Chest 3 (not Locker)", upkeep = 2, cost = 40},
    --         {model = `p_chestmedburied01x`, name = "Chest 4 (not Locker)", upkeep = 2, cost = 40},
            
    --     }
    -- },
    {
        category_name = "Chairs",
        items = { 
            {model = `p_armchair01x`, name = "Chair 1", upkeep = 1, cost = 30},
            {model = `p_chair21x_fussar`, name = "Chair 2", upkeep = 1, cost = 30},
            {model = `p_chairrustic01x`, name = "Chair 3", upkeep = 1, cost = 30},
            {model = `p_chairrustic02x`, name = "Chair ", upkeep = 1, cost = 30},
            {model = `p_chairrustic03x`, name = "Chair ", upkeep = 1, cost = 30},
            {model = `p_chairrustic04x`, name = "Chair ", upkeep = 1, cost = 30},
            {model = `p_chairrustic05x`, name = "Chair ", upkeep = 1, cost = 30},
        }
    },
    {
        category_name = "Fences",
        items = { 
            {model = `p_app_stablefence01x`, name = "Fence 1", upkeep = 1, cost = 50},
            {model = `p_app_stablefence01ax`, name = "Fence 2", upkeep = 1, cost = 50},
            {model = `p_app_stablefence02x`, name = "Fence 3", upkeep = 1, cost = 50},
            {model = `p_app_stablegate01x`, name = "Fence 3", upkeep = 1, cost = 50},
            {model = `p_app_stablegate02x`, name = "Fence 3", upkeep = 1, cost = 50},
            {model = `p_app_stablefence06x`, name = "Fence 3", upkeep = 1, cost = 50},
            {model = `p_app_stablepost01x`, name = "Fence 3", upkeep = 1, cost = 50},
        }
    },
    -- {
    --     category_name = "Delivery Vehicle",
    --     items = { 
    --         {model = `p_clivewagon01x`, name = "Delivery Vehicle", upkeep = 0, cost = 0, id = "delivery_vehicle"},
    --     }
    -- },
}

Config.RequiredSupplyAtTotemPlace = 1
Config.CampSupplyCostDaily = 5
Config.TotemObject = `mp001_p_mp_flag01x`
Config.LockerObject = `s_waterloggedchest01x`
Config.ButcherObject = `p_tablesav01x`
Config.LockerPrice = 50 --$
Config.ButcherPrice = 100 --$

Config.DeliveryVehicle = {
    price = 500,--$
    model = `WAGON04X`,
    propset = `pg_vl_hunter01`,
    GPS_Color = "COLOR_GREEN",
    DistanceToFailBeforeSpawn = 20.0, --the maximum distance the player can walk away from the Camp to spawn the Delivery Vehicle after selecting Route to start
    DestinationBlip = -426139257,
    DistanceToFailBetweenPlayerWagon = 50.0, --the maximum distance between the player and the delivery wagon before the delivery fails
    pelt_propset = `pg_vl_tradesman01`,
}

Config.Towns = {
    `Annesburg`,
    `Armadillo`,
    `Blackwater`, 
    `BeechersHope`,
    `Braithwaite`,
    `Caliga`,
    `cornwall`,
    `Butcher`,
    `Emerald`,
    `lagras`,
    `Manzanita`,
    `Siska`,
    `Rhodes`,
    `StDenis`,
    `Strawberry`,
    `Tumbleweed`,
    `valentine`,
    `VANHORN`,
    `AguasdulcesVilla`,
}

Config.ButcherMeatsRequiredToDelivery = 1000 --Camp needs this amount of Meats at Butcher Table in order to start Delivery Mission
Config.DisableDeliveryTimer = false --if true then the timer will be disabled for delivery

Config.DeliveryRoutes = {
    {label = "Bacchus Station", pos = vector3(599.221, 1662.824, 185.777), distance_price = 0.03, distance_time = 0.15 --[[, static_price = 50,]]},--use static price if you want static price for delivery route
    {label = "Riggs Station", pos = vector3(-1083.554, -578.766, 81.315), distance_price = 0.05, distance_time = 0.15},
}

Config.DeliveryRoutesPelt = {
    {label = "Bacchus Station", pos = vector3(599.221, 1662.824, 185.777), distance_time = 0.15, price_multiplier = 1.2},
    {label = "Riggs Station", pos = vector3(-1083.554, -578.766, 81.315), distance_time = 0.15, price_multiplier = 1.1},
}

Config.ButcherCarcassMeats = {
    [`a_c_alligator_03`] = {label = "Alligator", given_meats = 6},
    [`a_c_armadillo_01`] = {label = "Armadillo", given_meats = 3},
    [`a_c_badger_01`] = {label = "Badger", given_meats = 2},
    [`a_c_beaver_01`] = {label = "Beaver", given_meats = 4},
    [`a_c_bighornram_01`] = {label = "Big Horn Ram", given_meats = 5},
    [`a_c_buck_01`] = {label = "Buck", given_meats = 5},
    [`a_c_californiacondor_01`] = {label = "Californian Condor", given_meats = 3},
    [`a_c_chicken_01`] = {label = "Chicken", given_meats = 1},
    [`a_c_cormorant_01`] = {label = "Cormorant", given_meats = 2},
    [`a_c_cougar_01`] = {label = "Cougar", given_meats = 6},
    [`a_c_coyote_01`] = {label = "Coyote", given_meats = 4},
    [`a_c_cranewhooping_01`] = {label = "Crane", given_meats = 3},
    [`a_c_deer_01`] = {label = "Deer", given_meats = 5},
    [`a_c_duck_01`] = {label = "Duck", given_meats = 3},
    [`a_c_eagle_01`] = {label = "Eagle", given_meats = 3},
    [`a_c_egret_01`] = {label = "Egret", given_meats = 4},
    [`a_c_fishchannelcatfish_01_lg`] = {label = "Catfish", given_meats = 4},
    [`a_c_fishchannelcatfish_01_xl`] = {label = "Catfish Large", given_meats = 4},
    [`a_c_fishlakesturgeon_01_lg`] = {label = "Lake Sturgeon", given_meats = 4},
    [`a_c_fishlongnosegar_01_lg`] = {label = "Longnose Gar", given_meats = 4},
    [`a_c_fishmuskie_01_lg`] = {label = "Muskie", given_meats = 4},
    [`a_c_fishnorthernpike_01_lg`] = {label = "Northern Pike", given_meats = 4},
    [`a_c_fox_01`] = {label = "Fox", given_meats = 4},
    [`a_c_gilamonster_01`] = {label = "Gila monster", given_meats = 3},
    [`a_c_goat_01`] = {label = "Goat", given_meats = 4},
    [`a_c_goosecanada_01`] = {label = "Goose", given_meats = 3},
    [`a_c_hawk_01`] = {label = "Hawk", given_meats = 3},
    [`a_c_heron_01`] = {label = "Heron", given_meats = 3},
    [`a_c_iguana_01`] = {label = "Iguana", given_meats = 2},
    [`a_c_iguanadesert_01`] = {label = "Desert Iguana", given_meats = 2},
    [`a_c_loon_01`] = {label = "Loon", given_meats = 2},
    [`a_c_muskrat_01`] = {label = "Muskrat", given_meats = 1},
    [`a_c_owl_01`] = {label = "Owl", given_meats = 3},
    [`a_c_panther_01`] = {label = "Panther", given_meats = 6},
    [`a_c_parrot_01`] = {label = "Parrot", given_meats = 2},
    [`a_c_pelican_01`] = {label = "Pelican", given_meats = 3},
    [`a_c_pheasant_01`] = {label = "Pheasant", given_meats = 2},
    [`a_c_pig_01`] = {label = "Pig", given_meats = 5},
    [`a_c_possum_01`] = {label = "Opossum", given_meats = 2},
    [`a_c_prairiechicken_01`] = {label = "Prairie Chicken", given_meats = 2},
    [`a_c_pronghorn_01`] = {label = "Pronghorn", given_meats = 6},
    [`a_c_rabbit_01`] = {label = "Rabbit", given_meats = 2},
    [`a_c_raccoon_01`] = {label = "Raccon", given_meats = 3},
    [`a_c_raven_01`] = {label = "Raven", given_meats = 2},
    [`a_c_redfootedbooby_01`] = {label = "Red Footed Booby", given_meats = 5},
    [`a_c_rooster_01`] = {label = "Rooster", given_meats = 3},
    [`a_c_roseatespoonbill_01`] = {label = "Spoonbill", given_meats = 3},
    [`a_c_seagull_01`] = {label = "Seagull", given_meats = 3},
    [`a_c_sheep_01`] = {label = "Sheep", given_meats = 5},
    [`a_c_skunk_01`] = {label = "Skunk", given_meats = 2},
    [`a_c_snake_01`] = {label = "Snake", given_meats = 2},
    [`a_c_snakeblacktailrattle_01`] = {label = "Blacktail rattlesnake", given_meats = 2},
    [`a_c_snakeferdelance_01[`] = {label = "Fer de lance snake", given_meats = 2},
    [`a_c_snakeredboa_01`] = {label = "Boa", given_meats = 2},
    [`a_c_snakewater_01`] = {label = "Water snake", given_meats = 2},
    [`a_c_turkey_01`] = {label = "Turkey (1)", given_meats = 3},
    [`a_c_turkey_02`] = {label = "Turkey (2)", given_meats = 3},
    [`a_c_turkeywild_01`] = {label = "Wild Turkey", given_meats = 4},
    [`a_c_turtlesnapping_01`] = {label = "Snapping Turtle", given_meats = 4},
    [`a_c_vulture_01`] = {label = "Vulture", given_meats = 3},
    [`a_c_wolf`] = {label = "Wolf (1)", given_meats = 5},
    [`a_c_wolf_medium`] = {label = "Wolf (2)", given_meats = 5},
    [`a_c_wolf_small`] = {label = "Wolf (3)", given_meats = 4},
    [`mp_a_c_beaver_01`] = {label = "Legendary Beaver", given_meats = 6},
    [`mp_a_c_bighornram_01`] = {label = "Legendary Ram", given_meats = 6},
    [`mp_a_c_buck_01`] = {label = "Legendary Buck", given_meats = 6},
    [`mp_a_c_cougar_01`] = {label = "Legendary Cougar", given_meats = 6},
    [`mp_a_c_coyote_01`] = {label = "Legendary Coyote", given_meats = 6},
    [`mp_a_c_fox_01`] = {label = "Legendary Fox", given_meats = 6},
    [`mp_a_c_owl_01`] = {label = "Legendary Owl", given_meats = 6},
    [`mp_a_c_panther_01`] = {label = "Legendary Panther", given_meats = 6},
    [`mp_a_c_wolf_01`] = {label = "Legendary Wolf", given_meats = 6},
}

Config.Pelts = {
    --[id] = {label, itemname, base_price} -- Change the label and base_price (1st and 3rd array elements) 
    [`PROVISION_BEAR_FUR_POOR`] = {"Bear Fur (Poor)", "bear_pelt_poor", 35}, -- 35 is the base_price
    [`PROVISION_BEAR_FUR_PRISTINE`] = {"Bear Fur (Pristine)", "bear_pelt_pristine",35},
    [`PROVISION_BEAR_FUR`] = {"Bear Fur (Good)", "bear_pelt_good", 35},
    [`PROVISION_BEAR_LEGENDARY_FUR_PRISTINE`] = {"Legendary Bear Fur", "legendary_bear_pelt", 35},
    [`PROVISION_BEAVER_FUR_POOR`] = {"Beaver Fur (Poor)", "beaver_pelt_poor", 35},
    [`PROVISION_BEAVER_FUR_PRISTINE`] = {"Beaver Fur (Pristine)", "beaver_pelt_pristine", 35},
    [`PROVISION_BEAVER_FUR`] = {"Beaver Fur (Good)", "beaver_pelt_good", 35},
    [`PROVISION_BEAVER_LEGENDARY_FUR_PRISTINE`] = {"Legendary Beaver Fur", "legendary_beaver_pelt", 35},
    [`PROVISION_BLACK_BEAR_FUR_POOR`] = {"Black Bear Fur (Poor)", "black_bear_pelt_poor", 35},
    [`PROVISION_BLACK_BEAR_FUR_PRISTINE`] = {"Black Bear Fur (Pristine)", "black_bear_pelt_pristine", 35},
    [`PROVISION_BLACK_BEAR_FUR`] = {"Black Bear Fur (Good)", "black_bear_pelt_good", 35},
    [`PROVISION_BOAR_LEGENDARY_SKIN_PRISTINE`] = {"Legendary Boar Skin", "legendary_boar_pelt", 35},
    [`PROVISION_BOAR_SKIN_POOR`] = {"Boar Skin (Poor)", "boar_pelt_poor", 35},
    [`PROVISION_BOAR_SKIN_PRISTINE`] = {"Boar Skin (Pristine)", "boar_pelt_pristine", 35},
    [`PROVISION_BOAR_SKIN`] = {"Boar Skin (Good)", "boar_pelt_good", 35},
    [`PROVISION_BUCK_FUR_POOR`] = {"Buck Fur (Poor)", "buck_pelt_poor", 35},
    [`PROVISION_BUCK_FUR_PRISTINE`] = {"Buck Fur (Pristine)", "buck_pelt_pristine", 35},
    [`PROVISION_BUCK_FUR`] = {"Buck Fur (Good)", "buck_pelt_good", 35},
    [`PROVISION_BUCK_LEGENDARY_FUR_PRISTINE`] = {"Legendary Buck Fur", "legendary_buck_pelt", 35},
    [`PROVISION_BUFFALO_FUR_POOR`] = {"Buffalo Fur (Poor)", "buffalo_pelt_poor", 35},
    [`PROVISION_BUFFALO_FUR_PRISTINE`] = {"Buffalo Fur (Pristine)", "buffalo_pelt_pristine", 35},
    [`PROVISION_BUFFALO_FUR`] = {"Buffalo Fur (Good)", "buffalo_pelt_good", 35},
    [`PROVISION_BULL_HIDE_POOR`] = {"Bull Hide (Poor)", "bull_pelt_poor", 35},
    [`PROVISION_BULL_HIDE_PRISTINE`] = {"Bull Hide (Pristine)", "bull_pelt_pristine", 35},
    [`PROVISION_BULL_HIDE`] = {"Bull Hide (Good)", "bull_pelt_good", 35},
    [`PROVISION_COUGAR_FUR_POOR`] = {"Cougar Fur (Poor)", "cougar_pelt_poor", 35},
    [`PROVISION_COUGAR_FUR_PRISTINE`] = {"Cougar Fur (Pristine)", "cougar_pelt_pristine", 35},
    [`PROVISION_COUGAR_FUR`] = {"Cougar Fur (Good)", "cougar_pelt_good", 35},
    [`PROVISION_COUGAR_LEGENDARY_FUR_PRISTINE`] = {"Legendary Cougar Fur", "legendary_cougar_pelt", 35},
    [`PROVISION_COW_HIDE_POOR`] = {"Cow Hide (Poor)", "cow_pelt_poor", 35},
    [`PROVISION_COW_HIDE_PRISTINE`] = {"Cow Hide (Pristine)", "cow_pelt_pristine", 35},
    [`PROVISION_COW_HIDE`] = {"Cow Hide (Good)", "cow_pelt_good", 35},
    [`PROVISION_COYOTE_FUR_POOR`] = {"Coyote Fur (Poor)", "coyote_pelt_poor", 35},
    [`PROVISION_COYOTE_FUR_PRISTINE`] = {"Coyote Fur (Pristine)", "coyote_pelt_pristine", 35},
    [`PROVISION_COYOTE_FUR`] = {"Coyote Fur (Good)", "coyote_pelt_good", 35},
    [`PROVISION_COYOTE_LEGENDARY_FUR_PRISTINE`] = {"Legendary Coyote Fur", "legendary_coyote_pelt", 35},
    [`PROVISION_DEER_HIDE_POOR`] = {"Hide (Poor)", "base_pelt_poor", 35},
    [`PROVISION_DEER_HIDE_PRISTINE`] = {"Hide (Pristine)", "base_pelt_pristine", 35},
    [`PROVISION_DEER_HIDE`] = {"Hide (Good)", "base_pelt_good", 35},
    [`PROVISION_ELK_FUR_POOR`] = {"Elk Fur (Poor)", "elk_pelt_poor", 35},
    [`PROVISION_ELK_FUR_PRISTINE`] = {"Elk Fur (Pristine)", "elk_pelt_pristine", 35},
    [`PROVISION_ELK_FUR`] = {"Elk Fur (Good)", "elk_pelt_good", 35},
    [`PROVISION_ELK_LEGENDARY_FUR_PRISTINE`] = {"Legendary Elk Fur", "legendary_elk_pelt", 35},
    [`PROVISION_FOX_FUR_POOR`] = {"Fox Fur (Poor)", "fox_pelt_poor", 35},
    [`PROVISION_FOX_FUR_PRISTINE`] = {"Fox Fur (Pristine)", "fox_pelt_pristine", 35},
    [`PROVISION_FOX_FUR`] = {"Fox Fur (Good)", "fox_pelt_good", 35},
    [`PROVISION_FOX_LEGENDARY_FUR_PRISTINE`] = {"Legendary Fox Fur", "legendary_fox_pelt", 35},
    [`PROVISION_GOAT_HAIR_POOR`] = {"Goat Hair (Poor)", "goat_pelt_poor", 35},
    [`PROVISION_GOAT_HAIR_PRISTINE`] = {"Goat Hair (Pristine)", "goat_pelt_pristine", 35},
    [`PROVISION_GOAT_HAIR`] = {"Goat Hair (Good)", "goat_pelt_good", 35},
    [`PROVISION_JAVELINA_SKIN_POOR`] = {"Javelina Skin (Poor)", "javelina_pelt_poor", 35},
    [`PROVISION_JAVELINA_SKIN_PRISTINE`] = {"Javelina Skin (Pristine)", "javelina_pelt_pristine", 35},
    [`PROVISION_JAVELINA_SKIN`] = {"Javelina Skin (Good)", "javelina_pelt_good", 35},
    [`PROVISION_MOOSE_FUR_POOR`] = {"Moose Fur (Poor)", "moose_pelt_poor", 35},
    [`PROVISION_MOOSE_FUR_PRISTINE`] = {"Moose Fur (Pristine)", "moose_pelt_pristine", 35},
    [`PROVISION_MOOSE_FUR`] = {"Moose Fur (Good)", "moose_pelt_good", 35},
    [`PROVISION_MOOSE_LEGENDARY_FUR_PRISTINE`] = {"Legendary Moose Fur", "legendary_moose_pelt", 35},
    [`PROVISION_OXEN_HIDE_POOR`] = {"Oxen Hide (Poor)", "ox_pelt_poor", 35},
    [`PROVISION_OXEN_HIDE_PRISTINE`] = {"Oxen Hide (Pristine)", "ox_pelt_pristine", 35},
    [`PROVISION_OXEN_HIDE`] = {"Oxen Hide (Good)", "ox_pelt_good", 35},
    [`PROVISION_PANTHER_FUR_POOR`] = {"Panther Fur (Poor)", "panther_pelt_poor", 35},
    [`PROVISION_PANTHER_FUR_PRISTINE`] = {"Panther Fur (Pristine)", "panther_pelt_pristine", 35},
    [`PROVISION_PANTHER_FUR`] = {"Panther Fur (Good)", "panther_pelt_good", 35},
    [`PROVISION_PANTHER_LEGENDARY_FUR_PRISTINE`] = {"Legendary Panther Fur", "legendary_panther_pelt", 35},
    [`PROVISION_PIG_SKIN_POOR`] = {"Pig Skin (Poor)", "pig_pelt_poor", 35},
    [`PROVISION_PIG_SKIN_PRISTINE`] = {"Pig Skin (Pristine)", "pig_pelt_pristine", 35},
    [`PROVISION_PIG_SKIN`] = {"Pig Skin (Good)", "pig_pelt_good", 35},
    [`PROVISION_PRONGHORN_FUR_POOR`] = {"Pronghorn Fur (Poor)", "pronghorn_pelt_poor", 35},
    [`PROVISION_PRONGHORN_FUR_PRISTINE`] = {"Pronghorn Fur (Pristine)", "pronghorn_pelt_pristine", 35},
    [`PROVISION_PRONGHORN_FUR`] = {"Pronghorn Fur (Good)", "pronghorn_pelt_good", 35},
    [`PROVISION_PRONGHORN_LEGENDARY_FUR_PRISTINE`] = {"Legendary Pronghorn Fur", "legendary_pronghorn_pelt", 35},
    [`PROVISION_RAM_HIDE_POOR`] = {"Ram Hide (Poor)", "ram_pelt_poor", 35},
    [`PROVISION_RAM_HIDE_PRISTINE`] = {"Ram Hide (Pristine)", "ram_pelt_pristine", 35},
    [`PROVISION_RAM_HIDE`] = {"Ram Hide (Good)", "ram_pelt_good", 35},
    [`PROVISION_RAM_LEGENDARY_HIDE_PRISTINE`] = {"Legendary Ram Hide", "legendary_ram_pelt", 35},
    [`PROVISION_SHEEP_WOOL_POOR`] = {"Sheep Wool (Poor)", "sheep_pelt_poor", 35},
    [`PROVISION_SHEEP_WOOL_PRISTINE`] = {"Sheep Wool (Pristine)", "sheep_pelt_pristine", 35},
    [`PROVISION_SHEEP_WOOL`] = {"Sheep Wool (Good)", "sheep_pelt_good", 35},
    [`PROVISION_TAKANTA_BUFFALO_LEGENDARY_FUR_PRISTINE`] = {"Takanta Buffalo Fur", "takanta_bison_pelt", 35},
    [`PROVISION_WHITE_BUFFALO_LEGENDARY_FUR_PRISTINE`] = {"Whtie Buffalo Fur", "white_bison_pelt", 35},
    [`PROVISION_WOLF_FUR_POOR`] = {"Wolf Fur (Poor)", "wolf_pelt_poor", 35},
    [`PROVISION_WOLF_FUR_PRISTINE`] = {"Wolf Fur (Pristine)", "wolf_pelt_pristine", 35},
    [`PROVISION_WOLF_FUR`] = {"Wolf Fur (Good)", "wolf_pelt_good", 35},
    [`PROVISION_WOLF_LEGENDARY_FUR_PRISTINE`] = {"Legendary Wolf Fur", "legendary_wolf_pelt", 35},
    [`provision_alligator_skin_pristine`] = {"Small Alligator Skin (Pristine)", "alligator_s_pelt_pristine", 35},
    [`provision_alligator_skin_poor`] = {"Small Alligator Skin (Poor)", "alligator_s_pelt_poor", 35},
    [`provision_alligator_skin`] = {"Small Alligator Skin (Good)", "alligator_s_pelt_good", 35},
    [-1243878166] = {"Alligator Skin (Poor)", "alligator_pelt_poor", 35},
    [-1475338121] = {"Alligator Skin (Pristine)", "alligator_pelt_pristine", 35},
    --MULTI LEGENDARIES
    [1418435161] = {"Ridgeback Spirit Bear Pelt", "spirit_bear_pelt", 35},
    [1181154860] = {"Owiza Bear Pelt", "owiza_bear_pelt", 35},
    [1511236969] = {"Golden Spirit Bear Pelt", "golden_bear_pelt", 35},
    
    [-1621144167] = {"Sungator Skin", "sungator_pelt", 35},
    [-1061253029] = {"Banded Allligator Skin", "banded_gator_pelt", 35},
    [-1924159110] = {"Teca Gator Skin", "teca_gator_pelt", 35},

    [-1787430524] = {"Night Beaver Pelt", "night_beaver_pelt", 35},
    [-251416414] = {"Moon Beaver Pelt", "moon_beaver_pelt", 35},
    [121494806] = {"Zizi Beaver Pelt", "zizi_beaver_pelt", 35},

    [-591844128] = {"Rutile Horn Ram Pelt", "rutile_ram_pelt", 35},
    [-675142890] = {"Gabbro Horn Ram Pelt", "gabbro_ram_pelt", 35},
    [-906131571] = {"Chalk Horn Ram Pelt", "chalk_ram_pelt", 35},

    [-940052481] = {"Icahi Boar Pelt", "icahi_boar_pelt", 35},
    [-1249752300] = {"Wakpa Boar Pelt", "wakpa_boar_pelt", 35},
    [-1572330336] = {"Cogi Boar Pelt", "cogi_boar_pelt", 35},

    [-1218522879] = {"Snowy Buck Pelt", "snowy_buck_pelt", 35},
    [-308200059] = {"Mudrunner Buck Pelt", "mudrunner_buck_pelt", 35},
    [923422806] = {"Shadow Buck Pelt", "shadow_buck_pelt", 35},

    [-260181673] = {"Tatanka Bison Pelt", "tatanka_bison_pelt", 35},
    [-857265622] = {"Payta Bison Pelt", "payta_bison_pelt", 35},
    [-1087205695] = {"Winyan Bison Pelt", "winyan_bison_pelt", 35},

    [219794592] = {"Sapa Cougar Pelt", "sapa_cougar_pelt", 35},
    [397926876] = {"Maza Cougar Pelt", "maza_cougar_pelt", 35},
    [832214437] = {"Iguga Cougar Pelt", "iguga_cougar_pelt", 35},

    [1009802015] = {"Milk Coyote Pelt", "milk_coyote_pelt", 35},
    [1728819413] = {"Midnight Paw Coyote Pelt", "midnightpaw_coyote_pelt", 35},
    [-1061362634] = {"Red Streak Coyote Pelt", "redstreak_coyote_pelt", 35},

    [1276143905] = {"Ota Fox Pelt", "ota_fox_pelt", 35},
    [-1262044528] = {"Marble Fox Pelt", "marble_fox_pelt", 35},
    [-963027403] = {"Cross Fox Pelt", "cross_fox_pelt", 35},
    
    [-1195518864] = {"Ozula Elk Pelt", "ozula_elk_pelt", 35},
    [-159428614] = {"Inahme Elk Pelt", "inahme_elk_pelt", 35},
    [-420237085] = {"Katata Elk Pelt", "katata_elk_pelt", 35},

    [739090883] = {"Snowflake Moose Pelt", "snowflake_moose_pelt", 35},
    [1043121665] = {"Knight Moose Pelt", "knight_moose_pelt", 35},
    [-634716689] = {"Ruddy Moose Pelt", "ruddy_moose_pelt", 35},

    [1600479946] = {"Iwakta Panther Pelt", "iwakta_panther_pelt", 35},
    [836208559] = {"Ghost Panther Pelt", "ghost_panther_pelt", 35},
    [2088901891] = {"Nightwalker Panther Pelt", "nightwalker_panther_pelt", 35},

    [-1946740647] = {"Emerald Wolf Pelt", "emerald_wolf_pelt", 35},
    [-907373381] = {"Moonstone Wolf Pelt", "moonstone_wolf_pelt", 35},
    [-1548204069] = {"Onyx Wolf Pelt", "onyx_wolf_pelt", 35},
}

--[[
    --REDEM:RP INVENTORY ITEM

    ["camp_totem"] = { label = "Camp Totem", description = "Place it and create a totem", weight = 0.05, canBeDropped = true, canBeUsed = true, requireLvl = 0, limit = 5, imgsrc = "items/camp_totem.png", type = "item_standard",},
    ["camp_supply"] = { label = "Camp Supply", description = "Use at camps to avoid camp decay", weight = 0.001, canBeDropped = true, canBeUsed = false, requireLvl = 0, limit = 2000, imgsrc = "items/camp_supply.png", type = "item_standard",},

    --QBR/QR/RSG INVENTORY
    ['camp_totem'] 					= {['name'] = 'camp_totem', 			 	  	['label'] = 'Camp Totem',	    				['weight'] = 1,			['type'] = 'item', 				['image'] = 'camp_totem.png', 					['unique'] = false, 	['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,    	['level'] = 0,		['description'] = 'Place to create camp'},
	['camp_supply'] 			    = {['name'] = 'camp_supply', 			 	  	['label'] = 'Camp Supply',	    				['weight'] = 1,			['type'] = 'item', 				['image'] = 'camp_supply.png', 					['unique'] = false, 	['useable'] = false, 	['shouldClose'] = true,   ['combinable'] = nil,    	['level'] = 0,		['description'] = 'Use at camps to avoid camp decay'},
	
]]
