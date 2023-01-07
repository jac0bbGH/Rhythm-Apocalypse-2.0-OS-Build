function onUpdatePost()
 setProperty("iconP1.scale.y", (getProperty("iconP1.scale.y") - 1) / -0.75 + 1)
 setProperty("iconP2.scale.y", (getProperty("iconP2.scale.y") - 1) / -0.55 + 1)
end

local gfSpeed = 1;

function onBeatHit()

	if (curBeat % gfSpeed == 0) then
		if curBeat % (gfSpeed * 2) == 0 then
			setProperty('iconP1.scale.x', 0.7 );
			setProperty('iconP1.scale.y', 0.9 );
			setProperty('iconP2.scale.x', 0.7 );
			setProperty('iconP2.scale.y', 0.9 );

			setProperty('iconP1.angle', -20);
			setProperty('iconP2.angle', 20);
		else
			setProperty('iconP1.scale.x', 1.2 );
			setProperty('iconP1.scale.y', 1.1 );
			setProperty('iconP2.scale.x', 1.2 );
			setProperty('iconP2.scale.y', 1.1 );

			setProperty('iconP2.angle', -20);
			setProperty('iconP1.angle', 20);
		end

	end

end

function onUpdate()

    if (getProperty('iconP1.angle') >= 0) then
	    if ('iconP1.angle' ~= 0) then
    	    setProperty('iconP1.angle', getProperty('iconP1.angle')-2);
    	end
    else
        if ('iconP1.angle' ~= 0) then
    	    setProperty('iconP1.angle', getProperty('iconP1.angle')+2);
    	end
    end

    if (getProperty('iconP2.angle') >= 0) then
	    if ('iconP2.angle' ~= 0) then
    	    setProperty('iconP2.angle', getProperty('iconP2.angle')-2);
    	end
    else
        if ('iconP2.angle' ~= 0) then
    	    setProperty('iconP2.angle', getProperty('iconP2.angle')+2);
    	end
    end

end