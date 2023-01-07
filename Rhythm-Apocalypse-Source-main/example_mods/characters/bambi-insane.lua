local poop = 0
local zoombamb = 0.4

function onCreatePost()
	poop = getProperty("defaultCamZoom")
end

function onUpdate()
	if dadName == "bambi-insane" then
		function opponentNoteHit(id, noteData, noteType, isSustainNote)
			if not isSustainNote then
				setProperty("defaultCamZoom", zoombamb)
			end
		end
		function goodNoteHit(id, noteData, noteType, isSustainNote)
			if not isSustainNote then
				setProperty("defaultCamZoom", poop)
			end
		end
	elseif bfName == "bambi-insane" then
		function opponentNoteHit(id, noteData, noteType, isSustainNote)
			if not isSustainNote then
				setProperty("defaultCamZoom", poop)
			end
		end
		function goodNoteHit(id, noteData, noteType, isSustainNote)
			if not isSustainNote then
				setProperty("defaultCamZoom", zoombamb)
			end
		end
	end
end