function onCreate()
	
	makeLuaSprite('DayBG','bambi/sky',-608,-500)
	addLuaSprite('DayBG',false)
	setLuaSpriteScrollFactor('DayBG', 0.1, 0.1)

	makeLuaSprite('NoonBG','bambi/noon',-608,-500)
	addLuaSprite('NoonBG',false)
	setLuaSpriteScrollFactor('NoonBG', 0.1, 0.1)
	setProperty('NoonBG.alpha', 0)

	makeLuaSprite('NightBG','bambi/stars', -680,-500)
	addLuaSprite('NightBG',false)
	setLuaSpriteScrollFactor('NightBG', 0.1, 0.1)
	setProperty('NightBG.alpha', 0)
	
	makeLuaSprite('Hills','dave/hills', -652, -20)
	addLuaSprite('Hills',false)
	setLuaSpriteScrollFactor('Hills', 0.7, 0.7)
	--setProperty('Hills.scale.x', 0.3);
    --setProperty('Hills.scale.y', 0.3);

	makeLuaSprite('grassBG','dave/grass bg', -725, 400)
	addLuaSprite('grassBG',false)
	setLuaSpriteScrollFactor('grassBG', 0.3, 0.3)

	makeLuaSprite('Gate','dave/gate', -542, 440)
	addLuaSprite('Gate',false)
	setLuaSpriteScrollFactor('Gate', 0.9, 0.9)

	makeLuaSprite('grass','dave/grass', -725, 580)
	addLuaSprite('grass',false)
	setLuaSpriteScrollFactor('grass', 1, 1)
	setProperty('grass.scale.x', 0.8);
	

	close(true);
end