package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;


class Mini2PlayState extends FlxState
{
	var _player:PlayerMaze;
	var _boxColi:BoxCollider;

	override public function create():Void
	{
		_player = new PlayerMaze(200, 200);
		
		_boxColi = new BoxCollider(_player.x + _player.width / 2, _player.y + _player.height + 100);
		
		add(_player);
		add(_boxColi);
		
		_player.scale.set(.5, .5);


		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	
}