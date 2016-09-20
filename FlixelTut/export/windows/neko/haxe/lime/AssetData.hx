package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/MapTestCollision.tmx", "assets/data/MapTestCollision.tmx");
			type.set ("assets/data/MapTestCollision.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Test Level.oel", "assets/data/Test Level.oel");
			type.set ("assets/data/Test Level.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Testing Map.oep", "assets/data/Testing Map.oep");
			type.set ("assets/data/Testing Map.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/TileMap.oep", "assets/data/TileMap.oep");
			type.set ("assets/data/TileMap.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/font.ttf", "assets/font.ttf");
			type.set ("assets/font.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/images/badtooth.png", "assets/images/badtooth.png");
			type.set ("assets/images/badtooth.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/DownWalkSomnia.png", "assets/images/DownWalkSomnia.png");
			type.set ("assets/images/DownWalkSomnia.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/duck.png", "assets/images/duck.png");
			type.set ("assets/images/duck.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/health.png", "assets/images/health.png");
			type.set ("assets/images/health.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/IdleSomnia.png", "assets/images/IdleSomnia.png");
			type.set ("assets/images/IdleSomnia.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/invi.png", "assets/images/invi.png");
			type.set ("assets/images/invi.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/LeftWalkSomnia.png", "assets/images/LeftWalkSomnia.png");
			type.set ("assets/images/LeftWalkSomnia.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/map/MapFull.png", "assets/images/map/MapFull.png");
			type.set ("assets/images/map/MapFull.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/map/MapOnlyBuildings.png", "assets/images/map/MapOnlyBuildings.png");
			type.set ("assets/images/map/MapOnlyBuildings.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/map.png", "assets/images/map.png");
			type.set ("assets/images/map.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/MapTestCollision.tmx", "assets/images/MapTestCollision.tmx");
			type.set ("assets/images/MapTestCollision.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/mouthbg.png", "assets/images/mouthbg.png");
			type.set ("assets/images/mouthbg.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/RightWalkSomnia.png", "assets/images/RightWalkSomnia.png");
			type.set ("assets/images/RightWalkSomnia.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Somnia.png", "assets/images/Somnia.png");
			type.set ("assets/images/Somnia.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tile.png", "assets/images/tile.png");
			type.set ("assets/images/tile.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tile2.png", "assets/images/tile2.png");
			type.set ("assets/images/tile2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tooth.png", "assets/images/tooth.png");
			type.set ("assets/images/tooth.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/tooth2.png", "assets/images/tooth2.png");
			type.set ("assets/images/tooth2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/UpWalkSomnia.png", "assets/images/UpWalkSomnia.png");
			type.set ("assets/images/UpWalkSomnia.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/WorldMap-Neighborhood.png", "assets/images/WorldMap-Neighborhood.png");
			type.set ("assets/images/WorldMap-Neighborhood.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/WorldMap-Neighborhood2.png", "assets/images/WorldMap-Neighborhood2.png");
			type.set ("assets/images/WorldMap-Neighborhood2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
