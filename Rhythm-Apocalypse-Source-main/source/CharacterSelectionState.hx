package;

#if desktop
import Discord.DiscordClient;
#end
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.graphics.atlas.FlxAtlas;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxSound; 
import flixel.text.FlxText;
import flixel.addons.display.FlxBackdrop;

class CharacterSelectionState extends MusicBeatState //This is not from the D&B source code, it's completely made by me (Delta). This also means I can use this code for other mods.
{
	public var characterData:Array<Dynamic> = [
        [[["Boyfriend", 'bf'], ["Pixel Boyfriend", 'bf-pixel']], [1.0, 1.0, 1.0, 1.0]], 
        [["Pico", 'pico-player'], [1.0, 1.0, 1.0, 1.0]],
    ];
    var characterSprite:Boyfriend;
    var characterFile:String = 'bf';

	var nightColor:FlxColor = 0xFF878787;
    var curSelected:Int = 0;
    var curSelectedForm:Int = 0;
    var curText:FlxText;
    var controlsText:FlxText;
    var formText:FlxText;
    var entering:Bool = false;

    var otherText:FlxText;
    var yesText:FlxText;
    var noText:FlxText;
    var previewMode:Bool = false;


    override function create() 
    {

        var bg:FlxBackdrop = new FlxBackdrop(Paths.image('epic_bg'), 0.1, 0, true, true);
        bg.velocity.set(50, 0);
		//bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

        var checkersBG:FlxBackdrop = new FlxBackdrop(Paths.image('checkers'), 0.2, 0.2, true, true);
        checkersBG.velocity.set(70, 50);
        //checkersBG.setGraphicSize(Std.int(bg.width * 1.175));
		//checkersBG.updateHitbox();
		checkersBG.screenCenter();
        checkersBG.alpha = 0.3;
		checkersBG.antialiasing = ClientPrefs.globalAntialiasing;
		add(checkersBG);

        var barsBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('cinematic'));
        barsBG.screenCenter();
        barsBG.antialiasing = ClientPrefs.globalAntialiasing;
        add(barsBG);
        

        FlxG.mouse.visible = true;
        FlxG.mouse.enabled = true;
        FlxG.sound.music.stop();
        FlxG.sound.playMusic(Paths.music('breakfast'), 1);
   
        if(PlayState.SONG.player1 != "bf")
            {
                otherText = new FlxText(10, 150, 0, 'This song does not use BF as the player\nor has a different variant of BF.\nDo you want to continue without changing character?\n', 20);
                otherText.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
                otherText.size = 45;
                otherText.screenCenter(X);
                add(otherText);
                yesText = new FlxText(FlxG.width / 4, 350, 0, 'Yes', 20);
                yesText.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
                yesText.size = 45;
                add(yesText);
                noText = new FlxText(FlxG.width / 1.5, 350, 0, 'No', 20);
                noText.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
                noText.size = 45;
                add(noText);
            }
        else {
            spawnSelection();
        }

