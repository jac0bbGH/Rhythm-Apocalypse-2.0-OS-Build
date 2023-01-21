a = {}
-- local Color = addShit('color')
local Color = {}
Color.WHITE = '0xFFFFFFFF'
a.new = function(tag, x, y, text, settings)
  if settings = nil then
    settings = {}
  end
  if not settings.color then settings.color = Color.WHITE end
  if not settings.scale then settings.scale = {x = 1, y = 1} end
  runHaxeCode([[
    var alpher = new Alphabet(]]..tostring(x)..', '..tostring(y)..', "'..text..'", '..tostring(settings.bold)..[[);
    alpher.setAlignmentFromString(']]..settings.alignment..[[');
    alpher.updateAlignment();
    alpher.set_scaleX(']]..tostring(settings.scale.x)..[[');
    alpher.set_scaleX(']]..tostring(settings.scale.x)..[[');
    game.add(alpher);
    PlayState.instance.modchartSprites.set(']]..tag..[[', alpher);
  ]])
end
local function addShit(what)
  return dofile('mods/'..currentModDirectory..'/'..what..'.lua')
end
return a;