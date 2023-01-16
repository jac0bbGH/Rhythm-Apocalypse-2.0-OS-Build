function onCreate()
	
	makeLuaSprite('DayBG','bambi/Sky',-608,-500)
	addLuaSprite('DayBG',false)
	setLuaSpriteScrollFactor('DayBG', 0.1, 0.1)

	makeLuaSprite('hills','dave/house/hills', -1300, -1000)
	addLuaSprite('hills',false)
	setLuaSpriteScrollFactor('hills', 0.6, 0.6)

	makeLuaSprite('gates','dave/house/grass_gate', -660, -666)
	addLuaSprite('gates',false)
	setLuaSpriteScrollFactor('gates', 1, 1)

	makeLuaSprite('house','dave/house/house', -785, -690)
	addLuaSprite('house',false)
	setLuaSpriteScrollFactor('house', 1, 1)
	setProperty('house.scale.x', 0.85);
	setProperty('house.scale.y', 0.85);

	makeLuaSprite('mail','dave/house/mail', -785, -720)
	addLuaSprite('mail', false)
	setLuaSpriteScrollFactor('mail', 1, 1)
	
	close(true);
end