        super.create();
    }

    var selectionStart:Bool = false;

    function spawnSelection()
        {
            selectionStart = true;
            characterSprite = new Boyfriend(0, 0, "bf");
            add(characterSprite);
            characterSprite.dance();
            characterSprite.screenCenter(XY);
            curText = new FlxText(0, 20, 0, characterData[curSelected][0][0][0], 20);
            curText.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
            curText.size = 50;
            
            controlsText = new FlxText(10, 50, 0, 'Left or right to change character.\nUp or down to change form.\nPress P to enter preview mode.\n', 20);
            controlsText.setFormat(Paths.font("vcr.ttf"), 20, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
            controlsText.size = 20;
    
    
            add(curText);
            add(formText);
            add(controlsText);
    
            curText.screenCenter(X);
        }

    function checkPreview()
        {
            if(previewMode)
                {
                    controlsText.text = "PREVIEW MODE\nPress I to play idle animation.\nPress your controls to play an animation.\n";
                }
            else {
                controlsText.text = "Left or right to change character.\nUp or down to change form.\nPress P to enter preview mode.\n";
                if(characterSprite.animOffsets.exists('idle'))
                    {
                        characterSprite.playAnim('idle');
                    }
            }
        }
    override function update(elapsed)
    {
        if(FlxG.keys.justPressed.P && selectionStart)
            {
                previewMode = !previewMode;
                checkPreview();
            }
        if(selectionStart && !previewMode)
            {
                if(controls.UI_RIGHT_P)
                    {
                        changeCharacter(1);
                    }
                if(controls.UI_LEFT_P)
                    {
                        changeCharacter(-1);
                    }
                if(controls.UI_DOWN_P)
                    {
                        changeForm(1);
                    }
                if(controls.UI_UP_P)
                    {
                        changeForm(-1);
                    }
                if(controls.ACCEPT)
                    {
                        acceptCharacter();
                    }
            }
            else if (!previewMode)
            {
                if(controls.UI_RIGHT_P)
                    {
                        curSelected += 1;
                    }
                if(controls.UI_LEFT_P)
                    {
                        curSelected =- 1;
                    }
                if (curSelected < 0)
                    {
                        curSelected = 0;
                    }
                    if (curSelected >= 2)
                    {
                        curSelected = 0;
                    }
                switch(curSelected)
                {
                    case 0:
                        yesText.alpha = 1;
                        noText.alpha = 0.5;
                    case 1:
                        noText.alpha = 1;
                        yesText.alpha = 0.5;
                }
                if(controls.ACCEPT)
                    {
                        switch(curSelected)
                        {
                            case 0:
                                FlxG.sound.music.stop();
                                LoadingState.loadAndSwitchState(new PlayState());
                            case 1:
                                noText.alpha = 0;
                                yesText.alpha = 0;
                                otherText.alpha = 0;
                                curSelected = 0;
                                spawnSelection();
                                
                        }
                    }
            }
            else
                {
                    if(controls.NOTE_LEFT_P)
                        {
                            if(characterSprite.animOffsets.exists('singLEFT'))
                                {
                                    characterSprite.playAnim('singLEFT');
                                }
                        }
                    if(controls.NOTE_DOWN_P)
                        {
                            if(characterSprite.animOffsets.exists('singDOWN'))
                                {
                                    characterSprite.playAnim('singDOWN');
                                }
                        }
                    if(controls.NOTE_UP_P)
                        {
                            if(characterSprite.animOffsets.exists('singUP'))
                                {
                                    characterSprite.playAnim('singUP');
                                }
                        }
                    if(controls.NOTE_RIGHT_P)
                        {
                            if(characterSprite.animOffsets.exists('singRIGHT'))
                                {
                                    characterSprite.playAnim('singRIGHT');
                                }
                        }
                    if(FlxG.keys.justPressed.I)
                        {
                            if(characterSprite.animOffsets.exists('idle'))
                                {
                                    characterSprite.playAnim('idle');
                                }
                        }
                }
        super.update(elapsed);
    }


    function changeCharacter(change:Int) 
    {
        FlxG.sound.play(Paths.sound('scrollMenu'));
        curSelectedForm = 0;
        curSelected += change;

        if (curSelected < 0)
        {
			curSelected = characterData.length - 1;
        }
		if (curSelected >= characterData.length)
        {
			curSelected = 0;
        }
        curText.text = characterData[curSelected][0][0][0];
        characterFile = characterData[curSelected][0][0][1];
        reloadCharacter();

        curText.screenCenter(X);
    }

    function changeForm(change:Int) 
        {
            if(characterData[curSelected][0].length >= 2)
            {
                FlxG.sound.play(Paths.sound('scrollMenu'));
                curSelectedForm += change;
    
                if (curSelectedForm < 0)
                {
                    curSelectedForm = characterData[curSelected][0].length;
                    curSelectedForm = curSelectedForm - 1;
                }
                if (curSelectedForm >= characterData[curSelected][0].length)
                {
                    curSelectedForm = 0;
                }
                curText.text = characterData[curSelected][0][curSelectedForm][0];
                characterFile = characterData[curSelected][0][curSelectedForm][1];

                reloadCharacter();
        
                curText.screenCenter(X);
            }
        }

    function reloadCharacter()
        {
            characterSprite.destroy();
            characterSprite = new Boyfriend(0, 0, characterFile);
            add(characterSprite);
            characterSprite.dance();

            switch(characterFile)
            {
                case 'bf' | 'bf-pixel':
                    characterSprite.screenCenter(XY);
                case 'dbambi n funny playable':
                    characterSprite.screenCenter(XY);
            }
        }
    function acceptCharacter() 
    {
        if(!entering)
        {
        entering = true;
        if(characterSprite.animOffsets.exists('hey'))
            {
                characterSprite.playAnim('hey');
            }
        else if(characterSprite.animOffsets.exists('singUP'))
            {
                characterSprite.playAnim('singUP');
            }
        FlxG.sound.playMusic(Paths.music('gameOverEnd'), 1);
        new FlxTimer().start(1.5, function(tmr:FlxTimer)
			{
                FlxG.sound.music.stop();
                PlayState.SONG.player1 = characterFile;
                LoadingState.loadAndSwitchState(new PlayState());
			});
        }
    }
}