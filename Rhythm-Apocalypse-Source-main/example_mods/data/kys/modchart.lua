

local function goGoNotesFuckOffToMiddleSplitScroll(goOrReturn)
	if goOrReturn == 'go' then
		if downscroll then
			for i = 0,7 do
				noteTweenY('fucking'..i, i, 570 - 235, 0.5, 'sineOut')
			end
				setPropertyFromGroup('playerStrums',0,'downScroll',false)
				setPropertyFromGroup('playerStrums',2,'downScroll',false)
				setPropertyFromGroup('opponentStrums',0,'downScroll',false)
				setPropertyFromGroup('opponentStrums',2,'downScroll',false)
		elseif not downscroll then
			for i = 0,7 do
				noteTweenY('fucking'..i, i, 50 + 235, 0.5, 'sineOut')
			end
				setPropertyFromGroup('playerStrums',0,'downScroll',true)
				setPropertyFromGroup('playerStrums',2,'downScroll',true)
				setPropertyFromGroup('opponentStrums',0,'downScroll',true)
				setPropertyFromGroup('opponentStrums',2,'downScroll',true)
			end
			
			for i = 0,7 do
			noteTweenAngle('pooper'..i, i, 360, 1, 'sineOut')
			end

	elseif goOrReturn == 'return' then
		if downscroll then
			for i = 0,7 do
				noteTweenY('fuckingr'..i, i, 570, 0.5, 'sineOut')
			end
				setPropertyFromGroup('playerStrums',0,'downScroll',true)
				setPropertyFromGroup('playerStrums',2,'downScroll',true)
				setPropertyFromGroup('opponentStrums',0,'downScroll',true)
				setPropertyFromGroup('opponentStrums',2,'downScroll',true)
		elseif not downscroll then
			for i = 0,7 do
				noteTweenY('fuckingr'..i, i, 50, 0.5, 'elasticOut')
			end
			
				setPropertyFromGroup('playerStrums',0,'downScroll',false)
				setPropertyFromGroup('playerStrums',2,'downScroll',false)
				setPropertyFromGroup('opponentStrums',0,'downScroll',false)
				setPropertyFromGroup('opponentStrums',2,'downScroll',false)
		end
		
		for i = 0,7 do
			noteTweenAngle('pooper'..i, i, -360, 1, 'sineOut')
		end
	end
end

function onStepHit()
	if curStep == 1 then
		goGoNotesFuckOffToMiddleSplitScroll('go')
	elseif curStep == 2999 then
		goGoNotesFuckOffToMiddleSplitScroll('return')
	end
end