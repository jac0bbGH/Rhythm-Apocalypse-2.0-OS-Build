-- CODE BY jac0bb, only to be used in Strident Crisis Rebooted! don't use this in your mods

function onEvent(name, value1, value2)
    local var string = (value1)
    local var length = tonumber(0 + value2)
    if name == "SC Lyric Event" then

        makeLuaText('textwtf', 'Lyrics go here!', 900, 170, 200)
        setTextString('textwtf',  '' .. string)
        setTextFont('textwtf', 'vcr.ttf')
        setTextColor('textwtf', 'ffffff')
        setTextSize('textwtf', 50);
        addLuaText('textwtf')
        setTextAlignment('textwtf', 'center')
        setObjectCamera("textwtf", 'other');
        runTimer('timer shit woah', length, 1)
        setProperty('textwtf.alpha', 0)
        doTweenAlpha('appearance', 'textwtf', 1, 0.3, 'easeIn')
        --removeLuaText('textwtf', true)
        
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'timer shit woah' then
        doTweenAlpha('appearance', 'textwtf', -1, 0.3, 'easeOut')
    end
end