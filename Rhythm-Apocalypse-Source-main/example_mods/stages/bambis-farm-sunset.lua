function onCreate()
	-- background shit
	makeLuaSprite('suntime', 'suntime', -500, -100);
	
	makeLuaSprite('sky-sunset', 'sky-sunset', -800, -100);
	setScrollFactor('sky-sunset', 0.15, 0.15);

	makeLuaSprite('gm_flatgrass', 'gm_flatgrass', 0, 20)
	setScrollFactor('gm_flatgrass', 0.4, 0.4)
	scaleObject('gm_flatgrass', 0.3, 0.3)

	makeLuaSprite('orangey hills', 'orangey hills', -600, 50);
	setScrollFactor('orangey hills', 0.5, 0.5);
	scaleObject('orangey hills', 1.5, 1.5)
	
	makeLuaSprite('funfarmhouse', 'funfarmhouse', 0, 100);
	setScrollFactor('funfarmhouse', 0.7, 0.7);	
	
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


	addLuaSprite('sky-sunset', false);
	addLuaSprite('gm_flatgrass', false)
	addLuaSprite('orangey hills', false);
	addLuaSprite('funfarmhouse', false);
	addLuaSprite('grass lands', false);
	addLuaSprite('cornFence2', false);
	addLuaSprite('cornFence', false);
	addLuaSprite('sign', false);
	addLuaSprite('cornbag', false);
	addLuaSprite('suntime', true)


	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end