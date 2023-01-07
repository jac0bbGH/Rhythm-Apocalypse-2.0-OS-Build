function onCreate()
	-- background shit
	makeLuaSprite('SkyDave', 'SkyDave', -800, -300);
	setScrollFactor('SkyDave', 0.3, 0.3)

	makeLuaSprite('gm_flatgrass', 'gm_flatgrass', 0, 20)
	setScrollFactor('gm_flatgrass', 0.9, 0.9)
	scaleObject('gm_flatgrass', 0.3, 0.3)

	makeLuaSprite('orangey hills', 'orangey hills', -600, 50);
	setScrollFactor('orangey hills', 0.9, 0.9);
	scaleObject('orangey hills', 1.5, 1.5)
	
	makeLuaSprite('funfarmhouse', 'funfarmhouse', 0, 100);
	setScrollFactor('funfarmhouse', 0.9, 0.9);	
	
	makeLuaSprite('grass lands', 'grass lands', -800, 500);
	setScrollFactor('grass lands', 1, 1);
	scaleObject('grass lands', 1, 1)

	makeLuaSprite('cornFence2', 'cornFence2', 1000, 100);
	setScrollFactor('cornFence2', 1, 1);
	scaleObject('cornFence2', 1, 1)
	
	makeLuaSprite('cornFence', 'cornFence', -600, 100);
	setScrollFactor('cornFence', 1, 1);
	scaleObject('cornFence', 1, 1)

	makeLuaSprite('sign', 'sign', -100, 250);
	setScrollFactor('sign', 1, 1);

	makeLuaSprite('cornbag', 'cornbag', 1000, 450);
	setScrollFactor('cornbag', 1, 1);


	addLuaSprite('SkyDave', false);
	addLuaSprite('gm_flatgrass', false)
	addLuaSprite('orangey hills', false);
	addLuaSprite('funfarmhouse', false);
	addLuaSprite('grass lands', false);
	addLuaSprite('cornFence2', false);
	addLuaSprite('cornFence', false);
	addLuaSprite('sign', false);
	addLuaSprite('cornbag', false);



	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end