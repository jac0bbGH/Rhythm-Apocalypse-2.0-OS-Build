--[[
  dialogue files are automatically detected, so you dont need to do anything here
  
  quick example of a dialogue file
  
effect:character,expression:Hey guys!

  the only effect in the game is to_black
  the character and expressions get put together like this for images:
  dialogue/[character]/[character]_[expression]
  example:
  dialogue/bambi/bambi_annoyed
            ^     ^       ^
            |     |       |
            |_____|       |
               |          |
               V          V
            character    expression
  
  
]]





dialogue = {}
endDialogue = {}
hasSeenShit = false
hasSeenEndShit = false
SHUTTHEFUCKUP = false
dialogueSounds = {
  ['bf'] = {'dialogue/bfDialogue'},
  ['gf'] = {'dialogue/gfDialogue'},
  ['dave'] = {'dialogue/daveDialogue'},
  ['bambi'] = {'dialogue/bambDialogue1', 'dialogue/bambDialogue2', 'dialogue/bambDialogue3'},
  ['tristan'] = {'dialogue/trisDialogue'}
}
expressionPositions = { --if expressions have specific positions put them here
  ['dave'] = {
    ['scared'] = {180, 220},
    ['phone'] = {0, -100},
    ['3d-scared'] = {110, 226},
    ['shocked'] = {150, 220},
    ['furious'] = {170, 220},
    ['festival-3d-scared'] = {135, 174},
    ['festival'] = {200, 175},
    ['festival-tired'] = {200, 175},
    ['festival-exhausted'] = {200, 175}
  }
}
charPositions = {
  ['dave'] = {200, 220},
  ['bambi'] = {200, 220},
  ['tristan'] = {142, 200},
  ['bf'] = {570, 220},
  ['gf'] = {570, 220}
}
scarySongSongs = {'polygonized', 'interdimensional', 'master'}
joke = {'supernovae', 'glitch'}
speechSprite = 'speechBubble'
function onCreate()
  initSaveData('DavePsychEngine')
  globalCool = save.get('globalGuys')
  addAnim = addAnimationByPrefix
  local skipDia = globalCool.isStoryMode ~= true
  if not skipDia then
    luaDebugMode = true
    addHaxeLibrary('StringTools')
    addHaxeLibrary('FlxText', 'flixel.text')
    addHaxeLibrary('FlxTypeText', 'flixel.addons.text')
    addHaxeLibrary('Std')
    hasDialogue = checkFileExists('data/dialogue/'..songName..'.txt')
    hasEndDialogue = checkFileExists('data/dialogue/'..songName..'-endDialogue.txt')
    ----debugPrint(tostring(hasDialogue)..', '..tostring(hasEndDialogue))
    local rawStart = ''
    if hasDialogue then
      rawStart = getTextFromFile('data/dialogue/'..songName..'.txt')
      -- playMusic()
    end
    local rawEnd = ''
    if hasEndDialogue then
      rawEnd = getTextFromFile('data/dialogue/'..songName..'-endDialogue.txt')
    end
    local penis = {rawStart, rawEnd}
    local stupidBullshit = 1
    for k,v in pairs(penis) do
      for k,v in pairs(split(v, '\n')) do
        if stupidBullshit == 1 and hasDialogue or stupidBullshit == 2 and hasEndDialogue then
          local thing = split(' '..coolSub(v, '\\n', ''), ':')
          local dialogueShit = {
            char = split(thing[2], ',')[1],
            emotion = split(thing[2], ',')[2],
            dialogue = thing[3],
            effect = coolSub(thing[1], ' ', ''),
            animated = false,
            right = split(thing[2], ',')[1] == 'bf' or split(thing[2], ',')[1] == 'gf'
          }
          if stupidBullshit == 1 then
            table.insert(dialogue, dialogueShit)
          else
            table.insert(endDialogue, dialogueShit)
          end
        end
      end
      stupidBullshit = 2
    end

    if save.get('startCutscene') ~= nil then
      hasDialogue = not save.get('startCutscene').seenCutscene
    end
    -- setProperty('camHUD.zoom', 0.9)
  end
