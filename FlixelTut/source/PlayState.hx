package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

import flixel.FlxObject;


class PlayState extends FlxState
{
	var _player:Player;
	var _DummyStarter:DummyMiniStarter;
	
	override public function create():Void
	{
		var bg = new FlxSprite(0, 0, "assets/images/WorldMap-Neighborhood.png");
		bg.scale.set(.5, .5);
		_player = new Player(700, 700);
		_player.scale.set(.5, .5);
		
		_DummyStarter = new DummyMiniStarter(300, 300);
		_DummyStarter.x = _player.x + 100;
		_DummyStarter.y = _player.y + 100;
		
		add(bg);
		add(_player);
		add(_DummyStarter);
		
		super.create();
		FlxG.camera.follow(_player, TOPDOWN, 1);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ENTER){
            FlxG.fullscreen = !FlxG.fullscreen;
		}
		
		FlxG.overlap(_player, _DummyStarter, onCollision);
		
		/*if (FlxG.keys.justPressed.SPACE){
            FlxG.switchState(new Mini1PlayState());
		} */
	  
	}
	
	function onCollision(_player:FlxSprite, _DummyStarter:DummyMiniStarter):Void
	{
		trace("Player touching Dummy Object");
		//if colliding and both exist 
		if (_DummyStarter.exists && _player.exists /*&& FlxG.keys.justPressed.SPACE */) 
		{
			FlxG.switchState(new Mini1PlayState());
		}
	}
}
