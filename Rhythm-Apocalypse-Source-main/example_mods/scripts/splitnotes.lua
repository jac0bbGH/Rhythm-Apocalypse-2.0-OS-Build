function onCountdownStarted()
	if dadName == 'nebia' or dadName == 'true form' or dadName == 'bernard' or dadName == 'retgar' or dadName == 'bernardRetgarIcon'
	or dadName == 'bamndew' or dadName == 'jaocb' or dadName == 'bfPaint3D' or dadName == 'Aphrodite' then --replace the name for your character name dededededDEEZ nuts
		if inGameOver == false then
			for i=0,4,1 do
				setPropertyFromGroup('opponentStrums', i, 'texture', 'polynote')
			end
			for i = 0, getProperty('unspawnNotes.length')-1 do
				if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'polynote'); --Change texture
				end
			end
	    end
	end
end