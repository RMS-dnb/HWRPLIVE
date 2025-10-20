to enable contact in radialmenu, make sure set Config.EnableContactRadial = true

-- rsg-core
```lua
            {
                id= 'adressbook',
                title = 'Adress book',
                icon = 'address-book',
                type = 'client',
                event = 'bangdai-telegram:client:OpenAddressBook',
                shouldClose = true
            },
```
other framework

can use this event

clientside
```lua

TriggerEvent('bangdai-telegram:client:OpenAddressBook')

    or 

exports['bangdai-telegram']:OpenAddressbook()
```

to open use your own script or add for job
```lua
local city = 'string'
local state = 'string'
exports['bangdai-telegram']:OpenTelegram(city, state)
```