package;

#if desktop
import Discord.DiscordClient;
#end
import openfl.display.Shader;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import ColorblindFilters;
#if MODS_ALLOWED
import sys.FileSystem;
import sys.io.File;
#end
import lime.app.Application;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;
import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxTimer;

using StringTools;

class MainMenuState extends MusicBeatState
{
	public static var rhythmVersion:String = '1.5';
	public static var osEngineVersion:String = '1.5.1'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;
	var shart:FlxBackdrop;

	var menuItems:FlxTypedGroup<FlxSprite>;
	
	var optionShit:Array<String> = [
		'story_mode',
		'freeplay',
		'extras',
		'options'
	];


	var coolPos:Array<Float> = [
		97.8,
		498.7,
		899.65,
		#if switch
		298.25,
		699.15
		#else
		97.8,
		498.7,
		899.6
		#end
	];

	#if MODS_ALLOWED
	var customOption:String;
	var	customOptionLink:String;
	#end

	var debugKeys:Array<FlxKey>;
	var char:FlxSprite;

	override function create()
	{
		WeekData.loadTheFirstEnabledMod();
		
		FlxG.mouse.visible = true;

		#if MODS_ALLOWED
		Paths.pushGlobalMods();
		#end
		WeekData.loadTheFirstEnabledMod();
		if (ClientPrefs.colorblindMode != null) ColorblindFilters.applyFiltersOnGame(); // applies colorbind filters, ok?

		#if desktop
		// Updating Discord Rich Presence

		DiscordClient.changePresence("Surfing The Menu", null);
		#end
		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var bg:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('lololo'));
		bg.setGraphicSize(Std.int(bg.width * 1.175));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		shart = new FlxBackdrop(Paths.image('thing2'), 0.2, 0, true, true);
		shart.velocity.set(200, 50);
		shart.updateHitbox();
		shart.alpha = 0.2;
		shart.screenCenter(X);
		add(shart);

		switch(FlxG.random.int(1, 2))
		{
        case 1:
			char = new FlxSprite(820, 400).loadGraphic(Paths.image('mainmenu/penis monkey attack 1'));//cords and image
            char.frames = Paths.getSparrowAtlas('mainmenu/penis monkey attack 1');//here put the name of the xml
            char.animation.addByPrefix('idleA', 'bambi idle', 24, true);//on 'idle normal' change it to your xml idle
            char.animation.play('idleA');//rename whatever you waint it to
            char.scrollFactor.set();
            char.flipX = true;//flip thing
            char.antialiasing = ClientPrefs.globalAntialiasing;
            add(char);
		
		case 2:
			char = new FlxSprite(820, 250).loadGraphic(Paths.image('mainmenu/NewDave'));//cords and image
            char.frames = Paths.getSparrowAtlas('mainmenu/NewDave');//here put the name of the xml
            char.animation.addByPrefix('idleA', 'Idle', 24, true);//on 'idle normal' change it to your xml idle
            char.animation.play('idleA');//rename whatever you want it to
            char.scrollFactor.set();
			char.scale.set(0.7, 0.7);
            char.flipX = true;//flip thing
            char.antialiasing = ClientPrefs.globalAntialiasing;
            add(char);
		}

