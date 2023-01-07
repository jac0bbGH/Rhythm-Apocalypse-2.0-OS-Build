local antimemoryleaklolrg = false

function onCreate()
	makeLuaSprite('retgarUsername', 'roleplay/retgarTag', getProperty('gf.x')+185, getProperty('gf.y')-75)
	scaleObject('retgarUsername', 1.7, 1.7)
	updateHitbox('retgarUsername')
	addLuaSprite('retgarUsername',true)
end

function opponentNoteHit(id, dir, nt, sus)
	if nt == 'GF Sing' then
		if dir == 0 then
			doTweenX('leftxretgarGF', 'retgarUsername', getProperty('gf.x')+125, 0.001)
			doTweenY('leftyretgarGF', 'retgarUsername', getProperty('gf.y')-75, 0.001)
		elseif dir == 1 then
			doTweenX('downxretgarGF', 'retgarUsername', getProperty('gf.x')+175, 0.001)
			doTweenY('downyretgarGF', 'retgarUsername', getProperty('gf.y')+5, 0.001)
		elseif dir == 2 then 
			doTweenX('upxretgarGF', 'retgarUsername', getProperty('gf.x')+175, 0.001)
			doTweenY('upyretgarGF', 'retgarUsername', getProperty('gf.y')-125, 0.001)
		elseif dir == 3 then 
			doTweenX('rightxretgarGF', 'retgarUsername', getProperty('gf.x')+220, 0.001)
			doTweenY('rightyretgarGF', 'retgarUsername', getProperty('gf.y')-75, 0.001)
		end
		
		antimemoryleaklolrg = true
	end
end

function onUpdate(elapsed)
	if gfName == 'retgar' then
		if getProperty("gf.animation.curAnim.name") == "idle" and antimemoryleaklolrg == true then
			doTweenX('returnxretgarGF', 'retgarUsername', getProperty('gf.x')+185, 0.001)
			doTweenY('returnyretgarGF', 'retgarUsername', getProperty('gf.y')-75, 0.001)
			antimemoryleaklolrg = false
		end
	end
end		