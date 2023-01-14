-- CODE BY jac0bb, only to be used in Strident Crisis Rebooted! don't use this in your mods

function onEvent(name, value1, value2)
    local var string = (value1)
    local var length = tonumber(0 + value2)
    if name == "you play as dave" then

        makeLuaSprite('yes you play as dave', 'warninf', 800, 0);
        scaleObject('yes you play as dave', 1, 1);
        addLuaSprite('yes you play as dave')
        setObjectCamera("yes you play as dave", 'other');
        runTimer('timer shit woah', length, 1)
        setProperty('yes you play as dave.alpha', 0)
        doTweenAlpha('appearance', 'yes you play as dave', 1, 0.3, 'easeIn')
        --removeLuaText('yes you play as dave', true)
        
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'timer shit woah' then
        doTweenAlpha('appearance', 'yes you play as dave', -1, 0.3, 'easeOut')
    end
end