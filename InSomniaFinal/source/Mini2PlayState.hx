package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;
import flixel.ui.FlxButton;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.math.FlxMath;
import openfl.Assets;


class Mini2PlayState extends FlxState
{
	var _player:Player;
	var bg = new FlxSprite(0, 0, "assets/images/WorldMap-Neighborhood.png");
	var textDoc = Assets.getText("assets/TextDoc.txt");
	var _BlackCover:VisibilityOverlay;

	var overlay:FlxGroup;
	private var _map:FlxOgmoLoader;
 	private var _mWalls:FlxTilemap;


 	//timer
 	var countdown:Float = 0;
	var _timer:FlxText;
	var _inst:FlxText;
	
	override public function create():Void
	{

		//LOAD OGMO MAP
		 add(bg);
		 _map = new FlxOgmoLoader(AssetPaths.watermazef__oel);
		 _mWalls = _map.loadTilemap(AssetPaths.WaterTileset__png, 16, 16, "walls");
		 _mWalls.follow();
		 _mWalls.setTileProperties(0, FlxObject.NONE);
		 _mWalls.setTileProperties(1, FlxObject.ANY);
		 add(_mWalls);

		_player = new Player();
		_map.loadEntities(placeEntities, "entities");
		
		_BlackCover = new VisibilityOverlay(_player.x, _player.y);
		add(_player);
		_player.scale.set(.5, .5);
		_player.width = 24;
		_player.height = 36;
		_player.origin.set(-16,0);
		
		FlxG.camera.follow(_player, TOPDOWN, 1);
		add(_BlackCover);
		_timer = new FlxText(10, 10);
		_timer.scrollFactor.set(0,0);
		add(_timer);
		super.create();
		
		_inst = new FlxText(490, 10);
		
		_inst.scrollFactor.set(0, 0);
		_inst.text = "You're Lost at Sea!\nFind Your Way Back to Shore";
		add(_inst);
	
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		_BlackCover.x = _player.x - 735;
		_BlackCover.y  = _player.y - 725;
		FlxG.collide(_player, _mWalls);
		countdown += FlxG.elapsed;
		_timer.text = "Time Elapsed: " + Std.int(countdown);
		checkWin();
	}
	
    function bound():Void 
    {
     //bind the player from leaving the screen
     if (_player.x > bg.width ) //a little wonky
     {
        _player.setPosition(bg.width, _player.y);
     }
     //right side of screen
     else if ( _player.x < 0 )
     {
        _player.setPosition(0, _player.y);
     }
     else if (_player.y > bg.height) 
     {
        _player.setPosition(_player.x, bg.height);
     }
     else if (_player.y < 0)
     {
        _player.setPosition(_player.x, 0);
     }
   }

   	function checkWin():Void
   	{
		if (FlxG.keys.justPressed.ENTER){
            FlxG.fullscreen = !FlxG.fullscreen;
		}
		//this part is just for presentation purposes. press p to quickly end minigame
		if (FlxG.keys.justPressed.P){
            FlxG.switchState(new EndScreen());
		}
		if (_player.y  <= 0) 
		{
			PlayState.courage += Std.int(1/countdown * 100) + 5;
			PlayState.maxCourage += 25;
			FlxG.switchState(new EndScreen());	
		}   	
   	}
	private function placeEntities(entityName:String, entityData:Xml):Void
	 {
     var x:Int = Std.parseInt(entityData.get("x"));
     var y:Int = Std.parseInt(entityData.get("y"));
     if (entityName == "player")
     {
         _player.x = x;
         _player.y = y;
     }
 }
}

