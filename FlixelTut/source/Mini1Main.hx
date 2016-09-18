package;

import flixel.FlxGame;
import openfl.Lib;
import openfl.display.Sprite;

class Mini1Main extends Sprite
{
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, Mini1PlayState));
	}
}
