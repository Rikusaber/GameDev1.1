package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxCollision;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.math.FlxRect;
import flixel.math.FlxPoint;
import flixel.math.FlxVector;
import flixel.math.FlxAngle;
import flixel.util.FlxColor;
import flixel.math.FlxRandom;
import flixel.group.FlxGroup;
import flixel.FlxObject;


class PlayState extends FlxState
{
	var _player:Player;
	var _boxColi:BoxCollider;
	var _DummyStarter:DummyMiniStarter;
	var _buildingColider:Buildings;
	
	override public function create():Void
	{
		var bg = new FlxSprite(0, 0, "assets/images/map/MapFull.png");
		//bg.scale.set(.5, .5);
		_DummyStarter = new DummyMiniStarter(300, 300);
		_DummyStarter.x = 200 + 100;
		_DummyStarter.y = 200 + 100;
		_buildingColider = new Buildings(0, 0);
		_player = new Player(100, 100);
		_player.scale.set(.5, .5);
		_boxColi = new BoxCollider(_player.x+_player.width/2, _player.y+_player.height+100);
	
		
		add(bg);
		
		add(_DummyStarter);
		add(_buildingColider);
		add(_player);
		add(_boxColi);
		
		super.create();
		FlxG.camera.follow(_player, TOPDOWN, 1);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ENTER){
            FlxG.fullscreen = !FlxG.fullscreen;
		}
		//FlxG.collide(_buildingColider, _boxColi);
		FlxG.collide(_DummyStarter, _boxColi);
		_DummyStarter.immovable = true;
		_buildingColider.immovable = true;
		
		_player.x = _boxColi.x - (_player.width / 2 - _boxColi.width / 2);
		_player.y = _boxColi.y-(_player.height * (2 / 3));
		/*_boxColi.x = _player.x+_player.width/2-_boxColi.width/2;
		_boxColi.y = _player.y + _player.height * (2 / 3)/*-_boxColi.height/2*/
		_boxColi.visible = true;
		if (FlxCollision.pixelPerfectCheck(_player, _DummyStarter, 255)&& FlxG.keys.justPressed.SPACE) 
		{	
			FlxG.switchState(new Mini1PlayState());
		} 		
		if (FlxCollision.pixelPerfectCheck(_boxColi, _DummyStarter, 1)&& FlxG.keys.justPressed.M) 
		{	
			FlxG.switchState(new Mini1PlayState());
		} 	
		if (FlxCollision.pixelPerfectCheck(_boxColi, _buildingColider, 1)) 
		{	
			
		} 		
		
		
	
	  
	}
	
	function onCollision(_player:FlxSprite, _DummyStarter:DummyMiniStarter):Void
	{
		FlxG.switchState(new Mini1PlayState());
		trace("Player touching Dummy Object");
		//if colliding and both exist 
		if (_DummyStarter.exists && _player.exists /*&& FlxG.keys.justPressed.SPACE */) 
		{
			FlxG.switchState(new Mini1PlayState());
		}
	}
}
