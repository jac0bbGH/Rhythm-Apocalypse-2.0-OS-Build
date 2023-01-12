function onCreate()  

	makeLuaSprite('vanBG', 'glitchyUnfairBG', -1800, -1132);
	scaleObject('vanBG', 6, 6);
	setProperty('vanBG.antialiasing', false)
	addLuaSprite('vanBG')
	addGlitchEffect('vanBG', 2, 2)

end