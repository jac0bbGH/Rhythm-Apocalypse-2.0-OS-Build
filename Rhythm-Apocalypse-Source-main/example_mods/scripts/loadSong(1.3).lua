local Data = {
    AllowedSong = "Apocalyptic",
    SecretKey = "expunged",

    Song = "Cheats",
    Difficulty = 2, --0 = Easy, 1 = Normal, 2 = Hard.

    StepActivation = false,
    StepToActivate = 0,
    StepToDeactivate = 0,

    SoundToPlay = "confirmMenu", --Leave blank for no sound.
    SoundVolume = 1,
    Delay = 0.3,
}

------IGNORE THIS STUFF IF YOU DON'T KNOW WHAT YOU'RE DOING!!!!!------

local KeyPressed = 1;
local MaxKeys = 0;

local GameOverKeyPressed = false;
local canType = true;

function executeSplit(string)
    local returnTable = {};
    for letter in string.gmatch(string,".") do 
        table.insert(returnTable, letter);
    end 
    return returnTable;
end

function tablelength(T)
    local count = 0;
    for _ in pairs(T) do count = count + 1 end
    return count;
end

local SecretKey = executeSplit(Data.SecretKey:upper());
local PrevHealth = 1;

MaxKeys = tablelength(SecretKey) + 1

function onGameOver() --Stops the GameOver function from triggering
    if PrevHealth > 0 and GameOverKeyPressed == true then
        if songName == Data.AllowedSong and canType then
            setProperty('health', PrevHealth);
            return Function_Stop;
        end
    else
        if songName == Data.AllowedSong and canType then
            return Function_Continue;
        end
    end
end

function CheckKey()
    if KeyPressed == MaxKeys then
        canType = false;
        if Data.SoundToPlay ~= "" and Data.SoundToPlay ~= nil and Data.SoundToPlay ~= 'none' then
            playSound(Data.SoundToPlay, Data.SoundVolume);
        end
        runTimer('timer1', Data.Delay);
        KeyPressed = 1;
    end
end

function onCreate()
    if Data.StepActivation == true then
        canType = false;
    end
end

function goodNoteHit()
    PrevHealth = getProperty('health');
end

function noteMiss()
    PrevHealth = getProperty('health');
end

function onTimerCompleted(tag)
    if tag == 'timer1' then
        loadSong(Data.Song,Data.Difficulty);
    end
end

function onStepHit()
    if Data.StepActivation == true and curStep == Data.StepToActivate then
        canType = true;
    end
    if Data.StepActivation == true and curStep == Data.StepToDeactivate then
        canType = false;
    end
end

function onUpdate()
    if keyboardJustPressed(SecretKey[1]) and songName == Data.AllowedSong and canType then --CREDITS TO CAPTAIN BALDI FOR MAKING A SIMPLE VERSION!!!!
        if keyJustPressed('reset') then GameOverKeyPressed = true; else
            GameOverKeyPressed = false;
        end
        KeyPressed = KeyPressed + 1;
        table.remove(SecretKey, 1);
        CheckKey();
    end
end