end
save = {}
function save.get(field, other)
  if field == nil then return nil end
  return getDataFromSave('DavePsychEngine', field, other)
end
function save.set(field, value)
  setDataFromSave('DavePsychEngine', field, value)
end
function contains(tab, what)
  for k,v in pairs(tab) do
    if what == v then
      return true;
    end
  end
  return;
end
function coolSub(str, getOutNowIdiot, hello)
  return runHaxeCode([[
    var str = "]]..str..[[";

    return StringTools.replace(str, "]]..getOutNowIdiot..[[", "]]..hello..[[");
  ]])
end
function split(inputstr, sep)
    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end
function onStartCountdown()
  if songName:lower() ~= 'cutscene-handler' then
    if hasDialogue and not hasSeenShit then
      runTimer('okYAY', 0.8)
      setProperty('inCutscene', true)
      hasSeenShit = true;
      save.set('startCutscene', {
        song = songName,
        seenCutscene = true
      })
      return Function_Stop;
    end
    if hasEndDialogue then
      callOnLuas('preventEndSong', {true})
    end
    return Function_Continue;
  end
end
function onEndSong()
  if not skipDia then
    if hasEndDialogue and not hasSeenEndShit then
      speechSprite = 'speechBUbbleENDDDND'
      runTimer('fuckinCool', 0)
      hasSeenEndShit = true
      setProperty('inCutscene', true)
      return Function_Stop;
    end
  end
  save.set('startCutscene', nil)
  return Function_Continue;
end
function onTimerCompleted(tag)
  if tag == 'okYAY' then
    curDialogue = dialogue
    openDialogue()
  elseif tag == 'fuckinCool' then
    isEnd = true
    curDialogue = endDialogue
    openDialogue()
  elseif tag == 'updateText' then
    updateText()
  elseif tag == 'speech' then
    --debugPrint('ok gonna start')
    playAnim(speechSprite, 'normal', true)
    goToNextDialogue()
  end
  if timers[tag] ~= nil then
    timers[tag]()
    timers[tag] = nil
    if stringStartsWith(tag, 'blank_tags-') then
      timers.blankTags = tonumber(stringSplit(tag, '-')[2])
    end
  end
