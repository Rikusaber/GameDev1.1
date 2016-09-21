package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;

import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.math.FlxMath;
import openfl.Assets;
import flixel.tile.FlxTilemap;



class Mini2PlayState extends FlxState
{
	var _player:PlayerMaze;
	var _boxColi:BoxCollider;
	var bg = new FlxSprite(0, 0, "assets/images/WorldMap-Neighborhood.png");
	
	var _winThing:DummyMiniStarter;
	var _BlackCover:VisibilityOverlay;
	
	private var _map:FlxOgmoLoader;
 	private var _mWalls:FlxTilemap;

	override public function create():Void
	{
		
		//LOAD OGMO MAP
		 _map = new FlxOgmoLoader(AssetPaths.help__oel);
		 _mWalls = _map.loadTilemap(AssetPaths.cavetile__png, 16, 16, "walls");
		 _mWalls.follow();
 		 _mWalls.setTileProperties(0, FlxObject.NONE);
 		 _mWalls.setTileProperties(1, FlxObject.ANY);
		 add(_mWalls);
		 

		_player = new PlayerMaze();
		add(_player);
		_player.scale.set(.5, .5);

		_player.width = 24;
		_player.height = 36;
		_player.origin.set( -16, 0);
		_boxColi = new BoxCollider(_player.x + _player.width / 2, _player.y + _player.height + 100);
		_BlackCover = new VisibilityOverlay(_player.x + _player.width / 2, _player.y + _player.height + 100);
		//_player.screenCenter();
		//_BlackCover.screenCenter();
		
		_map.loadEntities(placeEntities, "entities");
		
		/*
		_winThing = new DummyMiniStarter(0, 0);
		_winThing.screenCenter();
		_winThing.y = 0;
		*/
		
		//add(_player);
		add(_boxColi);
		//add(_winThing);		
		add(_BlackCover);


		FlxG.camera.follow(_player, TOPDOWN, 1);

		super.create();

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		_boxColi.visible = false;
		//bound();
		
		FlxG.collide(_player, _mWalls);
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
	
}