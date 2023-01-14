function onEvent(name, value1, value2)
   precacheImage('glitchhallway', 'stagebackdark');
   if name == 'bgchange' then
    makeLuaSprite(value2, value1, -400, -230);
    addLuaSprite(value2, false);
    
    
    
    end
end