end
musicYeah = 'DaveDialogue'
function openDialogue()
  -- if tag == 'dialogue' then
    SHUTTHEFUCKUP = false
    inDialogue = true
    curLine = ''
    curLineIndex = 0
    curLineBuffer = ''
    curLineNum = 0
    curChar = 'bf'
    curExpression = 'happy'
    -- runHaxeCode[[
    --   coolFuck = game.subState;
    --   coolFuck.cameras[1].zoom = 0.9;
    --   trace('okokok');
    -- ]]
    if contains(scarySongSongs, songName:lower()) then
      musicYeah = 'scaryAmbience'
    end
    if contains(joke, songName:lower()) then
      musicYeah = 'dooDooFeces'
    end
    playMusic(musicYeah, 0, true)
    soundFadeIn(nil, 1, 0, 0.8)

    makeLuaSprite('bgFade')
    makeGraphic('bgFade', 1280, 720, '0xFF8A9AF5')
    setProperty('bgFade.alpha', 0)
    add('bgFade')
    doTweenAlpha('helloBGFADE', 'bgFade', 0.7, 4.15)

    --precache dialogue images
    ----debugPrint('ok')
    ----debugPrint(curDialogue)
    for k,dObj in pairs(curDialogue) do
      -- for k,v in pairs(dObj) do
      --   ----debugPrint(tostring(k)..' => '..tostring(v))
      -- end
      local expr = 'happy'
      if dObj.emotion ~= nil then
        expr = dObj.emotion
      end
      precacheImage('dialogue/'..dObj.char..'/'..dObj.char..'_'..expr)
      curDialogue[k].animated = checkFileExists('images/dialogue/'..dObj.char..'/'..dObj.char..'_'..expr..'.xml')
    end
    if luaSpriteExists(speechSprite) then
      removeLuaSprite(speechSprite, true)
    end
    makeAnimatedLuaSprite(speechSprite, 'ui/speech_bubble_talking', -20, 400)
    addAnim(speechSprite, 'normalOpen', 'Speech Bubble Normal Open', 12, false)
    addAnim(speechSprite, 'normal', 'speech bubble normal0', 5, true)
    addAnim(speechSprite, 'ah', 'AHH')
    addAnim(speechSprite, 'ahOpen', 'speech bubble loud ope')
    setGraphicSize(speechSprite, toInt(getProperty(speechSprite..'.width') / 7))
    setGraphicSize(speechSprite, toInt(getProperty(speechSprite..'.width') * 6 * 0.9))
    screenCenter(speechSprite, 'X')
    playAnim(speechSprite, 'normalOpen', true)
    runTimer('speech', 0.5)
    add(speechSprite)

    makeText('dialogueTxtBG', '', 242, 502, screenWidth * 0.6)
    setTextSize('dialogueTxtBG', 32)
    setTextColor('dialogueBG', '0xFF00137F')
    setTextBorder('dialogueBG', 0, '0xFF00137F')
    setTextAlignment('dialogueTxtBG', 'LEFT')
    addText('dialogueTxtBG')

    makeText('dialogueTxt', '', 240, 500, screenWidth * 0.6)
    setTextSize('dialogueTxt', 32)
    setTextColor('dialogueTxt', '000000')
    setTextBorder('dialogueTxt', 0, '000000')
    setTextAlignment('dialogueTxt', 'LEFT')
    addText('dialogueTxt')
  -- end
end
function toInt(num)
  addHaxeLibrary('Std')
  if type(num) ~= 'number' then
    debugPrint('idiot number needed in toInt function')
    return 0;
  end
  return runHaxeCode('return Std.int('..tostring(num)..');')
end
function makeText(tag, text, x, y, width) --lol
  makeLuaText(tag, text, width, x, y)
end
function goToNextDialogue()
  curLineNum = curLineNum + 1
  local dObj = curDialogue[curLineNum];
  if dObj == nil then
    --debugPrint('closing cause i cant find any more diadasdasf!!')
    closeShit()
    return;
  end
  curLineIndex = 0
  curLineBuffer = ''
  curLine = dObj.dialogue
  curChar = dObj.char

  -- --debugPrint(curLine)

  if luaSpriteExists('dialoguePort') then
    removeLuaSprite('dialoguePort')
  end

  local expr = 'happy'
  if dObj.emotion ~= nil then
    expr = dObj.emotion
  end
  expr = coolSub(expr, '-', '_')
  if expr == 'festival' then
    expr = 'festival_happy'
  end

  ----debugPrint(expr)
  if dObj.char ~= 'generic' then
    local dumb = makeLuaSprite
    if expr == 'scared' then
      dumb = makeAnimatedLuaSprite
    end
    local pos = {0, 250}
    if charPositions[curChar] then
      pos = charPositions[curChar]
    end
    if expressionPositions[curChar] and expressionPositions[curChar][expr] then
      pos = expressionPositions[curChar][expr]
    end
    local shitToGoTo = pos[1]
    dumb('dialoguePort', 'dialogue/'..dObj.char..'/'..dObj.char..'_'..expr, pos[1], pos[2])
    if expr == 'scared' then
      addAnim('dialoguePort', 'idle', 'post')
      playAnim('dialoguePort', 'idle')
    end
    local fucker = dObj.right and 1280 or -getProperty('dialoguePort.width') - 100
    setProperty('dialoguePort.x', fucker)
    setProperty('dialoguePort.alpha', 0)
    -- if expressionOffsets[curChar][expr] then
    --   local shit = expressionOffsets[curChar][expr]
    --   setProperty('dialoguePort.x', getProperty('dialoguePort.x') + shit[1])
    --   setProperty('dialoguePort.y', getProperty('dialoguePort.y') + shit[2])
    -- end
    add('dialoguePort')
    setObjectOrder('dialoguePort', getObjectOrder(speechSprite))
    doTweenX('difsdsa', 'dialoguePort', shitToGoTo, 0.25)
    doTweenAlpha('difsdsa2', 'dialoguePort', 1, 0.25)
  end
  local effectShits = {
    ['to_black'] = function()
      makeLuaSprite('shit')
      makeGraphic('shit', 1280, 720, '000000')
      setObjectCamera('shit', 'other')
      setProperty('shit.alpha', 0)
      addLuaSprite('shit')
      doTweenAlpha('shit', 'shit', 1, 0.25)
    end,
    ['setfont_normal'] = function()
      setTextFont('dialogueTxt', 'vcr.tff')
      setTextFont('dialogueTxtBG', 'vcr.tff')
    end,
    ['setfont_code'] = function()
      setTextFont('dialogueTxt', 'barcode.tff')
      setTextFont('dialogueTxtBG', 'barcode.tff')
    end
  }
  if effectShits[dObj.effect] then
    effectShits[dObj.effect]()
  end
  setProperty(speechSprite..'.flipX', not dObj.right)
  
  
  updateText()
