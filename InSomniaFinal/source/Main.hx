package;

import flixel.FlxGame;
import openfl.Lib;
import openfl.display.Sprite;
import flixel.FlxState;

class Main extends Sprite
{
	
	
	
	public function new()
	{
		super();
		addChild(new FlxGame(0, 0, MenuState));
		
		
	}
}
