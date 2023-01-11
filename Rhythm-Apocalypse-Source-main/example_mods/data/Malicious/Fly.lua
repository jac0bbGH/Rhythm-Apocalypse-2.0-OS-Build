eT = 0 --elapsed time
reach = {
  x = 0.1,
  y = 0.1
}
speed = {
  x = 8,
  y = 5
}
offset = {
  x = 0,
  y = 0
}

function onUpdate(e)
    luaDebugMode = true
    eT = eT + e
    setProperty('gfGroup.x', getProperty 'gfGroup.x' + math.sin((eT * speed.x) + offset.x) * reach.x)
    setProperty('gfGroup.y', getProperty 'gfGroup.y' + math.cos((eT * speed.y) + offset.y) * reach.y)
    if not mustHitSection then
      runHaxeCode 'game.moveCameraSection();'
    end
  end
