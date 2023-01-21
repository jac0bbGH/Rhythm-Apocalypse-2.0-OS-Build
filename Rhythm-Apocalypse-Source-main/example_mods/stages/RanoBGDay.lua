function onCreate()

	makeLuaSprite('DayBG','bambi/sky',-608,-500)
	addLuaSprite('DayBG',false)
	setLuaSpriteScrollFactor('DayBG', 0.1, 0.1)
	setProperty('DayBG.alpha', 1)

	makeLuaSprite('NoonBG','bambi/noon',-608,-500)
	addLuaSprite('NoonBG',false)
	setLuaSpriteScrollFactor('NoonBG', 0.1, 0.1)
	setProperty('NoonBG.alpha', 0)

	makeLuaSprite('NightBG','bambi/stars',-608,-500)
	addLuaSprite('NightBG',false)
	setLuaSpriteScrollFactor('NightBG', 0.1, 0.1)
	setProperty('NightBG.alpha', 0)

	makeLuaSprite('Hills','rano/hills', -1199, -370)
	addLuaSprite('Hills',false)
	setLuaSpriteScrollFactor('Hills', 0.4, 0.4)

	makeLuaSprite('grassBG','rano/supergrass', -590, 337)
	addLuaSprite('grassBG',false)
	setLuaSpriteScrollFactor('grassBG', 1, 1)

	makeLuaSprite('gate','rano/gates', 75, 35)
	addLuaSprite('gate',false)
	setLuaSpriteScrollFactor('gate', 0.9, 0.9)

	makeLuaSprite('house','rano/house', -830, -150)
	addLuaSprite('house',false)
	setLuaSpriteScrollFactor('house', 1, 1)

	makeLuaSprite('grill','rano/grill', -283, 583)
	addLuaSprite('grill',false)
	setLuaSpriteScrollFactor('grill', 1, 1)
	

	close(true);
end