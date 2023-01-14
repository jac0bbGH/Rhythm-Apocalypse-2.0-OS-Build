function onCountdownTick(counter)
    if counter == 4 then
	    doTweenAngle('Turning', 'camHUD', -2, 0.5, Linear);
        doTweenAngle('NebiaFace', 'camGame', 2, 0.5, Linear);
        setProperty('camHUD.visible',true)
        setProperty('boyfriend.visible',true)
        setProperty('dad.visible',true)
    end
end

function onBeatHit()
    if curBeat == 8 then
        doTweenAngle('BfFace', 'camGame', -2, 0.5, Linear);
    end

    if curBeat == 16 then
        doTweenAngle('NebiaFace', 'camGame', 2, 0.5, Linear);
    end

    if curBeat == 24 then
        doTweenAngle('BfFace', 'camGame', -2, 0.5, Linear);
    end
    
    if curBeat == 32 then
        doTweenAngle('Turning', 'camHUD', 0, 0.5, Linear);
        doTweenAngle('FaceNoOne', 'camGame', 0, 0.5, Linear);
        setProperty('vanBG.visible',true)
        setProperty('gf.visible',true)
    end

    if curBeat == 138 then
        doTweenY('ascend', 'dad', -5000, 70, 'linear');
        doTweenY('ascend2', 'boyfriend', -4700, 70, 'linear');
        doTweenY('shefell', 'gf', 5000, 20, 'circIn');
        doTweenAngle('shegffell', 'gf', 200, 40, Linear);
        setProperty('Galaxy.visible',true)
        setProperty('vanBG.visible',false)
	    doTweenAngle('Turning', 'camHUD', -2, 0.5, Linear);
        doTweenY('camera', 'camFollow', -4400, 70, 'Linear')
    end
        if curBeat == 170 then
            setProperty('vanBG.visible',false)
            setProperty('Galaxy.visible',false)
            setProperty('boyfriend.visible',false)
            setProperty('gf.visible',false)
            setProperty('dad.visible',false)
            setProperty('camGame.visible',false)
            doTweenAngle('Turning', 'camHUD', 0, 0.5, Linear);
    end
end 

function onCreate()
    setProperty('vanBG.visible',false)
    setProperty('Galaxy.visible',false)
    setProperty('camHUD.visible',false)
    setProperty('boyfriend.visible',false)
    setProperty('gf.visible',false)
    setProperty('dad.visible',false)
end