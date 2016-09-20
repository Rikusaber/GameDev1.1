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
	
	var _winThing:DummyMiniStarter;
	
	var _BlackCover:VisibilityOverlay;

	override public function create():Void
	{
		
		var bg = new FlxSprite(0, 0, "assets/images/map/MapFull.png");
		add(bg);

		_player = new PlayerMaze(200, 200);
		
		_boxColi = new BoxCollider(_player.x + _player.width / 2, _player.y + _player.height + 100);
		
		_BlackCover = new VisibilityOverlay(_player.x, _player.y);
		_BlackCover.scale.set(2, 2);
		
		_winThing = new DummyMiniStarter(0, 0);
		_winThing.screenCenter();
		_winThing.y = 0;
		
		add(_player);
		add(_boxColi);
		add(_winThing);
		
		add(_BlackCover);
		_player.scale.set(.5, .5);


		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		_boxColi.visible = false;
	}

	
}