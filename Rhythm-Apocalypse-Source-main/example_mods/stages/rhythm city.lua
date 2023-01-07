function onCreate()
	-- background shit
	makeLuaSprite('buildings', 'buildings', -223.35, 58)
	setScrollFactor('buildings', 0.4, 0.4)
	scaleObject('buildings', 1, 1)

	makeLuaSprite('skyfnf', 'skyfnf', -600, -400)
	setScrollFactor('skyfnf', 0, 0)
	scaleObject('skyfnf', 5, 5)



	addLuaSprite('skyfnf', false);
	addLuaSprite('buildings', false)




	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end