function onCreate()  

	makeLuaSprite('unfair!', 'expunged/1000', -1200, -932);
	scaleObject('unfair!', 4.2, 4.2);
	setProperty('unfair!.antialiasing', false)
	addLuaSprite('unfair!')
	addGlitchEffect('unfair!', 3.4, 3.4)

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