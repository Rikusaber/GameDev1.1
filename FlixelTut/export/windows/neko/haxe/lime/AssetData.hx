package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
<<<<<<< HEAD
			path.set ("assets/font.ttf", "assets/font.ttf");
			type.set ("assets/font.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/images/DownWalkSomnia.png", "assets/images/DownWalkSomnia.png");
			type.set ("assets/images/DownWalkSomnia.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/duck.png", "assets/images/duck.png");
			type.set ("assets/images/duck.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/IdleSomnia.png", "assets/images/IdleSomnia.png");
			type.set ("assets/images/IdleSomnia.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/WorldMap-Neighborhood.png", "assets/images/WorldMap-Neighborhood.png");
			type.set ("assets/images/WorldMap-Neighborhood.png", Reflect.field (AssetType, "image".toUpperCase ()));
=======
			path.set ("assets/data/MapTestCollision.tmx", "assets/data/MapTestCollision.tmx");
			type.set ("assets/data/MapTestCollision.tmx", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/duck.png", "assets/images/duck.png");
			type.set ("assets/images/duck.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/invi.png", "assets/images/invi.png");
			type.set ("assets/images/invi.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/map.png", "assets/images/map.png");
			type.set ("assets/images/map.png", Reflect.field (AssetType, "image".toUpperCase ()));
>>>>>>> origin/Igor's_Minigame_testing
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
