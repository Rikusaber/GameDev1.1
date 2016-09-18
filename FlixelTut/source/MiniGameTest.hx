package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.system.scaleModes.RelativeScaleMode;

class MiniGameTest extends FlxState
{
	var _player:Player;
	override public function create():Void
	{
		new RelativeScaleMode(.75, .75);
		_player = new Player(20, 20);
		_player.setPosition(512, 256);
		add(_player);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
