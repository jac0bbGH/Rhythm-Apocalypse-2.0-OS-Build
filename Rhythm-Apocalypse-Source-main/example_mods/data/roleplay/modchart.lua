function onCreatePost()
	setProperty('gf.alpha', 0)
	setProperty('retgarUsername.alpha', 0)
end

function onStepHit()
	if curStep == 464 then
		setProperty('retgarUsername.alpha', 1)
		doTweenX('funny', 'gf', getProperty('gf.x')-100, 0.001)
		setProperty('gf.alpha', 1)
	elseif curStep == 496 then
		doTweenX('funny', 'gf', getProperty('gf.x')+100, 1)
	end
end