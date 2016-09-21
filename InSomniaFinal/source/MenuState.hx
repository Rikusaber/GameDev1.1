package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.tile.FlxTilemap;

class MenuState extends FlxState
{
	
	var _playButton:FlxButton;
	private var _bg:FlxSprite;
	private var _title:FlxSprite;
	override public function create():Void
	{
		if (FlxG.sound.music == null){
			FlxG.sound.playMusic(AssetPaths.ESAStrangeDream__ogg, 1, true);
		}
		//add(new FlxText(10,10,100,"Hello, world!"));
		_bg = new FlxSprite(0, 0, "assets/images/Bedroom(Asleep).png");
		_title = new FlxSprite(0, 0, "assets/images/Title.png");
		_bg.screenCenter();
		_bg.scale.set(1.2, 1.2);
		add(_bg);
		_title.screenCenter();
		_title.scale.set(.5, .5);	
		_title.y = _title.y - 200;
		add(_title);
		_playButton = new FlxButton(0, 0, "Wake Up", clickPlay);
		_playButton.screenCenter();
		_playButton.y = _playButton.y + 175;
		add(_playButton);
		super.create();
		
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ENTER)
            FlxG.fullscreen = !FlxG.fullscreen;

	}
	function clickPlay():Void{
		//switch to play scene
		FlxG.switchState(new Intro());
	}
}