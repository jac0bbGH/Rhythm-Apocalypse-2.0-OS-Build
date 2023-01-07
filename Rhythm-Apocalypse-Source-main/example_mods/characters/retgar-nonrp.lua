local antimemoryleaklolrgdad = false

function onCreate()
	makeLuaSprite('retgarUsername', 'roleplay/retgarTag', getProperty('dad.x')+185, getProperty('dad.y')-75)
	scaleObject('retgarUsername', 1.7, 1.7)
	updateHitbox('retgarUsername')
	addLuaSprite('retgarUsername',true)
end

function opponentNoteHit(id, dir, nt, sus)
	if dir == 0 then
		doTweenX('leftxretgardad', 'retgarUsername', getProperty('dad.x')+125, 0.001)
		doTweenY('leftyretgardad', 'retgarUsername', getProperty('dad.y')-75, 0.001)
	elseif dir == 1 then
		doTweenX('downxretgardad', 'retgarUsername', getProperty('dad.x')+175, 0.001)
		doTweenY('downyretgardad', 'retgarUsername', getProperty('dad.y')+5, 0.001)
	elseif dir == 2 then 
		doTweenX('upxretgardad', 'retgarUsername', getProperty('dad.x')+175, 0.001)
		doTweenY('upyretgardad', 'retgarUsername', getProperty('dad.y')-125, 0.001)
	elseif dir == 3 then 
		doTweenX('rightxretgardad', 'retgarUsername', getProperty('dad.x')+220, 0.001)
		doTweenY('rightyretgardad', 'retgarUsername', getProperty('dad.y')-75, 0.001)
	end
		
		antimemoryleaklolrgdad = true
	end
end

function onUpdate(elapsed)
	if dadName == 'retgar' then
		if getProperty("dad.animation.curAnim.name") == "idle" and antimemoryleaklolrgdad == true then
			doTweenX('returnxretgardad', 'retgarUsername', getProperty('dad.x')+185, 0.001)
			doTweenY('returnyretgardad', 'retgarUsername', getProperty('dad.y')-75, 0.001)
			antimemoryleaklolrgdad = false
		end
	end
end		