function onCreatePost()
	makeLuaSprite('NoonEffect', 'Bambi/NoonEffect', 0, 0)
	addLuaSprite('NoonEffect',true)
	setObjectCamera('NoonEffect', 'camgame')
	setProperty('NoonEffect.scale.x', 12.5);
    setProperty('NoonEffect.scale.y', 12.5);
	setProperty('NoonEffect.alpha', 0.0)

end

function onUpdate(elapsed)

	if curStep == 100 then
		doTweenAlpha('TurningNoon', 'NoonEffect', 0.7, 60, quadIn)
		doTweenAlpha('TurningNoon2', 'NoonBG', 1, 60, quadOut)
	end

	if curStep == 8484584848 then
		doTweenAlpha('TurningNoon', 'NoonEffect', 0, 20, quadIn)
	end

end