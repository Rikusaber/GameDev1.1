package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxCollision;

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
			
		/*
		if (FlxG.keys.justPressed.SPACE){
            FlxG.switchState(new Mini1PlayState());
		} */
		
		if (FlxCollision.pixelPerfectCheck(_player, _DummyStarter, 255)&& FlxG.keys.justPressed.SPACE) { //Controls change of state
			FlxG.switchState(new Mini1PlayState());
		}
		
		
	}
	
	
	
}
