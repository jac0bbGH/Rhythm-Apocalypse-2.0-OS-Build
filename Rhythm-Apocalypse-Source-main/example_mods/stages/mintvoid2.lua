function onCreate()
	-- background shit
	makeLuaSprite('hi', 'hi', -2000, -1000);
	setScrollFactor('hi', 0.9, 0.9);
	scaleObject('hi', 2, 2)
	addGlitchEffect('hi', 2, 5, 0.1);
	
	makeLuaSprite('mint', 'mint', -650, 300);
	setScrollFactor('mint', 0.9, 0.9);
	scaleObject('mint', 1.1, 1.1);
	addLuaSprite('hi', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end