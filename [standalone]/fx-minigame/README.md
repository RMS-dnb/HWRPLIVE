# FX-Minigame
RedM Bar Minigame

# insatallation

- `ensure fx-minigame` in the top of your resources.cfg 

# Credit
* credit goes to the firestix77 taskbarskill for basecode and functionality
# Example
```lua
RegisterCommand("minigame", function()
    local finished = exports["fx-minigame"]:taskBar(3700, 1)
    if finished == 100 then 
        print('done')
    end
end)
```
# Media
![image](https://github.com/Fixitfy/fx-minigame/assets/139653962/40cb7cf8-d055-4bda-b027-a966f48e8d9b)

![Screenshot_33](https://github.com/Fixitfy/fx-minigame/assets/139653962/72a3b82d-03f3-424d-b22e-3dd6d5426df0)
