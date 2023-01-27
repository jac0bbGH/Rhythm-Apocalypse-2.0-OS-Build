function onCreatePost()
	setProperty('gf.alpha', 0)
	makeLuaSprite('luigi', 'joke/cornophobe/luigi', 2300, 150)
	makeLuaSprite('polismna', 'joke/cornophobe/polismna', 300, 0)
	makeLuaSprite('poliscra', 'joke/cornophobe/poliscra', -4000, 50)
	setProperty('polismna.alpha', 0)
	
	addLuaSprite('luigi')
	addLuaSprite('poliscra')
	addLuaSprite('polismna')
end

function onStepHit()
	if curStep == 1044 then
		doTweenX('fart', 'luigi', 1400, 0.5, 'elasticOut')
	elseif curStep == 1122 then
		setProperty('gf.alpha', 1)
	elseif curStep == 1184 then
		setProperty('gf.alpha', 0)
	elseif curStep == 1363 then
		doTweenX('carring', 'poliscra', -600, 1, 'linear')
	elseif curStep == 1376 then
		setProperty('polismna.alpha', 1)
	elseif curStep == 1391 then
		doTweenX('takenaway', 'dad', -2000, 10, 'linear')
		doTweenX('takenawaypc', 'poliscra', -2500, 10, 'linear')
		doTweenX('takenawaypm', 'polismna', -2100, 10, 'linear')
	end
end

-- tween car -600