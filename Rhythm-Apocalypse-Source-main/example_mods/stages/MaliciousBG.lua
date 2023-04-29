function onCreate()  

	-- Where the image starts off
	initialPointX = -1861
    
	-- This is the speed feel free to change it :)
	scrollSpeed = 1000
	-- Image scale size (for the text :D)
	scaleFactor = 2

	-- How far the text travels before it resets back to its starting position (see "intiialPointX"). Never change 1200 btw! the image loops three times  and 1200 is a third of its total width (3600)
	travelDistanceX = 100*scaleFactor

	function onUpdate(elapsed)
		setProperty("penbis chat 2.x",getProperty("penbis chat 2.x")+(elapsed*scrollSpeed))
		-- Calculates distance from starting point to current position. Determines whether or not it goes past its travelDistance. Subtracts distance travelled from current position
		if initialPointX+getProperty("penbis chat 2.x") > ((initialPointX+travelDistanceX)*scaleFactor) then
			setProperty("penbis chat 2.x",getProperty("penbis chat 2.x")-travelDistanceX)
		end
	end

	makeLuaSprite('penbis chat', 'expunged/cheater/CHEATINGGRADIENT', -1861, -1132);
	scaleObject('penbis chat', 2.2, 2.2);
	setProperty('penbis chat.antialiasing', false)
	addLuaSprite('penbis chat')
	addGlitchEffect('penbis chat', 2, 2)

    makeLuaSprite('penbis chat 2', 'expunged/cheater/CHEATERTEXT', -1861, -1132);
	setProperty('penbis chat 2.antialiasing', false)
	addLuaSprite('penbis chat 2')
	scaleObject('penbis chat 2', scaleFactor,scaleFactor)
    setScrollFactor('penbis chat 2', 0.1, 0.1)

    makeLuaSprite('penbis chat 3', 'expunged/cheater/CHEATINGBLOCK', -1861, -1132);
	scaleObject('penbis chat 3', 2.2, 2.2);
	setProperty('penbis chat 3.antialiasing', false)
	addLuaSprite('penbis chat 3')
	addGlitchEffect('penbis chat 3', 3, 2)
end

local totalTime = 0.0
function onUpdatePost(elapsed)
    totalTime = totalTime + elapsed

    setScrollFactor("gf", 0.6, 0.6)
    setProperty("gf.scale.x",0.4)
    setProperty("gf.scale.y",0.4)
    setProperty("gf.y",250+math.sin(totalTime*math.pi/3)*200)
    setProperty("gf.x",-1200+(totalTime*500%3600))
end