package;

class ResultsScreenSubstate extends MusicBeatSubstate 
{
    override public function create() 
    {
        super.create();
        var blackThing = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
        add(blackThing);    
    }    
}