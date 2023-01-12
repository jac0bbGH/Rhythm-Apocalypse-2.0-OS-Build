local totalTime = 0.0
function onUpdatePost(elapsed)
    totalTime = totalTime + elapsed

    setProperty("gf.scale.x",0.4)
    setProperty("gf.scale.y",0.4)
    setProperty("gf.y",150+math.sin(totalTime*math.pi/16)*200)
    setProperty("gf.x",-1500+(totalTime*100%3200))
    setProperty("gf.angle",totalTime*10)
end