end
function updateText()
  if curLine ~= nil and curLineBuffer ~= curLine then
    curLineBuffer = curLineBuffer..stringIndex(curLine, curLineIndex)
    curLineIndex = curLineIndex + 1
    -- --debugPrint(curLineBuffer)
    setTextString('dialogueTxt', curLineBuffer)
    setTextString('dialogueTxtBG', curLineBuffer)
    runTimer('updateText', 0.02)
    if curLineIndex % 2 == 0 and dialogueSounds[curChar] then
      playSound(dialogueSounds[curChar][math.random(1, #dialogueSounds[curChar])], 0.6)
    end
  end
end
function onUpdate(tag, elapsed)
  if inDialogue then
    if keyboardJustPressed('BACKSPACE') then
      closeShit()
    end
    if keyJustPressed('accept') and not SHUTTHEFUCKUP then
      goToNextDialogue()
    end

  end
end
function closeShit()
  inDialogue = false
  SHUTTHEFUCKUP = true
  local aaa = function()
    --debugPrint('closing shit')
    setProperty('inCutscene', false)
    
    if not isEnd then
      runHaxeCode[[
        game.startCountdown();
      ]]
    else
      callOnLuas('preventEndSong', {false})
      runHaxeCode[[
        game.endSong();
      ]]
    end
    curLine = nil
    for k,v in pairs(sprsToKILL) do
      removeLuaSprite(v, true)
      removeLuaText(v, true)
    end
    closeCustomSubstate(tag)
  end
  for k,v in pairs(sprsToKILL) do
    doTweenAlpha(v, v, 0, 1)
  end
  ezTimer('asdfasd', 1, aaa)
  soundFadeIn(nil, 1, 0.8, 0)
end
function stringIndex(str, index)
  return runHaxeCode([[
    var cool = "]]..str..[[";
    return cool.charAt(]]..tostring(index-1)..[[);
  ]])
end
sprsToKILL = {}
function add(tag)  
  setObjectCamera(tag, 'other')
  addLuaSprite(tag, true)
  table.insert(sprsToKILL, tag)
end
function addText(tag)
  setObjectCamera(tag, 'other')
  addLuaText(tag, true)
  table.insert(sprsToKILL, tag)
end
timers = {blankTags = 0}
function ezTimer(tag, timer, callback)
  if tag == nil then
    tag = 'blank_tags-'..tostring(timers.blankTags)
    timers.blankTags = timers.blankTags + 1
  end
  timers[tag] = callback
  runTimer(tag, timer)
end