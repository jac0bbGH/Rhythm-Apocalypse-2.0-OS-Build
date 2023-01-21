function onCreatePost()
	makeLuaSprite("shitsAss","thisIsForTheScreen",-10000,-10000)
	setObjectCamera("shitsAss",'game') -- 'other' for in front of hud, 'hud' to be on it i think i forgor
	addLuaSprite("shitsAss",true)
	makeGraphic("shitsAss",screenWidth+100000,screenHeight+100000,"000000")
	setProperty("shitsAss.alpha",0)
end

function onEvent(name, value1, value2)
	if name == "FadeScreen" then
		doTweenAlpha("shitScreenFade","shitsAss",value1,value2)
	end
end