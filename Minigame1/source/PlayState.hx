package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	var _player:PlayerMiniDodge;
	var _enemy:Enemy;
	override public function create():Void
	{
		_player = new PlayerMiniDodge(20, 20);
		_enemy = new Enemy(20,20);
		add(_player);
		add(_enemy);
		_player.scale.set(.5, .5);
		_enemy.scale.set(.5, .5);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}