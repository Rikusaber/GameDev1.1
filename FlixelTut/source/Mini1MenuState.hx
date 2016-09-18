package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class Mini1MenuState extends FlxState
{
	var _playButton:FlxButton;
	override public function create():Void
	{
		_playButton = new FlxButton(0, 0, "Play", clickPlay);
		_playButton.screenCenter();
		add(_playButton);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	function clickPlay():Void{
		//switch to play scene
		FlxG.switchState(new Mini1PlayState());
	}
}