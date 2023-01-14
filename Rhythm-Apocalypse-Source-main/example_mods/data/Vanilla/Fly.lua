eT = 0 --elapsed time
reach = {
  x = 2,
  y = 2
}
speed = {
  x = 2.7,
  y = 3.8
}
offset = {
  x = 0,
  y = 0
}
function onUpdate(e)
    luaDebugMode = true
    eT = eT + e
    setProperty('dadGroup.x', getProperty 'dadGroup.x' + math.sin((eT * speed.x) + offset.x) * reach.x)
    setProperty('dadGroup.y', getProperty 'dadGroup.y' + math.cos((eT * speed.y) + offset.y) * reach.y)
    if not mustHitSection then
      runHaxeCode 'game.moveCameraSection();'
    end
  end

function onBeatHit()
  if curBeat == 138 then
  eT = 0 --elapsed time
reach = {
  x = 6,
  y = 12
}
speed = {
  x = 2.7,
  y = 3.8
}
offset = {
  x = 0,
  y = 0
}
function onUpdate(e)
    luaDebugMode = true
    eT = eT + e
    setProperty('dadGroup.x', getProperty 'dadGroup.x' + math.sin((eT * speed.x) + offset.x) * reach.x)
    setProperty('dadGroup.y', getProperty 'dadGroup.y' + math.cos((eT * speed.y) + offset.y) * reach.y)
    if not mustHitSection then
      runHaxeCode 'game.moveCameraSection();'
    end
  end
end
end