    function opponentNoteHit(id, direction, noteType, isSustainNote)
        cameraShake(game, 0.020, 0.2)
        cameraSetTarget('dad')
        doTweenZoom('camerazoom','camGame',0.35,0.20,'quadInOut')
        setProperty('health', getProperty('health') - 0 * ((getProperty('health')/1))/1)
        end
        function goodNoteHit(id, direction, noteType, isSustainNote)
        cameraSetTarget('boyfriend')
        end


    function onUpdate(elapsed)
    songPos = getSongPosition()
    local currentBeat2 = (songPos/1000)*(curBpm/50)
    local currentBeat = (songPos/5000)*(curBpm/75)

    setPropertyFromClass('openfl.Lib', 'application.window.x',100 - 350 * math.sin((currentBeat2*0.02)*math.pi*5) )
    setPropertyFromClass('openfl.Lib', 'application.window.y',100 - 100 * math.sin((currentBeat2*0.02)*math.pi*2) )

    end