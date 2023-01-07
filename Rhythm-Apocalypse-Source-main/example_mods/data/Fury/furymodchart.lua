
local s = 1
local flip = 1

function onCreate()
      setProperty('skipCountdown',true)
      setProperty('scoreTxt.alpha',0)
      setProperty('timeBar.alpha',0)
      setProperty('extravars.alpha',1.00)
      makeLuaSprite('extravars','',0,0)
      makeLuaSprite('extravars2','',0,0)
      makeLuaSprite('SPEED','',-0.2,1)
      makeLuaSprite('epicflash','',0,0)
      makeGraphic('epicflash',3000,3000,'FFFFFF')
      setObjectCamera('epicflash','other')
      addLuaSprite('epicflash',true)
      setProperty('epicflash.alpha', 0)
      strumx1 = 240
      strumx2 = 900
      strumy = 60
      mult = 1
      if downscroll then
          strumy = 550
          mult = -1
      end
      for i = 0,7 do
          makeLuaSprite('scalecontrol'..i,'',0.7,0.7)
          setProperty('scalecontrol'..i..'.alpha',0)
          addLuaSprite('scalecontrol'..i,false)
          makeLuaSprite('notes'..i,'',0,0)
      end
      --makeLuaText('dbug', "curStep: 0", 800, 535, 20)
      --setTextSize('dbug', 40)
      --setTextColor('dbug', 'FFFFFF')
      --setObjectCamera('dbug','other')
      --addLuaText('dbug',true)
  
      runTimer('frames',0.033)
  end
  function onSongStart()
    setProperty('extravars.y',900)
  end
  --everystep
  function onStepHit()
      floorStep = math.floor(currentStep)
      if floorStep == 96 then
        doTweenY('notegoup','extravars',500,crochet*0.006,'sineOut')
      end
      if floorStep == 120 then
        doTweenY('notegoupmore','extravars',0,crochet*0.002,'backOut')
        doTweenX('scrollswitch','SPEED',0.7,crochet*0.002,'linear')
      end
      if floorStep == 120 or floorStep == 122 or floorStep == 123 or floorStep == 124 or floorStep == 126 then
        flip = -flip
        setProperty('extravars.x',70*flip)
        doTweenX('note##','extravars',0,stepCrochet*0.002,'linear')
      end
      if floorStep == 128 or floorStep == 896 or floorStep == 1408 then
        doFlash(1,1,'FFFFFF')
      end
      if floorStep >= 128 and floorStep < 640 or floorStep >= 896 and floorStep < 1152 or floorStep >= 1408 and floorStep < 1920 then
        if floorStep % 16 == 0 or floorStep % 16 == 10 then
          flip = -flip
          setProperty('extravars.x',50*flip)
          doTweenX('notedance1','extravars',0,stepCrochet*0.004,'sineOut')
        end
        if floorStep % 16 == 4 or floorStep % 16 == 12 then
          setProperty('extravars.y',90)
          doTweenY('notedance2','extravars',0,stepCrochet*0.004,'sineOut')
        end
      end
      if floorStep == 640 then
        doFlash(1,1,'000000')
        for i = 0,3 do
          doTweenX('hinotesX'..i,'notes'..i,330,crochet*0.004,'expoOut')
          doTweenY('hinotesY'..i,'notes'..i,50,crochet*0.004,'backOut')
        end
        for i = 4,7 do
          doTweenX('hinotesX'..i,'notes'..i,800,crochet*0.016,'expoOut')
          doTweenY('hinotesY'..i,'notes'..i,500,crochet*0.016,'expoOut')
        end
      end
      if floorStep == 1152 then
        doFlash(1,1,'000000')
        for i = 0,3 do
          doTweenX('hinotesX'..i,'notes'..i,330,crochet*0.001,'expoOut')
          doTweenY('hinotesY'..i,'notes'..i,50,crochet*0.001,'backOut')
        end
        for i = 4,7 do
          doTweenX('hinotesX'..i,'notes'..i,800,crochet*0.001,'expoOut')
          doTweenY('hinotesY'..i,'notes'..i,500,crochet*0.001,'expoOut')
        end
      end
      if floorStep == 1920 then
        doTweenAlpha('byehud','camHUD',0,crochet*0.004,'linear')
      end
  end
  --everyframe
