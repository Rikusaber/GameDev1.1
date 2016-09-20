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

import flixel.group.FlxSpriteGroup;
import flixel.tweens.FlxTween;
import flixel.tweens.misc.NumTween;




class PlayState extends FlxState
{
	var _player:Player;
	var _boxColi:BoxCollider;
	var _DummyStarter:DummyMiniStarter;
	//var _buildingColider:Buildings;
	var _box1:Box1;
	var _box2:Box2;
	var _box3:DummyMiniStarter;
	var _box4:DummyMiniStarter;
	//var _text:FlxText;
	var _overlay:FlxSpriteGroup;
	var title: FlxText;
	var canEndD: Bool;
	var _water: Water;
	
	
	
	override public function create():Void
	{
		FlxG.camera.flash(FlxColor.BLACK);
		FlxG.worldBounds.set(0, 0, 1000, 1000);
		canEndD = false;
		var bg = new FlxSprite(0, 0, "assets/images/map/WorldMap-Neighborhood2.png");
		bg.antialiasing = true;
		//bg.scale.set(.5, .5);
		_DummyStarter = new DummyMiniStarter(300, 300);
		_DummyStarter.x = 270;
		_DummyStarter.y = 200 + 405;
		_DummyStarter.updateHitbox();
		//_buildingColider = new Buildings(0, 0);
		_player = new Player(200, 180);
		_player.scale.set(.4, .4);
		_boxColi = new BoxCollider(_player.x+_player.width/2, _player.y+_player.height+100);
		_box1 = new Box1(300, 300);
		_box1.x = 190;
		_box1.y = 110;
		_box2 = new Box2(300, 300);
		_box2.x = 625;
		_box2.y = 0;
		_box3 = new DummyMiniStarter(250, 605);
		_box3.x = 150;
		_box3.y = 605;
		
		_box4 = new DummyMiniStarter(250, 605);
		_box4.x = 390;
		_box4.y = 605;
		
		_water = new Water(300, 300);
		_water.x = 510;
		_water.y = 470;
		//FlxG.resizeWindow(1024, 1024);
		//FlxG.resizeGame(1524, 1024);
		
		
		add(bg);
		add(_box1);
		add(_box2);
		add(_box3);
		add(_box4);
		add(_water);
		
		add(_DummyStarter);
		//add(_buildingColider);
		add(_player);
		add(_boxColi);
		
		super.create();
		FlxG.camera.follow(_player, TOPDOWN, 1);
		FlxG.camera.setScrollBounds(0, 960, 0, 960);
		//FlxG.camera.zoom = 2.3;
		
		_overlay = new FlxSpriteGroup();
		_overlay.scrollFactor.set(0, 0);
		add(_overlay);
		
		
		
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
		//_buildingColider.immovable = true;
		
		FlxG.collide(_box1, _boxColi);
		_box1.immovable = true;
		
		FlxG.collide(_box2, _boxColi);
		_box2.immovable = true;
		
		FlxG.collide(_box3, _boxColi);
		_box3.immovable = true;
		
		FlxG.collide(_box4, _boxColi);
		_box4.immovable = true;
	
		_player.x = _boxColi.x - (_player.width / 2 - _boxColi.width / 2);
		_player.y = _boxColi.y-(_player.height * (2 / 3));
		
		//set the boxes to be invisible to the player
		_boxColi.visible = false;
		_box1.visible = false;
		_DummyStarter.visible = false;
		_box3.visible = false;
		_box4.visible = false;
		_box2.visible = false;
		_water.visible = false;
		
		
		if (FlxCollision.pixelPerfectCheck(_player, _DummyStarter, 255)&& FlxG.keys.justPressed.SPACE) 
		{	
			
			FlxG.switchState(new Mini1PlayState());
		} 		
		if (FlxCollision.pixelPerfectCheck(_boxColi, _DummyStarter, 1)&& FlxG.keys.justPressed.M) 
		{	
			FlxG.switchState(new Mini1PlayState());
		} 	
		
		if (FlxCollision.pixelPerfectCheck(_player, _DummyStarter, 255) && FlxG.keys.justPressed.P)
		{
			dialogue();
			
		}
		if (canEndD == true){
			if (FlxG.keys.justPressed.O){
				title.destroy();
			}
			canEndD = false;
		}
		if (FlxCollision.pixelPerfectCheck(_player, _water, 255)){
			_boxColi.isFloat = true;
			//_boxColi.x =_boxColi.x-1;
		}
		else{
			_boxColi.isFloat = false;
		}
		
		
		//if (FlxCollision.pixelPerfectCheck(_boxColi, _buildingColider, 1)) 
		//{	
			
		//} 		
		//wall collision
		if (_boxColi.x <45){
			_boxColi.x = 45;
		}
		if (_boxColi.y > 960){
			_boxColi.y = 960;
		}
		
		
		
		if (_boxColi.y < 80){
			_boxColi.y = 80;
		}
		
		if (_boxColi.x > 920){
			_boxColi.x = 920;
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
	private function dialogue() {
		title = new FlxText(0, 0, 0, "Hello World!", 30);
		title.color = FlxColor.WHITE;
		title.borderColor = FlxColor.BLACK;
		title.borderSize = 3;
		title.borderStyle = OUTLINE;
		title.screenCenter();
		title.y = FlxG.height-50;
		_overlay.add(title);
		canEndD = true;
		
	}
}
