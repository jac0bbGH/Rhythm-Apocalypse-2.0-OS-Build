function onCreate()  

	makeLuaSprite('sky', 'dave/sky_night', -627, -460);
	scaleObject('sky', 1.3, 1.3);
	addLuaSprite('sky')

	makeLuaSprite('hills', 'dave/hills_night', -410, -520);
	scaleObject('hills', 2, 2);
	addLuaSprite('hills')

	makeLuaSprite('gate', 'dave/gate_night', -510, -740);
	scaleObject('gate', 2.1, 2.1);
	addLuaSprite('gate')

	makeLuaSprite('grass', 'dave/grass_night', -400, -600);
	scaleObject('grass', 1.9, 1.9);
	addLuaSprite('grass')

end