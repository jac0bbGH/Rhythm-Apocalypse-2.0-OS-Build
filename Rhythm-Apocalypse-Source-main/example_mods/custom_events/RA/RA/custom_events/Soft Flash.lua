function onEvent(n,v1,v2)


	if n == 'Soft Flash' then

	   makeLuaSprite('flash', '', 0, 0);
        makeGraphic('flash',1280,720,'ffffff')
	      addLuaSprite('flash', true);
	      setLuaSpriteScrollFactor('flash',0,0)
	      setProperty('flash.scale.x',2)
	      setProperty('flash.scale.y',2)
	      setProperty('flash.alpha',0)
		setProperty('flash.alpha',0.5)
		setObjectCamera("flash", 'hud')
		doTweenAlpha('flTw','flash',0,v1,'linear')
	end



end