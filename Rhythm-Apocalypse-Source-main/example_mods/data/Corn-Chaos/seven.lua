function onCreatePost()
     setProperty('debugKeysChart', null);
end

function onUpdate()

if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') then

     loadSong('debugged');

end
end