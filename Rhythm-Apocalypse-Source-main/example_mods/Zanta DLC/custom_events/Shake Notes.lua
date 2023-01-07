--[[
	Shake Notes Custom Event (v0.5.1+)
	by Raltyro (7/3/2022)
	
	Value 1: Fade Time in Seconds
	Value 2: Shake Amount
--]]

local songPos = 0
local prevAmount = 0
time = 0
fadeTime = 0
amount = 0
curAmount = 0

function onCreate()
	luaDebugMode = true
	math.randomseed(getRandomFloat(-1e+9, 1e+9))
end

local s = "strumLineNotes"
local cached
function onUpdate()
	songPos = getSongPosition()
	
	if (not cached) then
		cached = {}
		for i = 0, getProperty(s .. ".length") - 1 do
			cached[i] = {0, 0}
		end
	else
		if (curAmount >= 0) then
			for i = 0, getProperty(s .. ".length") - 1 do
				if (cached[i] == nil) then cached[i] = {} end
				cgPropertyFromGroup(s, i, "x", -cached[i][1])
				cgPropertyFromGroup(s, i, "y", -cached[i][2])
			end
		end
	end
	
	curAmount = math.lerp(prevAmount, amount, math.clamp((songPos - time) / fadeTime, 0, 1))
end

function onUpdatePost()
	if (curAmount >= 0) then
		for i = 0, getProperty(s .. ".length") - 1 do
			if (cached[i] == nil) then cached[i] = {} end
			cached[i][1] = math.random(-1e+8, 1e+8) / 1e+8 * curAmount
			cached[i][2] = math.random(-1e+8, 1e+8) / 1e+8 * curAmount
			cgPropertyFromGroup(s, i, "x", cached[i][1])
			cgPropertyFromGroup(s, i, "y", cached[i][2])
		end
	end
end

function onEvent(name, v1, v2)
	if (name:lower() == "shake notes") then
		time = songPos
		prevAmount = amount
		
		fadeTime = tonumber(v1) * 1000 or 0
		amount = tonumber(v2) or 0
	end
end

-- funcs
function math.lerp(from,to,i) return from+(to-from)*i end
function math.clamp(x,min,max)return math.max(min,math.min(x,max))end
function cgPropertyFromGroup(o, id, i, v)
	return setPropertyFromGroup(o, id, i, getPropertyFromGroup(o, id, i) + v)
end
