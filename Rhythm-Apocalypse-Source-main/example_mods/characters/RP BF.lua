antimemoryleaklolbf = false

function onCreate()
	if songName == 'Roleplay' then
		makeLuaSprite('bfUsername', 'roleplay/bfrobloxcensorshiptag', getProperty('boyfriend.x')+85, getProperty('boyfriend.y')-65)
		scaleObject('bfUsername', 1.7, 1.7)
		updateHitbox('bfUsername')
		addLuaSprite('bfUsername')
	end
end

function goodNoteHit(id, dir, nt, sus)
	if songName == 'Roleplay' then
		if dir == 0 then
			doTweenX('leftXBF', 'bfUsername', getProperty('boyfriend.x')+60, 0.001)
			doTweenY('leftYBF', 'bfUsername', getProperty('boyfriend.y')-55, 0.001)
		elseif dir == 1 then
			doTweenX('downXBF', 'bfUsername', getProperty('boyfriend.x')+65, 0.001)
			doTweenY('downYBF', 'bfUsername', getProperty('boyfriend.y')-15, 0.001)
		elseif dir == 2 then 
			doTweenX('upXBF', 'bfUsername', getProperty('boyfriend.x')+85, 0.001)
			doTweenY('upYBF', 'bfUsername', getProperty('boyfriend.y')-75, 0.001)
		elseif dir == 3 then 
			doTweenX('rightXBF', 'bfUsername', getProperty('boyfriend.x')+95, 0.001)
			doTweenY('rightYBF', 'bfUsername', getProperty('boyfriend.y')-55, 0.001)
		end
		
		antimemoryleaklolbf = true
	end
end

function noteMiss(id, dir, nt, sus)
	if songName == 'Roleplay' then
		if dir == 0 then
			doTweenX('leftXBF', 'bfUsername', getProperty('boyfriend.x')+60, 0.001)
			doTweenY('leftYBF', 'bfUsername', getProperty('boyfriend.y')-55, 0.001)
		elseif dir == 1 then
			doTweenX('downXBF', 'bfUsername', getProperty('boyfriend.x')+65, 0.001)
			doTweenY('downYBF', 'bfUsername', getProperty('boyfriend.y')-15, 0.001)
		elseif dir == 2 then 
			doTweenX('upXBF', 'bfUsername', getProperty('boyfriend.x')+85, 0.001)
			doTweenY('upYBF', 'bfUsername', getProperty('boyfriend.y')-75, 0.001)
		elseif dir == 3 then 
			doTweenX('rightXBF', 'bfUsername', getProperty('boyfriend.x')+95, 0.001)
			doTweenY('rightYBF', 'bfUsername', getProperty('boyfriend.y')-55, 0.001)
		end
		
		antimemoryleaklolbf = true
	end
end

function onUpdate()
	if songName == 'Roleplay' then
		if getProperty("boyfriend.animation.curAnim.name") == "idle" and antimemoryleaklolbf == true then
			doTweenX('returnXBF', 'bfUsername', getProperty('boyfriend.x')+85, 0.001)
			doTweenY('returnYBF', 'bfUsername', getProperty('boyfriend.y')-65, 0.001)
			antimemoryleaklol = false
		end
	end
end