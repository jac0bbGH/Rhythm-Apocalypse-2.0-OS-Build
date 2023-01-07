local antimemoryleaklol = false

function onCreate()
	makeLuaSprite('bernardUsername', 'roleplay/bernardTag', getProperty('dad.x')+135, getProperty('dad.y')-75)
	scaleObject('bernardUsername', 1.7, 1.7)
	updateHitbox('bernardUsername')
	addLuaSprite('bernardUsername',true)
end

function opponentNoteHit(id, dir, nt, sus)
	if nt == 'GF Sing' then
		-- so I cannot do if not noteType YET I can do this thingy I did
		-- I love psych engine lua
	else
		if dir == 0 then
			doTweenX('leftX', 'bernardUsername', getProperty('dad.x')+105, 0.001)
			doTweenY('leftY', 'bernardUsername', getProperty('dad.y')-75, 0.001)
		elseif dir == 1 then
			doTweenX('downX', 'bernardUsername', getProperty('dad.x')+135, 0.001)
			doTweenY('downY', 'bernardUsername', getProperty('dad.y')+5, 0.001)
		elseif dir == 2 then 
			doTweenX('upX', 'bernardUsername', getProperty('dad.x')+135, 0.001)
			doTweenY('upY', 'bernardUsername', getProperty('dad.y')-75, 0.001)
		elseif dir == 3 then 
			doTweenX('rightX', 'bernardUsername', getProperty('dad.x')+155, 0.001)
			doTweenY('rightY', 'bernardUsername', getProperty('dad.y')-75, 0.001)
		end
	end
	
	antimemoryleaklol = true
end

function onUpdate()
	if dadName == 'bernard' then
		if getProperty("dad.animation.curAnim.name") == "idle" and antimemoryleaklol == true then
			doTweenX('returnX', 'bernardUsername', getProperty('dad.x')+135, 0.001)
			doTweenY('returnY', 'bernardUsername', getProperty('dad.y')-75, 0.001)
			antimemoryleaklol = false
		end
	end
end		