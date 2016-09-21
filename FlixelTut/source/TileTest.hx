package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;

import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.math.FlxMath;
import openfl.Assets;


class TileTest extends FlxState
{
	var _player:Player;
	var bg = new FlxSprite(0, 0, "assets/images/WorldMap-Neighborhood.png");
	//test

	private var _map:FlxOgmoLoader;
 	private var _mWalls:FlxTilemap;

	override public function create():Void
	{

		//LOAD OGMO MAP
		 _map = new FlxOgmoLoader(AssetPaths.help__oel);
		 _mWalls = _map.loadTilemap(AssetPaths.Copy__png, 16, 16, "walls");
		 _mWalls.follow();
		 _mWalls.setTileProperties(1, FlxObject.NONE);
		 _mWalls.setTileProperties(0, FlxObject.ANY);
		 add(_mWalls);

		_player = new Player();
		_map.loadEntities(placeEntities, "entities");
		
		add(bg);
		add(_player);
		_player.scale.set(.2, .2);
		super.create();
		FlxG.camera.follow(_player, TOPDOWN, 1);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(_player, _mWalls);
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
