function onCreate()
	setProperty('DayBG.alpha', 0)
	setProperty('NoonBG.alpha', 1)
end

function onCreatePost()
	makeLuaSprite('NightEffect', 'Bambi/NightEffect', 0, 0)
	addLuaSprite('NightEffect',true)
	setObjectCamera('NightEffect', 'camgame')
	setProperty('NightEffect.scale.x', 12.5);
    setProperty('NightEffect.scale.y', 12.5);
	setProperty('NightEffect.alpha', 0.0)

end

function onUpdate(elapsed)

	if curStep == 888 then
		doTweenAlpha('TurningNight05', 'NoonEffect', 0.0, 35, quadIn)
		doTweenAlpha('TurningNight1', 'NightEffect', 0.6, 35, quadIn)
		doTweenAlpha('TurningNight2', 'NightBG', 1, 35, quadOut)
	end
end