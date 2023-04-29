function onCreate()
	-- background shit
	makeLuaSprite('true', 'Expunged/true', -600, -300);
	setScrollFactor('true', 0.9, 0.9);
	
	addLuaSprite('true', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end