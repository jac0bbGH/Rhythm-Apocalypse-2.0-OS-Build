function onCreate()
	makeLuaSprite('DaveBG3DSecondary', 'DaveBG3DSecondary', -500, -100);
	setScrollFactor('DaveBG3DSecondary', 1, 1);
	makeLuaSprite('RedSky', 'RedSky', -1200, -900);
	setScrollFactor('RedSky', 1, 1);
	makeLuaSprite('RedTint', 'RedTint', -900, -300);
	setScrollFactor('RedTint', 1, 1);
	makeLuaSprite('DaveBG3DSGATE', 'DaveBG3DSGATE',  -500, -200);
	setScrollFactor('DaveBG3DSGATE', 1, 1);


	addLuaSprite('RedSky', false)
	addLuaSprite('DaveBG3DSecondary', false)
	addLuaSprite('DaveBG3DSGATE', false)
	addLuaSprite('RedTint', true)
	scaleObject('DaveBG3DSecondary', 1.25, 1.25)
	scaleObject('RedSky', 1.9, 1.9)
	addGlitchEffect('RedSky', 3, 1.5)
	scaleObject('RedTint', 5.9, 5.9)
	scaleObject('DaveBG3DSGATE', 1.25, 1.25)
end