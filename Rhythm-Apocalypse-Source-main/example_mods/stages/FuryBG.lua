function onCreate() 
	makeLuaSprite('bambiWhy', 'ifyouseethisFUCKYOU/pissy', -2100, -1300);
	scaleObject('bambiWhy', 2.6, 2.6);
	addLuaSprite('bambiWhy')
	addGlitchEffect('bambiWhy', 2, 2)
	makeLuaSprite('wtfd', 'ifyouseethisFUCKYOU/Deez', -500, -1300);
	scaleObject('wtfd', 2.1, 2.1);
	addLuaSprite('wtfd')
	makeLuaSprite('wtf', 'ifyouseethisFUCKYOU/Corn', -500, -1300);
	scaleObject('wtf', 2.1, 2.1);
	addLuaSprite('wtf')
	addGlitchEffect('wtf', 4, 4)
	makeLuaSprite('ROCK', 'ifyouseethisFUCKYOU/rock', 1000, 50);
	scaleObject('ROCK', 2.7, 2.7);
	addLuaSprite('ROCK')
end

local totalTime = 0.0
function onUpdatePost(elapsed)
    totalTime = totalTime + elapsed

    setScrollFactor("gf", 0.6, 0.6)
    setProperty("gf.scale.x",0.8)
    setProperty("gf.scale.y",0.8)
    setProperty("gf.y",250+math.sin(totalTime*math.pi/3)*200)
    setProperty("gf.x",-1000+(totalTime*400%3500))
    setProperty("gf.angle",totalTime*40)
end