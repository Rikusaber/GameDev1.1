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
	var _playButton2:FlxButton;
	override public function create():Void
	{
		//add(new FlxText(10,10,100,"Hello, world!"));
		_playButton = new FlxButton(0, 0, "Play", clickPlay);
		_playButton.screenCenter();
		add(_playButton);
		_playButton2 = new FlxButton(80, 80, "MiniGame", clickPlay2);
		add(_playButton2);
		super.create();
		
<<<<<<< HEAD
		
=======
	
>>>>>>> origin/Igor's_Minigame_testing
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ENTER)
            FlxG.fullscreen = !FlxG.fullscreen;

	}
	function clickPlay():Void{
		//switch to play scene
		FlxG.switchState(new PlayState());
	}
	function clickPlay2():Void{
		//switch to play scene
		FlxG.switchState(new MiniGameTest());
	}
}
