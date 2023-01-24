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
import flixel.addons.display.FlxBackdrop;

class ResultsScreenSubState extends MusicBeatSubstate 
{

    var rankTxtGRP:FlxTypedGroup<FlxText>;
    var statsTxtGRP:FlxTypedGroup<FlxText>;
    var bottomtxt:FlxText;
    var statsToRecord:Array<String> = [
        'Accuracy: ',
        'Misses: ',
        'Score: ',
        'Hi-Score: '
    ];

    var songRank:String = 'F';
    var songTxt:FlxText;
    var blackThing:FlxSprite;
    var fcType:String;

    var resultsCam:FlxCamera;

    override public function create() 
    {
        super.create();

        statsToRecord[4] = fcType;

        rankTxtGRP = new FlxTypedGroup<FlxText>(0);
        statsTxtGRP = new FlxTypedGroup<FlxText>(0);

        if (PlayState.instance.songMisses == 0)
        {
            if(PlayState.instance.bads > 0 || PlayState.instance.shits > 0) fcType = "FC";
            else if (PlayState.instance.goods > 0) fcType = "GFC";
            else if (PlayState.instance.sicks > 0) fcType = 'SFC';
        }
    
        resultsCam = new FlxCamera();
        
        FlxG.cameras.add(resultsCam);
        
        blackThing = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
        blackThing.alpha = 0.6;
        blackThing.cameras = [resultsCam];
        add(blackThing);

        songTxt = new FlxText(46, 0, 0, PlayState.SONG.song + ' Completed!', 34);
        songTxt.font = Paths.font('osuItalic.ttf');
        songTxt.color = FlxColor.LIME;
        songTxt.cameras = [resultsCam];
        add(songTxt);

        bottomtxt = new FlxText(0, 680, 0, 'Press ACCEPT to go back to freeplay. Press BACK to restart.', 34);
        bottomtxt.cameras = [resultsCam];
        bottomtxt.setFormat(Paths.font('osu.ttf'), bottomtxt.size, FlxColor.WHITE, null, FlxTextBorderStyle.OUTLINE, FlxColor.BLUE);
        add(bottomtxt);
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


        var checkerboard = new FlxBackdrop(Paths.image('sevenstepsahead'), 0.4, 0.4, true, true);
		checkerboard.alpha = 0.1;
		checkerboard.velocity.set(50, 50);
		add(checkerboard);

        for(rank in 0...2)
        {
            var rankTxt = new FlxText(0, 0, 0, '', 1);
            rankTxt.setFormat(Paths.font('osuItalic.ttf'), rankTxt.size, 0xFFD000FF, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.WHITE);
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

        rankTxtGRP.members[1].text = PlayState.instance.ratingName;
        switch(PlayState.instance.ratingName)
        {
            case 'APOCALYPSE':
                rankTxtGRP.members[0].text = 'AAA';
                rankTxtGRP.members[0].x -= 180;
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
                rankTxtGRP.members[0].text = 'BOT';
                rankTxtGRP.members[0].x = 664;
        }

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
            element.text = statsToRecord[s] + otherThings[s];
            trace(otherThings[s]);
            if (s >= 4) element.text = fcType;
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

        if (PlayState.instance.songMisses == 0)
        {
            if (PlayState.instance.sicks > 0) fcType = 'SFC';
            if (PlayState.instance.goods > 0) fcType = "GFC";
            if (PlayState.instance.bads > 0 || PlayState.instance.shits > 0) fcType = "FC";
        }

        if (controls.ACCEPT)
            new FlxTimer().start(0.25, (tmr) -> MusicBeatState.switchState(new FreeplayState()));
        else if (controls.BACK)
            new FlxTimer().start(0.25, (tmr) -> MusicBeatState.switchState(new PlayState()));


     
    }
}