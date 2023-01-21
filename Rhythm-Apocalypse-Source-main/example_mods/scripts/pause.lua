--this is really messy cause i didnt plan ahead lol
stuffFunctions = {}
function onCreate()
  initLuaShader('RepeatingBitch')
  luaDebugMode = true
  addHaxeLibrary('FlxSound', 'flixel.system')
  addHaxeLibrary('FlxBackdrop', 'flixel.addons.display')
  stuffFunctions = {
    ['RESUME'] = function()
      for k,v in pairs(sprs) do
        removeLuaSprite(v, true)
      end
      for k,v in pairs(haxeStuffToRemove) do
        runHaxeCode([[
          var idiot = game.modchartSprites.get(']]..v..[[');
          if(idiot != null)
          {
            idiot.kill();
            idiot.destroy();
            game.modchartSprites.remove(']]..v..[[');
          }
        ]])
      end
      stopSound('PAUSEMUSIC')
      closeCustomSubstate('coolPause')
    end,
    ['RESTART SONG'] = restartSong,
    ['CHANGE CHARACTER'] = function()
      debugPrint('would change characcters')
    end,
    ['EXIT TO MENU'] = function()
      loadSong(dofile('mods/'..currentModDirectory..'/modName.lua'), -1)
    end
  }
end
function onPause()
  if songName:lower() ~= dofile('mods/'..currentModDirectory..'/modName.lua') and not runHaxeCode('return PlayState.chartingMode;') then
    elapsedTime = 0
    openCustomSubstate('coolPause', true)
    return Function_Stop;
  end
  return Function_Continue;
end
function onCustomSubstateCreate(tag)
  if tag == 'coolPause' then
    makeSpr('pauseBG')
    makeGraphic('pauseBG', 1280, 720, '000000')
    setProperty('pauseBG.alpha', 0.5)
    add('pauseBG')

    runHaxeCode([[
      game.modchartSounds.set('PAUSEMUSIC', FlxG.sound.play(Paths.music('breakfast'), 0, true));
      game.modchartSounds.get('PAUSEMUSIC').time = FlxG.random.int(0, game.modchartSounds.get('PAUSEMUSIC').length)
      //game.modchartSounds.get('PAUSEMUSIC').resume();
    ]])

    makeSpr('bgthing', 'title/checkeredBG')
    setSpriteShader('bgthing', 'RepeatingBitch')
    setGraphicSize('bgthing', 1280, 720)
    add('bgthing')


    for i,option in pairs(stuff) do
      makeAlphabet(actualNames[option], option, 87, 360, true, 'left', i)
      setProperty(actualNames[option]..'.isMenuItem', true)
      setProperty(actualNames[option]..'.targetY', i)
    end
    makeLuaText('pausething', songName, 0, 5, 5) --left corner cause shadow mario sucks fat nuts
    setTextAlignment('pausething', 'right')
    setTextSize('pausething', 32)
    add('pausething', true)
    changeSelection(0)
  end
end
curSelected = 1
stuff = {
  'RESUME',
  'RESTART SONG',
  'CHANGE CHARACTER',
  'EXIT TO MENU'
}
actualNames = {
  ['RESUME'] = 'resume',
  ['RESTART SONG'] = 'restart',
  ['CHANGE CHARACTER'] = 'changeChar',
  ['EXIT TO MENU'] = 'exit'
}
elapsedTime = 0
function onCustomSubstateUpdate(tag, elapsed)
  if tag == 'coolPause' then
    if keyboardJustPressed('ESCAPE') then
      stuffFunctions['RESUME SONG']();
    elseif keyJustPressed('accept') then
      stuffFunctions[stuff[curSelected]]()
    end
    if keyJustPressed('up') then
      changeSelection(-1)
    elseif keyJustPressed('down') then
      changeSelection(1)
    end
    if getSoundVolume('PAUSEMUSIC') < 0.5 then
      setSoundVolume('PAUSEMUSIC', getSoundVolume('PAUSEMUSIC') + 0.01 * elapsed)
    end
    setShaderFloat('bgthing', 'iTime', elapsedTime)
  end
  elapsedTime = elapsedTime + elapsed
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
function onTimerCompleted(tag)
  if timers[tag] ~= nil then
    timers[tag]()
    timers[tag] = nil
    if stringStartsWith(tag, 'blank_tags-') then
      timers.blankTags = tonumber(stringSplit(tag, '-')[2])
    end
  end
end
function changeSelection(ok)
  local newSelected = curSelected + ok
  if newSelected > #stuff then
    newSelected = 1
  end
  if newSelected < 1 then
    newSelected = #stuff
  end
  curSelected = newSelected
  for k,v in pairs(stuff) do
    setProperty(actualNames[v]..'.targetY', k - newSelected)
    setProperty(actualNames[v]..'.alpha', (k == newSelected) and 1 or 0.6)
  end
end
function makeAlphabet(tag, text, x, y, bold, alignment, targetY) --i stole this :)
    runHaxeCode([[
      if (game.modchartSprites.exists(']]..tag..[[')) 
      { 
        game.modchartSprites.get(']]..tag..[[').kill(); 
        game.modchartSprites.get(']]..tag..[[').destroy(); 
      } 
      textThingy = new Alphabet(]]..tostring(x)..[[, ]]..tostring(y)..[[, ']]..text..[[', ]]..tostring(bold)..[[);
      //textThingy.cameras = [game.camOther];
      textThingy.setAlignmentFromString(']]..alignment..[[');
      textThingy.updateAlignment();
      game.subState.add(textThingy); 
      game.modchartSprites.set(']]..tag..[[', textThingy);
    ]])
    table.insert(haxeStuffToRemove, tag)
end
haxeStuffToRemove = {}
sprs = {}
function makeSpr(tag, image, x, y)
  makeLuaSprite(tag, image, x, y)
  setObjectCamera(tag, 'other')
  table.insert(sprs, tag)
end
function add(tag, isText)
  runHaxeCode([[
    var shit = game.]]..(isText and 'modchartTexts' or 'modchartSprites')..[[.get(']]..tag..[[');
    game.subState.add(shit);
    shit.wasAdded = true;
  ]])
end