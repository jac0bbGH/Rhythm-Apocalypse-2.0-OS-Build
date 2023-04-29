-- THIS SCRIPT AND ITS ASSETS WERE MADE BY ANONYMOUS SPECIFICALLY FOR DAVE AND BAMBI: RHYTHM APOCALYPSE. 
-- IF I CATCH YOU FUCKING USING THIS ANYWHERE ELSE
-- uh
-- idk just dont use it you fucking idiot
-- thanks

-- ps., my code probably sucks and could be done better, lmao

local hexcode = "148c1e" -- to anyone reading, I would've gotten this from dad.healthColorArray with an rgb to hex script but the color and alpha completely break, so you gotta do it manually.
local composer = "MrDragadon"
local charter = "Ninten"
local bonusnote = "This song was originally gonna be Oh-Shit v5, Oh yeah, and watch out for phone notes!"
local bonusnoteon = true

-- now you may be wondering, "anonymous, why the hell did you make the text creation, sprite creation and movement into functions?
-- idk convenience I guess lmao, and to not clutter everything at the top, even though I could just do that

local function creditThingCreate()
	makeLuaSprite('creditthing', 'credit_thingy', -1280, 0)
	setObjectCamera('creditthing', 'camOther')
	scaleObject('creditthing', 0.8, 0.8)
	updateHitbox('creditthing')
	screenCenter('creditthing', 'y')
	addLuaSprite('creditthing', false)
end	

local function textConfig(name, txtSize)
	setTextSize(name, txtSize)
	setTextAlignment(name, 'center')
	setObjectCamera(name, 'camOther')
end

local function textCreate()
	makeLuaText('comp', 'Composed by: ' .. composer, 1000, -1280, 300)
	textConfig('comp', 45)
	addLuaText('comp')
	
	makeLuaText('chart', 'Charter: ' .. charter, 1000, -1280, 350)
	textConfig('chart', 45)
	addLuaText('chart')
	if bonusnoteon then
		makeLuaText('bonus', bonusnote, 500, -1280, 500)
		textConfig('bonus', 25)
		addLuaText('bonus')
	end
end

function onCreatePost()
	creditThingCreate()
	textCreate()
end

function onCountdownTick(counter)
	if counter == 0 then
		doTweenColor('colorer', 'creditthing', hexcode, 0.0001, 'linear')
		doTweenX('appearance', 'creditthing', 35, 0.3, 'sineInOut')
		doTweenX('appearancetwo', 'comp', 150, 0.3, 'sineInOut')
		doTweenX('appearancethri', 'chart', 150, 0.3, 'sineInOut')
		doTweenX('appearancefor', 'bonus', 360, 0.3, 'sineInOut')
	elseif counter == 4 then
		doTweenX('disappearance', 'creditthing', 2035, 2, 'sineInOut')
		doTweenX('disappearancetwo', 'comp', 2150, 2, 'sineInOut')
		doTweenX('disappearancethri', 'chart', 2150, 2, 'sineInOut')
		doTweenX('disappearancefor', 'bonus', 2360, 2, 'sineInOut')
	end
end

function onTweenCompleted(tag)
	if tag == 'disappearancefor' then
		removeLuaSprite('creditthing')
		removeLuaText('comp')
		removeLuaText('chart')
		removeLuaText('bonus')
	end
end
		