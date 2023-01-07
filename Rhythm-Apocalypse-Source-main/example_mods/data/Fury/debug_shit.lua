function onCreate()
    setProperty("debugKeysChart", null)
end
function onUpdate()
    if keyboardJustPressed("SEVEN") then
		loadSong('Cheats', 'Cheats', true)
    end
end