function onCreate()  

	makeLuaSprite('penbis chat', 'dave/Tristan/hartogold', -1861, -1132);
	scaleObject('penbis chat', 1.7, 1.7);
	setProperty('penbis chat.antialiasing', false)
	addLuaSprite('penbis chat')
	addGlitchEffect('penbis chat', 3.5, 3.5)
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

function onCreatePost ()
    addBloomEffect ('camhud', 0.07)
    addBloomEffect ('camgame', 0.07)
end