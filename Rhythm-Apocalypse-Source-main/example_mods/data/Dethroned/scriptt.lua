function onCreate()
        setProperty("skipCountdown", true)
    makeLuaSprite("blackScreener","",-200,-200)
    makeGraphic("blackScreener",screenWidth+400,screenHeight+400,"000000")
    addLuaSprite("blackScreener")
    setObjectCamera("blackScreener","other")

    
end

function onSongStart()
    doTweenAlpha("showShit","blackScreener",0,13)
end