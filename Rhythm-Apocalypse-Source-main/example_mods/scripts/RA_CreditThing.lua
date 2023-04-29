-- THIS SCRIPT AND ITS ASSETS WERE MADE BY ANONYMOUS SPECIFICALLY FOR DAVE AND BAMBI: RHYTHM APOCALYPSE. 
-- fixed by C_ubex I think lol
-- IF I CATCH YOU FUCKING USING THIS ANYWHERE ELSE
-- uh
-- idk just dont use it you fucking idiot
-- thanks

-- ps., my code probably sucks and could be done better, lmao



-- now you may be wondering, "anonymous, why the hell did you make the text creation, sprite creation and movement into functions?
-- idk convenience I guess lmao, and to not clutter everything at the top, even though I could just do that

local hexcode = "ffffff"
local composer = "Composer Here"
local charter = "Charter Here"
local bonusnote = "Bonus Note here"
local bonusnoteon = true


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
	if songName == "Apocalyptic" then
		makeLuaSprite('creditthing1', 'credit images/credit_bambi', -1280, 0)
		hexcode = "148c1e"
		composer = "NoxturnalMusic"
		charter = "Sider"
		bonusnote = "This song had to get four versions"
		bonusnoteon = true
	elseif songName == "Aureum" then
		hexcode = "ffb13d"
		composer = "NoxturnalMusic"
		charter = "shammal"
		bonusnote = "Aureum is Golden translated to latin."
		bonusnoteon = true
	elseif songName == "Corn-Chaos" then
		hexcode = "148c1e"
		composer = "MrDragadon"
		charter = "Ninten"
		bonusnote = "This is the 6th version of Corn-Chaos, old song name was Oh-Shit, what we're we thinking?"
		bonusnoteon = true
	elseif songName == "Cornophobia" then
		hexcode = "148c1e"
		composer = "NoxturnalMusic"
		charter = "Andrewidot"
		bonusnote = "what"
		bonusnoteon = true
	elseif songName == "Debugged" then
		hexcode = "80061b"
		composer = "Dyla"
		charter = "Externality"
		bonusnoteon = false
	elseif songName == "Disfunction" then
		hexcode = "80061b"
		composer = "Objectshowmaster & NoxturnalMusic"
		charter = "EliteHimself"
		bonusnote = "Manic-Mania was horrible."
		bonusnoteon = true
	elseif songName == "First-Lesson" then
		hexcode = "1d0dff"
		composer = "Objectshowmaster"
		charter = "Externality"
		bonusnoteon = false
	elseif songName == "Fury" then
		hexcode = "ff0000"
		composer = "NoxturnalMusic"
		charter = "Anonymous & hydration"
		bonusnote = "Objectshowmaster hates Angry-Assault"
		bonusnoteon = true
	elseif songName == "Gettin-Around" then
		hexcode = "1d0dff"
		composer = "Objectshowmaster"
		charter = "Andrewidot"
		bonusnote = "The 3D World will be your dismay."
		bonusnoteon = true
	elseif songName == "heart-of-gold" then
		hexcode = "ffb13d"
		composer = "Aadsta"
		charter = "RhythmShadow"
		bonusnoteon = false
	elseif songName == "Intergalactic" then
		hexcode = "1d0dff"
		composer = "NoxturnalMusic"
		charter = "EliteHimself"
		bonusnote = "This song is very old."
		bonusnoteon = true
	elseif songName == "Interstellar" then
		hexcode = "ff193c"
		composer = "NoxturnalMusic"
		charter = "retroaction64"
		bonusnote = "This song is also very old."
		bonusnoteon = true
	elseif songName == "kys" then
		hexcode = "ff193c"
		composer = "SunnyTheBird/CosmicAlex"
		charter = "Andrewidot"
		bonusnote = "KYS"
		bonusnoteon = true
	elseif songName == "Lunar" then
		hexcode = "ff193c"
		composer = "NoxturnalMusic"
		charter = "hydration"
		bonusnote = "6160mas can keep crying about the amen breaks."
		bonusnoteon = true
	elseif songName == "Malicious" then
		hexcode = "67a305"
		composer = "NoxturnalMusic & MrDragadon"
		charter = "Sider"
		bonusnoteon = false
	elseif songName == "Malicious" then
		hexcode = "67a305"
		composer = "NoxturnalMusic & MrDragadon"
		charter = "Sider"
	elseif songName == "phone-fury" then
		hexcode = "148c1e"
		composer = "Random Wees"
		charter = "Random Wees"
		bonusnote = "i love phone fury - jac0bb"
		bonusnoteon = true
	elseif songName == "Rhythm-024" then
		hexcode = "ff2448"
		composer = "ShredBoi"
		charter = "Externality"
		bonusnote = "Nikku is an oc by Saruky."
		bonusnoteon = true
	elseif songName == "Roleplay" then
		hexcode = "ffc800"
		composer = "Objectshowmaster"
		charter = "Andrewidot"
		bonusnote = "Bernard & Retgar come from a roblox game called Bambi OC RP."
		bonusnoteon = true
	elseif songName == "Three-Sixty" then
		hexcode = "a600ff"
		composer = "Objectshowmaster"
		charter = "shammal"
		bonusnote = " "
		bonusnoteon = true
	elseif songName == "Tim" then
		hexcode = "ffb65c"
		composer = "Objectshowmaster"
		charter = "Objectshowmaster"
		bonusnote = "tim"
		bonusnoteon = true
	elseif songName == "Titanium" then
		hexcode = "148c1e"
		composer = "NoxturnalMusic"
		charter = "Sider"
		bonusnote = "FL Slayer Supremacy"
		bonusnoteon = true
	elseif songName == "Untitled-Dave-Song" then
		hexcode = "ff6200"
		composer = "NoxturnalMusic"
		charter = "Objectshowmaster"
		bonusnote = "This song is based off of Untitled Goose Game."
		bonusnoteon = true
	elseif songName == "Utilization" then
		hexcode = "80060c"
		composer = "Dinebon_"
		charter = "Externality"
		bonusnote = ""
		bonusnoteon = true
	elseif songName == "Vanilla" then
		hexcode = "a3ff9e"
		composer = "Objectshowmaster"
		charter = "ReeVrze"
		bonusnote = "Nebia is the mascot, expect to see more of her in v2"
		bonusnoteon = true
	elseif songName == "marshmallow" then
		hexcode = "ff8af7"
		composer = "Objectshowmaster"
		charter = "Objectshowmaster and SharkNator"
		bonusnote = " "
		bonusnoteon = true
	elseif songName == "Wheelchair" then
		hexcode = "1d0dff"
		composer = "Objectshowmaster"
		charter = "BarGames"
		bonusnote = "Wheelchair is the least changed song in the mod."
		bonusnoteon = true
	elseif songName == "Haccer-Uhoh" then
		hexcode = "780449"
		composer = "Objectshowmaster"
		charter = "Objectshowmaster"
		bonusnote = "Inside joke, you wouldn't get it."
		bonusnoteon = true
	elseif songName == "xbox" then
		hexcode = "2d660e"
		composer = "Sinjl"
		charter = "Sinjl"
		bonusnote = "lol have fun"
		bonusnoteon = true
	elseif songName == "No-Corn" then
		hexcode = "148c1e"
		composer = "Hazetal"
		charter = "Ozziebruh"
		bonusnote = "jac0bb's favorite fantrack."
		bonusnoteon = true
	elseif songName == "Phobos" then
		hexcode = "ff5c26"
		composer = "NoxturnalMusic"
		charter = "MintyFresh"
		bonusnote = "OC by Zmac"
		bonusnoteon = true
	elseif songName == "Elevator" then
		hexcode = "172080"
		composer = "SnipSnap"
		charter = "FyriDev"
		bonusnote = "Bansu is sick, so his voice is messed up."
		bonusnoteon = true
	elseif songName == "Chipmunk-Beatathon" then
		hexcode = "148c1e"
		composer = "rhythm apocalypse leaker"
		charter = "FrogB"
		bonusnote = "what da hell"
		bonusnoteon = true
   end
	creditThingCreate()
	textCreate()
end

function onCountdownTick(counter)
	if counter == 0 then
		doTweenColor('colorer', 'creditthing', hexcode, 0.0001, 'linear')
		doTweenX('appearance', 'creditthing', 35, 0.3, 'sineInOut')
		doTweenX('appearancetwo', 'comp', 150, 0.4, 'sineInOut')
		doTweenX('appearancethri', 'chart', 150, 0.4, 'sineInOut')
		doTweenX('appearancefor', 'bonus', 360, 0.4, 'sineInOut')
	elseif counter == 4 then
		doTweenX('disappearance', 'creditthing', 2035, 2, 'sineInOut')
		doTweenX('disappearancetwo', 'comp', 2150, 2.2, 'sineInOut')
		doTweenX('disappearancethri', 'chart', 2150, 2.4, 'sineInOut')
		doTweenX('disappearancefor', 'bonus', 2360, 2.6, 'sineInOut')
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