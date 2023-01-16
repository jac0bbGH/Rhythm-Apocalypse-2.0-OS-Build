function onCreate()

	makeLuaSprite('DayBG','bambi/noon',-608,-500)
	addLuaSprite('DayBG',false)
	setLuaSpriteScrollFactor('DayBG', 0.1, 0.1)

	makeLuaSprite('flatgrass','bambi/gm_flatgrass', -55, -150)
	addLuaSprite('flatgrass',false)
	setLuaSpriteScrollFactor('flatgrass', 0.3, 0.3)
	setProperty('flatgrass.scale.x', 0.3);
    setProperty('flatgrass.scale.y', 0.3);

	makeLuaSprite('hills','bambi/orangey hills', -220, 5)
	addLuaSprite('hills',false)
	setLuaSpriteScrollFactor('hills', 0.3, 0.3)

	makeLuaSprite('farm','bambi/funfarmhouse', 69, 85)
	addLuaSprite('farm',false)
	setLuaSpriteScrollFactor('farm', 0.6, 0.6)

	makeLuaSprite('ground','bambi/grass lands', -480, 480)
	addLuaSprite('ground',false)
	setLuaSpriteScrollFactor('ground', 1, 1)

	makeLuaSprite('corn1','bambi/cornFence', -280, 180)
	addLuaSprite('corn1',false)
	setLuaSpriteScrollFactor('corn1', 1, 1)

	makeLuaSprite('corn2','bambi/cornFence2', 1220, 200)
	addLuaSprite('corn2',false)
	setLuaSpriteScrollFactor('corn2', 1, 1)

	makeLuaSprite('sign','bambi/Sign', 125, 340)
	addLuaSprite('sign',false)
	setLuaSpriteScrollFactor('sign', 1, 1)

	makeLuaSprite('cornbag','bambi/cornbag', 1320, 550)
	addLuaSprite('cornbag',false)
	setLuaSpriteScrollFactor('cornbag', 1, 1)
	

	close(true);
end