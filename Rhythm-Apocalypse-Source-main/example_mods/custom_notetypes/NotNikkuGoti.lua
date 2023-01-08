function opponentNoteHit(id, direction, noteType, isSustainNote)
	-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
	-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
	-- noteType: The note type string/tag
	-- isSustainNote: If it's a hold note, can be either true or false
	if noteType=='NotNikkuGoti' then
		if direction==0 then
			cancelTween('revert')
			setProperty('camHUD.angle', 0)
			setProperty('camHUD.y', 0)
			setProperty('camHUD.angle', -5)
			doTweenAngle('revert', 'camHUD', 0, 0.3, 'CircOut')
		
		elseif direction==1 then
			cancelTween('revert')
			setProperty('camHUD.angle', 0)
			setProperty('camHUD.y', 0)
			setProperty('camHUD.y', 25)
			doTweenY('revert', 'camHUD', 0, 0.3, 'CircOut')
		
		elseif direction==2 then
			cancelTween('revert')
			setProperty('camHUD.angle', 0)
			setProperty('camHUD.y', 0)
			setProperty('camHUD.y', -25)
			doTweenY('revert', 'camHUD', 0, 0.3, 'CircOut')
		
		elseif direction==3 then
			cancelTween('revert')
			setProperty('camHUD.angle', 0)
			setProperty('camHUD.y', 0)
			setProperty('camHUD.angle', 5)
			doTweenAngle('revert', 'camHUD', 0, 0.3, 'CircOut')
		
		end
		cameraShake('game', 0.005, 0.07)
		cameraShake('HUD', 0.005, 0.07)
	end
end