		var divider:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('dadivider'));
		divider.updateHitbox();
		divider.screenCenter();
		divider.antialiasing = ClientPrefs.globalAntialiasing;
		add(divider);

		// magenta.scrollFactor.set();

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		var scale:Float = 0.7;
		/*if(optionShit.length > 6) {
			scale = 6 / optionShit.length;
		}*/
		
		for (i in 0...optionShit.length)
			{
				var upDown:Bool = (i > 2);
				var menuThing:FlxSprite = new FlxSprite(coolPos[i], upDown ? 367.65 : 20);
				trace(coolPos[i]);
				menuThing.antialiasing = ClientPrefs.globalAntialiasing;
				menuThing.frames = Paths.getSparrowAtlas('menuStuff');
				menuThing.animation.addByPrefix('idle', optionShit[i] + '0');
				menuThing.animation.addByPrefix('selected', optionShit[i] + '_SELECTED');
				menuThing.animation.play('idle');
				menuThing.ID = i;
				menuItems.add(menuThing);
			}


		var versionShit:FlxText = new FlxText(FlxG.width * 0.35, FlxG.height - 64, 0, "Apocalypse Engine V" + rhythmVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("Comic Sans MS Bold", 16, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(FlxG.width * 0.35, FlxG.height - 44, 0, "OS Engine v" + osEngineVersion + " - Modded Psych Engine", 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("Comic Sans MS Bold", 16, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(FlxG.width * 0.35, FlxG.height - 24, 0, "Friday Night Funkin' v" + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("Comic Sans MS Bold", 16, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		var gradient:FlxSprite = new FlxSprite(-80).loadGraphic(Paths.image('gradientwtf'));
		gradient.updateHitbox();
		gradient.alpha = 0.4;
		gradient.screenCenter();
		gradient.antialiasing = ClientPrefs.globalAntialiasing;
		add(gradient);

		// NG.core.calls.event.logEvent('swag').send();

		//#if ACHIEVEMENTS_ALLOWED
		//Achievements.loadAchievements();
		//var leDate = Date.now();
		//if (leDate.getDay() == 5 && leDate.getHours() >= 18) {
			//var achieveID:Int = Achievements.getAchievementIndex('friday_night_play');
			//if(!Achievements.isAchievementUnlocked(Achievements.achievementsStuff[achieveID][2])) { //It's a friday night. WEEEEEEEEEEEEEEEEEE
				//Achievements.achievementsMap.set(Achievements.achievementsStuff[achieveID][2], true);
				//giveAchievement();
				//ClientPrefs.saveSettings();
			//}
		//}
		//#end

		super.create();

	}


	// #if ACHIEVEMENTS_ALLOWED
	// // Unlocks "Freaky on a Friday Night" achievement
	// function giveAchievement() {
	// 	add(new AchievementObject('friday_night_play', camAchievement));
	// 	FlxG.sound.play(Paths.sound('confirmMenu'), 0.7);
	// 	trace('Giving achievement "friday_night_play"');
	// }
	// #end

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 7.5, 0, 1);
		if (!selectedSomethin)
		{
			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			#if desktop
			else if (FlxG.keys.anyJustPressed(debugKeys))
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
			var selectedOne:Bool = false;
			for(thing in menuItems)
			{
				if(FlxG.mouse.overlaps(thing))
				{
					selectedOne = true;
					if(curSelected != thing.ID)
					{
						curSelected = thing.ID;	
						FlxG.sound.play(Paths.sound('click'));
					}
					thing.animation.play('selected');
					if(FlxG.mouse.justPressed) //so you HAVE to be on something to select it :)
						selectShit();
				}
				else
					thing.animation.play('idle');
			}
			if(!selectedOne)
				curSelected = 999;
				
			if(selectedSomethin)
			{
				for(thing in menuItems)
				{
					if(idiots.contains(thing.ID))
						thing.alpha -= elapsed;
				}
			}
		}

		super.update(elapsed);
	}
	var idiots:Array<Int> = []; //things to fade out
	function selectShit()
	{
		if (optionShit[curSelected] == 'donate')
		{
			CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
		}
		else
		{
			for(thing in menuItems)
			{
				if(thing.ID != curSelected)
				{
					idiots.push(thing.ID);
				}
			}
			selectedSomethin = true;
			FlxG.mouse.visible = false;
			FlxG.sound.play(Paths.sound('confirmMenu'));

			new FlxTimer().start(1.1, function(tmr:FlxTimer)
      {
				var daChoice:String = optionShit[curSelected];
				switch (daChoice)
					{
						case 'story_mode':
							MusicBeatState.switchState(new StoryMenuState());
						case 'freeplay':
							MusicBeatState.switchState(new CategoryState());
						case 'extras':
							MusicBeatState.switchState(new ExtrasMenuState());
						case 'awards':
							MusicBeatState.switchState(new AchievementsMenuState());
						case 'credits':
							MusicBeatState.switchState(new CreditsState());
						case 'options':
							LoadingState.loadAndSwitchState(new options.OptionsState());
						default:
							MusicBeatState.switchState(new CategoryState());
					}
      });
		}
	}
}