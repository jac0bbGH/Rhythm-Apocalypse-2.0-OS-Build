function onCreate()
	-- background shit
	makeLuaSprite('buildings', 'city/buildings', -1223.35, 258)
	setScrollFactor('buildings', 0.7, 0.7)
	scaleObject('buildings', 1.1, 1.1)

	makeLuaSprite('skyfnf', 'city/skyfnf', -2300, -1200)
	setScrollFactor('skyfnf', 0.2, 0.2)
	scaleObject('skyfnf', 2.4, 2.4)
    addGlitchEffect('skyfnf', 0.3, 0)

	makeLuaSprite('moony', 'city/moony', -300, 600)
	setScrollFactor('moony', 0.7, 0.7)
	scaleObject('moony', 1, 1)
	doTweenY("moonyTween", "moony", -15000, 1500, "linear")   

	makeLuaSprite('Color', 'vanilla/Color', -1400, -600)
	setScrollFactor('Color', 1, 1)
	scaleObject('Color', 1.8, 1.7)
	doTweenAlpha('a','Color',0,0.001)


	addLuaSprite('skyfnf', false);
	addLuaSprite('moony', false)
	addLuaSprite('buildings', false)
	addLuaSprite('Color', false)
end


function onBeatHit()
 if curBeat == 384 then
	doTweenAlpha('a','Color',1,2.6)
	end

if curBeat == 392 then
	addGlitchEffect('Color', 2, 2)
	end

if curBeat == 520 then
	doTweenAlpha('a','Color',0,0.001)
	end
end