function onUpdatePost()
    setProperty('timeBar.alpha',0)
    setProperty('timeBarBG.alpha',0)
    setProperty('timeTxt.alpha',0)
    setProperty('healthBarOverlay.alpha',0)
    triggerEvent('Change Scroll Speed',0.05, 0.001)
      songPos = getSongPosition()
      currentStep = (songPos/1000)*(curBpm/15)
      setProperty('camHUD.zoom',0.9)
      var1 = getProperty('extravars.x')
      var2 = getProperty('extravars.y')
      var3 = getProperty('extravars.angle')
      var4 = getProperty('extravars2.x')
      var5 = getProperty('extravars2.y')
      var5 = getProperty('extravars2.angle')
      speed = getProperty('SPEED.x')*20
      --setTextString('dbug','curStep: '..math.floor(currentStep))
      for i = 0,3 do
          setPropertyFromGroup('strumLineNotes',i,'x',strumx1+(i-1.5)*110+getProperty('notes'..i..'.x'))
          setPropertyFromGroup('strumLineNotes',i,'y',strumy+getProperty('notes'..i..'.y')*mult)
          setPropertyFromGroup('strumLineNotes',i,'scale.x',getProperty('scalecontrol'..i..'.x'))
          setPropertyFromGroup('strumLineNotes',i,'scale.y',getProperty('scalecontrol'..i..'.y'))
      end
      for i = 4,7 do
          setPropertyFromGroup('strumLineNotes',i,'x',strumx2+(i-5.5)*110+getProperty('notes'..i..'.x'))
          setPropertyFromGroup('strumLineNotes',i,'y',strumy+getProperty('notes'..i..'.y')*mult)
          setPropertyFromGroup('strumLineNotes',i,'scale.x',getProperty('scalecontrol'..i..'.x'))
          setPropertyFromGroup('strumLineNotes',i,'scale.y',getProperty('scalecontrol'..i..'.y'))
      end
      if currentStep > 0 and currentStep < 128 then
        for i = 0,7 do 
            setProperty('notes'..i..'.x',var1)
            setProperty('notes'..i..'.y',math.sin(i+currentStep*math.pi/4)*var1+var2)
        end
        notesLength = getProperty('notes.length')
        for i1 = 0, notesLength, 1 do
          TN = getPropertyFromGroup('notes',i1,'noteData')
          TND = getPropertyFromGroup('notes',i1,'distance')
          TNX = getPropertyFromGroup('notes',i1,'x')
          TNY = getPropertyFromGroup('notes',i1,'y')
          TNOX = getPropertyFromGroup('strumLineNotes',TN,'x')
          TNOY = getPropertyFromGroup('strumLineNotes',TN,'y')
          setPropertyFromGroup('notes',i1,'x',TNOX+math.sin(TND*math.pi*0.005)*var1*2)
          setPropertyFromGroup('notes',i1,'y',TNOY+TND*speed)
          if getPropertyFromGroup('notes',i1,'mustPress') then
            TNOX = getPropertyFromGroup('strumLineNotes',TN+4,'x')
            TNOY = getPropertyFromGroup('strumLineNotes',TN+4,'y')
            setPropertyFromGroup('notes',i1,'x',TNOX)
            setPropertyFromGroup('notes',i1,'y',TNOY+TND*speed)
          end
        end
      end
      if currentStep > 128 and currentStep < 640 or currentStep > 896 and currentStep < 1152 or currentStep > 1408 and currentStep < 1936 then
        for i = 0,7 do 
            setProperty('notes'..i..'.x',math.sin(currentStep*math.pi/4)*20+var2*(i%4-1.5))
            setProperty('notes'..i..'.y',math.sin(i+currentStep*math.pi/8)*30+(i%2-0.5)*var1*3)
            setPropertyFromGroup('strumLineNotes',i,'angle',var2*4)
        end
        setProperty('SPEED.x',0.7)
        notesLength = getProperty('notes.length')
        for i1 = 0, notesLength, 1 do
          TN = getPropertyFromGroup('notes',i1,'noteData')
          TND = getPropertyFromGroup('notes',i1,'distance')
          TNX = getPropertyFromGroup('notes',i1,'x')
          TNY = getPropertyFromGroup('notes',i1,'y')
          TNOX = getPropertyFromGroup('strumLineNotes',TN,'x')
          TNOY = getPropertyFromGroup('strumLineNotes',TN,'y')
          setPropertyFromGroup('notes',i1,'x',TNOX+math.sin(TND*math.pi*0.05)*math.sin(currentStep*math.pi/4)*60)
          setPropertyFromGroup('notes',i1,'y',TNOY+TND*speed)
          if getPropertyFromGroup('notes',i1,'mustPress') then
            TNOX = getPropertyFromGroup('strumLineNotes',TN+4,'x')
            TNOY = getPropertyFromGroup('strumLineNotes',TN+4,'y')
            setPropertyFromGroup('notes',i1,'x',TNOX+math.sin(TND*math.pi*0.05)*math.sin(currentStep*math.pi/4)*40)
            setPropertyFromGroup('notes',i1,'y',TNOY+TND*speed)
          end
        end
      end
      if currentStep > 640 and currentStep < 896 or currentStep > 1152 and currentStep < 1408 then
        setProperty('SPEED.x',0.7+0.3*s)
        notesLength = getProperty('notes.length')
        for i1 = 0, notesLength, 1 do
          TN = getPropertyFromGroup('notes',i1,'noteData')
          TND = getPropertyFromGroup('notes',i1,'distance')
          TNX = getPropertyFromGroup('notes',i1,'x')
          TNY = getPropertyFromGroup('notes',i1,'y')
          TNOX = getPropertyFromGroup('strumLineNotes',TN,'x')
          TNOY = getPropertyFromGroup('strumLineNotes',TN,'y')
          setPropertyFromGroup('notes',i1,'x',TNOX+math.tan(TND*math.pi*0.05)*5+math.random(-5,5))
          setPropertyFromGroup('notes',i1,'y',TNOY+TND*speed)
          if getPropertyFromGroup('notes',i1,'mustPress') then
            TNOX = getPropertyFromGroup('strumLineNotes',TN+4,'x')
            TNOY = getPropertyFromGroup('strumLineNotes',TN+4,'y')
            setPropertyFromGroup('notes',i1,'x',TNOX+math.sin(TND*math.pi*0.05)*math.sin(currentStep*math.pi/4)*40)
            setPropertyFromGroup('notes',i1,'y',TNOY+TND*speed)
          end
        end
      end
      notesLength = getProperty('notes.length')
      for i1 = 0, notesLength, 1 do
        TN = getPropertyFromGroup('notes',i1,'noteData')
        TND = getPropertyFromGroup('notes',i1,'distance')
        TNX = getPropertyFromGroup('notes',i1,'x')
        TNY = getPropertyFromGroup('notes',i1,'y')
        TNOX = getPropertyFromGroup('strumLineNotes',TN,'x')
        TNOY = getPropertyFromGroup('strumLineNotes',TN,'y')
        setPropertyFromGroup('notes',i1,'scale.x',getProperty('scalecontrol'..TN..'.x'))
        setPropertyFromGroup('notes',i1,'scale.y',getProperty('scalecontrol'..TN..'.y'))
        --setPropertyFromGroup('notes',i1,'x',TNOX+math.cos((2.5+(TND/1250))*math.pi/2)*TND/2)
        --setPropertyFromGroup('notes',i1,'y',TNOY+math.sin((2.5+(TND/1250))*math.pi/2)*TND/2)
        setPropertyFromGroup('notes',i1,'color',getPropertyFromGroup('strumLineNotes',TN,'color'))
        if getPropertyFromGroup('notes',i1,'mustPress') then
          TNOX = getPropertyFromGroup('strumLineNotes',TN+4,'x')
          TNOY = getPropertyFromGroup('strumLineNotes',TN+4,'y')
          setPropertyFromGroup('notes',i1,'scale.x',getProperty('scalecontrol'..TN+4 ..'.x'))
          setPropertyFromGroup('notes',i1,'scale.y',getProperty('scalecontrol'..TN+4 ..'.y'))
          --setPropertyFromGroup('notes',i1,'x',TNOX+math.cos((0.5+(TND/1250))*math.pi/2)*TND/2)
          --setPropertyFromGroup('notes',i1,'y',TNOY+math.sin((0.5+(TND/1250))*math.pi/2)*TND/2)
          setPropertyFromGroup('notes',i1,'color',getPropertyFromGroup('strumLineNotes',TN+4,'color'))
        end
      end
end
function doFlash(brightness,length,color) --self explanatory
    setProperty('epicflash.alpha',brightness)
    setProperty('epicflash.color',getColorFromHex(color))
    doTweenAlpha('epicparts','epicflash',0,length,'sineOut')
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'frames' then
        s = -s
        runTimer('frames',0.016)
    end
end
