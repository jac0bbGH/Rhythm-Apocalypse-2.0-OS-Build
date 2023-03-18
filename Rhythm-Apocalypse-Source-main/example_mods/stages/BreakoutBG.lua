function onCreate()  

	makeLuaSprite('sjdjadjs', 'opposition/opsinging', -1861, -1132);
	scaleObject('sjdjadjs', 2.2, 2.2);
	setProperty('sjdjadjs.antialiasing', false)
	addLuaSprite('sjdjadjs')
	addGlitchEffect('sjdjadjs', 2, 2)

    makeLuaSprite('doubvlre', 'opposition/opporock', 1500, 800);
	scaleObject('doubvlre', 2.2, 2.2);
	setProperty('doubvlre.antialiasing', false)
	addLuaSprite('doubvlre')
end



function onCreatePost ()

addChromaticAbberationEffect ('camhud', 0.005)
addChromaticAbberationEffect ('camgame', 0.005)
addBloomEffect ('camhud', 0.07)
addBloomEffect ('camgame', 0.07)
end