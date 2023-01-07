
function onCreate()
    strumx1 = 900
    strumx2 = 240
    strumy = 60
    mult = 1
    if downscroll then
        strumy = 550
        mult = -1
    end
    for i = 0,7 do
        makeLuaSprite('notes' .. i,'',0,0)
    end
end
function onUpdatePost()

    setProperty('healthBar.flipX',true)
    setProperty('iconP1.flipX',true)
    setProperty('iconP1.x',220+getProperty('health')*300)
    setProperty('iconP2.flipX',true)
    setProperty('iconP2.x',320+getProperty('health')*300)
    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes',i,'x',strumx1+(i-1.5)*110+getProperty('notes' .. i .. '.x'))
        setPropertyFromGroup('strumLineNotes',i,'y',strumy+getProperty('notes' .. i .. '.y')*mult)
    end
    for i = 4,7 do
        setPropertyFromGroup('strumLineNotes',i,'x',strumx2+(i-5.5)*110+getProperty('notes' .. i .. '.x'))
        setPropertyFromGroup('strumLineNotes',i,'y',strumy+getProperty('notes' .. i .. '.y')*mult)
    end
end