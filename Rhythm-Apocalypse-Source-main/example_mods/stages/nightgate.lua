function onCreate()
	-- background shit
	makeLuaSprite('sky', 'sky_night', -420, -340);
	scaleObject('sky', 1.1, 1.1);
	makeLuaSprite('hills', 'hills_night', -420, -200);
	makeLuaSprite('gate', 'gate_night', -420, 200);
	makeLuaSprite('grassbg', 'grass_bg', -700, 300);
	makeLuaSprite('grass', 'grass_night', -1000, 400);
	scaleObject('grass', 1.4, 1.4);
	makeLuaSprite('nighttime', 'nighttime', -500, -10);
	setScrollFactor('nighttime', 1, 1);	
	scaleObject('nighttime', 5, 5);

	addLuaSprite('sky', false);
	addLuaSprite('hills', false);
	addLuaSprite('gate', false);
	addLuaSprite('grassbg', false);
	addLuaSprite('grass', false);
	addLuaSprite('nighttime', true);
end