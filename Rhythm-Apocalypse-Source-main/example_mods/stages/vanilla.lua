function onCreate()  

	makeLuaSprite('vanBG', 'vanilla/vanillaBG', -1861, -1132);
	scaleObject('vanBG', 2.7, 2.7);
	addLuaSprite('vanBG')
	addGlitchEffect('vanBG', 2, 2)
	setProperty('vanBG.antialiasing', false)

end

local totalTime = 0.0
function onUpdatePost(elapsed)
    totalTime = totalTime + elapsed

    setScrollFactor("gf", 0.6, 0.6)
    setProperty("gf.scale.x",0.4)
    setProperty("gf.scale.y",0.4)
    setProperty("gf.y",250+math.sin(totalTime*math.pi/3)*200)
    setProperty("gf.x",-1000+(totalTime*400%3500))
    setProperty("gf.angle",totalTime*40)
end