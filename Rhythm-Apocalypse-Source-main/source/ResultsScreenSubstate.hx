package;

import Controls.Control;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.FlxCamera;
import flixel.util.FlxTimer;
import flixel.group.FlxGroup.FlxTypedGroup;

class ResultsScreenSubstate extends MusicBeatSubstate 
{

    var rankTxtGRP:FlxTypedGroup<FlxText>;
    var statsTxtGRP:FlxTypedGroup<FlxText>;
    var statsToRecord:Array<String> = [
        'Accuracy: ',
        'Misses: ',
        'Score: ',
        'Hi-Score: '
    ];

    var songRank:String = 'F';
    var songTxt:FlxText;
    var blackThing:FlxSprite;
    
    var resultsCam:FlxCamera;

    override public function create() 
    {
        super.create();


        rankTxtGRP = new FlxTypedGroup<FlxText>(0);
        statsTxtGRP = new FlxTypedGroup<FlxText>(0);

        resultsCam = new FlxCamera();
        
        FlxG.cameras.add(resultsCam);
        
        blackThing = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
        blackThing.alpha = 0.6;
        blackThing.cameras = [resultsCam];
        add(blackThing);

        songTxt = new FlxText(46, 0, 0, 'funky music' + ' Completed!', 34);
        songTxt.font = Paths.font('osuItalic.ttf');
        songTxt.color = FlxColor.LIME;
        songTxt.cameras = [resultsCam];
        add(songTxt);

        for(stats in 0...statsToRecord.length)
        {
            var statFiller = new FlxText(-500, 200, 0, '', 36);
            statFiller.setFormat(Paths.font('vcr.ttf'), statFiller.size, FlxColor.RED, null);
            statFiller.text = statsToRecord[stats];
            statFiller.y += 34 * stats;
            statFiller.cameras = [resultsCam];
            statsTxtGRP.add(statFiller);
        }
        add(statsTxtGRP);

        for(rank in 0...2)
        {
            var rankTxt = new FlxText(0, 0, 0, '', 1);
            rankTxt.setFormat(Paths.font('osuItalic.ttf'), rankTxt.size, 0xFFD000FF, rank == 0 ? null : FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);
            rankTxt.cameras = [resultsCam];
            switch(rank)
            {
                case 0:
                    rankTxt.x = 904;
                    rankTxt.y = 98;
                    rankTxt.size = 274;
                    rankTxt.borderColor = FlxColor.TRANSPARENT;
                case 1:
                    rankTxt.x = 919;
                    rankTxt.y = 362;
                    rankTxt.color = FlxColor.BLUE;
                    rankTxt.font = Paths.font('osu.ttf');
                    rankTxt.size = 24;
            }
            rankTxtGRP.add(rankTxt);
        }
        add(rankTxtGRP);

        updateStatsTxts();
        tweenTxts(); 
    }    

    function tweenTxts()
    {
        var i:Int = 0;
        statsTxtGRP.forEachAlive(function(element:FlxText){
            FlxTween.tween(element, {x: 200}, 0.3, {ease: FlxEase.linear, startDelay: 0.75 + i++, onComplete: function(twn:FlxTween){
                FlxG.sound.play(Paths.sound('confirmMenu'));
            }});
        });
    }
    
    function updateStatsTxts()
    {
        var otherThings:Array<Float> = [       
            Highscore.floorDecimal(PlayState.instance.ratingPercent * 100, 2),
            PlayState.instance.songMisses,
            PlayState.instance.songScore,
            Highscore.getScore(PlayState.SONG.song, PlayState.storyDifficulty)
        ];
        var s = 0;     
        statsTxtGRP.forEachAlive(function(element:FlxText){
            element.text += otherThings[s];
            trace(otherThings[s]);
            s++;
        });
        if (PlayState.instance.ratingName == '?')
        {
            statsTxtGRP.members[0].text = 'Accuracy: 0';
            statsTxtGRP.members[1].text = 'Misses: 0';
            statsTxtGRP.members[2].text = 'Score: 0';
        }
    }

    
    override function update(elapsed:Float) 
    {
        super.update(elapsed);


        if (controls.ACCEPT)
            MusicBeatState.switchState(new FreeplayState());
        else if (controls.BACK)
            MusicBeatState.switchState(new PlayState());


        rankTxtGRP.members[1].text = PlayState.instance.ratingName;
        switch(PlayState.instance.ratingName)
        {
            case 'APOCALYPSE':
                rankTxtGRP.members[0].text = 'AAA';
            case 'RHYTHMIC':
                rankTxtGRP.members[0].text = 'AA';
            case 'OUTSTANDING':
                rankTxtGRP.members[0].text = 'A';
            case 'Great':
                rankTxtGRP.members[0].text = 'AB';
            case 'Okay!': 
                rankTxtGRP.members[0].text = 'C';
            case 'Not too bad..':
                rankTxtGRP.members[0].text = 'D';
            case 'Man get better', 'How do you even get here', 'Phone Breakingly BAD':
                rankTxtGRP.members[0].text = 'F';
            default:
                rankTxtGRP.members[0].text = 'nothing??';
        }
    }
}