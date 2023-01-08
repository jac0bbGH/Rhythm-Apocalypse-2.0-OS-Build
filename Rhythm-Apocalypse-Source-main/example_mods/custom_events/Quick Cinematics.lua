-- Created by RamenDominoes (Feel free to credit or not I don't really care)
--Not bad for my first event created... I think

start2 = 0

finish2 = 0



function onCreate()
	

	--THE TOP BAR
	makeLuaSprite('UpperBar2', 'empty2', 0, -120)
	makeGraphic('UpperBar2', 1280, 120, '000000')
	setObjectCamera('UpperBar2', 'hud')
	addLuaSprite('UpperBar2', false)


	--THE BOTTOM BAR
	makeLuaSprite('LowerBar2', 'empty2', 0, 720)
	makeGraphic('LowerBar2', 1280, 120, '000000')
	setObjectCamera('LowerBar2', 'hud')
	addLuaSprite('LowerBar2', false)

end


function onUpdate()

	if start2 == 1 then
	
	doTweenY('Cinematics11', 'UpperBar2', 0, 0.25, 'Linear')
	doTweenY('Cinematics22', 'LowerBar2', 600, 0.25, 'Linear')
	noteTweenY('NOTEMOVE1', 0, 120, 0.25, 'Linear')	
	noteTweenY('NOTEMOVE2', 1, 120, 0.25, 'Linear')
	noteTweenY('NOTEMOVE3', 2, 120, 0.25, 'Linear')
	noteTweenY('NOTEMOVE4', 3, 120, 0.25, 'Linear')
	noteTweenY('NOTEMOVE5', 4, 120, 0.25, 'Linear')
	noteTweenY('NOTEMOVE6', 5, 120, 0.25, 'Linear')
	noteTweenY('NOTEMOVE7', 6, 120, 0.25, 'Linear')
	noteTweenY('NOTEMOVE8', 7, 120, 0.25, 'Linear')
	doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 0.125)
	doTweenAlpha('AlphaTween2', 'healthBar', 0, 0.125)
	doTweenAlpha('AlphaTween3', 'scoreTxt', 0, 0.125)
	doTweenAlpha('AlphaTween4', 'iconP1', 0, 0.125)
	doTweenAlpha('AlphaTween5', 'iconP2', 0, 0.125)
	doTweenAlpha('AlphaTween6', 'timeBar', 0, 0.125)
	doTweenAlpha('AlphaTween7', 'timeBarBG', 0, 0.125)
	doTweenAlpha('AlphaTween8', 'timeTxt', 0, 0.125)
	end

	if downscroll and start2 == 1 then
	
	doTweenY('Cinematics11', 'UpperBar2', -50, 0.25, 'Linear')
	doTweenY('Cinematics22', 'LowerBar2', 650, 0.25, 'Linear')
	noteTweenY('NOTEMOVE1', 0, 530, 0.25, 'Linear')	
	noteTweenY('NOTEMOVE2', 1, 530, 0.25, 'Linear')
	noteTweenY('NOTEMOVE3', 2, 530, 0.25, 'Linear')
	noteTweenY('NOTEMOVE4', 3, 530, 0.25, 'Linear')
	noteTweenY('NOTEMOVE5', 4, 530, 0.25, 'Linear')
	noteTweenY('NOTEMOVE6', 5, 530, 0.25, 'Linear')
	noteTweenY('NOTEMOVE7', 6, 530, 0.25, 'Linear')
	noteTweenY('NOTEMOVE8', 7, 530, 0.25, 'Linear')
	doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 0.125)
	doTweenAlpha('AlphaTween2', 'healthBar', 0, 0.125)
	doTweenAlpha('AlphaTween3', 'scoreTxt', 0, 0.125)
	doTweenAlpha('AlphaTween4', 'iconP1', 0, 0.125)
	doTweenAlpha('AlphaTween5', 'iconP2', 0, 0.125)
	doTweenAlpha('AlphaTween6', 'timeBar', 0, 0.125)
	doTweenAlpha('AlphaTween7', 'timeBarBG', 0, 0.125)
	doTweenAlpha('AlphaTween8', 'timeTxt', 0, 0.125)
	end

	if finish2 == 2 then
	
	doTweenY('Cinematics11', 'UpperBar2', -120, 0.5, 'Linear')
	doTweenY('Cinematics22', 'LowerBar2', 720, 0.5, 'Linear')
	noteTweenY('NOTEMOVE1', 0, 50, 0.25, 'Linear')	
	noteTweenY('NOTEMOVE2', 1, 50, 0.25, 'Linear')
	noteTweenY('NOTEMOVE3', 2, 50, 0.25, 'Linear')
	noteTweenY('NOTEMOVE4', 3, 50, 0.25, 'Linear')
	noteTweenY('NOTEMOVE5', 4, 50, 0.25, 'Linear')
	noteTweenY('NOTEMOVE6', 5, 50, 0.25, 'Linear')
	noteTweenY('NOTEMOVE7', 6, 50, 0.25, 'Linear')
	noteTweenY('NOTEMOVE8', 7, 50, 0.25, 'Linear')
	doTweenAlpha('AlphaTween1', 'healthBarBG', 1, 0.125)
	doTweenAlpha('AlphaTween2', 'healthBar', 1, 0.125)
	doTweenAlpha('AlphaTween3', 'scoreTxt', 1, 0.125)
	doTweenAlpha('AlphaTween4', 'iconP1', 1, 0.125)
	doTweenAlpha('AlphaTween5', 'iconP2', 1, 0.125)
	doTweenAlpha('AlphaTween6', 'timeBar', 1, 0.125)
	doTweenAlpha('AlphaTween7', 'timeBarBG', 1, 0.125)
	doTweenAlpha('AlphaTween8', 'timeTxt', 1, 0.125)
	
	end

	if downscroll and finish2 == 2 then
	
	doTweenY('Cinematics11', 'UpperBar2', -120, 0.25, 'Linear')
	doTweenY('Cinematics22', 'LowerBar2', 720, 0.25, 'Linear')
	noteTweenY('NOTEMOVE1', 0, 570, 0.25, 'Linear')	
	noteTweenY('NOTEMOVE2', 1, 570, 0.25, 'Linear')
	noteTweenY('NOTEMOVE3', 2, 570, 0.25, 'Linear')
	noteTweenY('NOTEMOVE4', 3, 570, 0.25, 'Linear')
	noteTweenY('NOTEMOVE5', 4, 570, 0.25, 'Linear')
	noteTweenY('NOTEMOVE6', 5, 570, 0.25, 'Linear')
	noteTweenY('NOTEMOVE7', 6, 570, 0.25, 'Linear')
	noteTweenY('NOTEMOVE8', 7, 570, 0.25, 'Linear')
	doTweenAlpha('AlphaTween1', 'healthBarBG', 1, 0.125)
	doTweenAlpha('AlphaTween2', 'healthBar', 1, 0.125)
	doTweenAlpha('AlphaTween3', 'scoreTxt', 1, 0.125)
	doTweenAlpha('AlphaTween4', 'iconP1', 1, 0.125)
	doTweenAlpha('AlphaTween5', 'iconP2', 1, 0.125)
	doTweenAlpha('AlphaTween6', 'timeBar', 1, 0.125)
	doTweenAlpha('AlphaTween7', 'timeBarBG', 1, 0.125)
	doTweenAlpha('AlphaTween8', 'timeTxt', 1, 0.125)
	end
	
end

function onEvent(name,value1,value2)
	if name == 'Quick Cinematics' then
		start = tonumber(value1)
		finish = tonumber(value2)
			end
	
		end

