# nakres_skill_minigame

[DOCS](https://docs.nakres.dev/resources/scripts/minigame-skillbar)



MiniGame = exports['nakres_skill_minigame']:GetMiniGame();
local sdata =  {
            difficultyFactor = 0.98,
            lineSpeedUp = 1,
            time = 15,
            halfSuccessMin = 80,
            valueUpSpeed = 0.5,
            valueDownSpeed = 0.3,
            areaMoveSpeed = 0.5,
            img = "img/fire.webp"
}
 MiniGame.Start(sdata,
        function()
            print("success")
        end,
        function()
            print("fail")
        end,
        function()
            print("halfSuccess")
        end
        )