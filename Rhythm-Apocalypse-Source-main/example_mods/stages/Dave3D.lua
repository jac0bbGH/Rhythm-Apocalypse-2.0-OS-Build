function onCreate()
	makeLuaSprite('DaveBG3D', 'DaveBG3D', -500, -100);
	setScrollFactor('DaveBG3D', 1, 1);
	makeLuaSprite('SkyDave', 'SkyDave', -1200, -900);
	setProperty('SkyDave.antialiasing', false)
	setScrollFactor('SkyDave', 1, 1);


	addLuaSprite('SkyDave', false)
	addLuaSprite('DaveBG3D', false)
	scaleObject('DaveBG3D', 1.25, 1.25)
	scaleObject('SkyDave', 1.9, 1.9)
	addGlitchEffect('SkyDave', 0.1, 0.1)
end