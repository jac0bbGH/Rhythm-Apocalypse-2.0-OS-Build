function onCreate()
    makeLuaText('dbug', "curStep: 0", 800, 535, 20)
    setTextSize('dbug', 40)
    setTextColor('dbug', 'FFFFFF')
    setObjectCamera('dbug','other')
    addLuaText('dbug',true)
end

function onUpdate(elapsed)
    songPos = getSongPosition()
    currentStep = (songPos/1000)*(curBpm/15)
    setTextString('dbug','curStep: '..math.floor(currentStep))
end