function onSongStart()
    makeLuaText('dbug', "curStep: 0", 800, 535, 20)
    setTextSize('dbug', 40)
    setTextColor('dbug', 'FFFFFF')
    setObjectCamera('dbug','other')
    addLuaText('dbug',true)
    runTimer('frames',0.033)
end