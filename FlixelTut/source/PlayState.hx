package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	var _player:Player;
	override public function create():Void
	{
		var bg = new FlxSprite(0, 0, "assets/images/WorldMap-Neighborhood.png");
		bg.scale.set(.5, .5);
		_player = new Player(700, 700);
		_player.scale.set(.5, .5);
		add(bg);
		add(_player);
		
		super.create();
		FlxG.camera.follow(_player, TOPDOWN, 1);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ENTER){
            FlxG.fullscreen = !FlxG.fullscreen;
		}
		

	}
}
