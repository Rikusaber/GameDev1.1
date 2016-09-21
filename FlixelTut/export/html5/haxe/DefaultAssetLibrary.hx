package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_font_ttf);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		
		#end
		
		#if flash
		
		className.set ("assets/data/help.oel", __ASSET__assets_data_help_oel);
		type.set ("assets/data/help.oel", AssetType.TEXT);
		className.set ("assets/data/MapTestCollision.tmx", __ASSET__assets_data_maptestcollision_tmx);
		type.set ("assets/data/MapTestCollision.tmx", AssetType.TEXT);
		className.set ("assets/data/Test Level.oel", __ASSET__assets_data_test_level_oel);
		type.set ("assets/data/Test Level.oel", AssetType.TEXT);
		className.set ("assets/data/Testing Map.oep", __ASSET__assets_data_testing_map_oep);
		type.set ("assets/data/Testing Map.oep", AssetType.TEXT);
		className.set ("assets/data/TileMap.oep", __ASSET__assets_data_tilemap_oep);
		type.set ("assets/data/TileMap.oep", AssetType.TEXT);
		className.set ("assets/font.ttf", __ASSET__assets_font_ttf);
		type.set ("assets/font.ttf", AssetType.FONT);
		className.set ("assets/images/badtooth.png", __ASSET__assets_images_badtooth_png);
		type.set ("assets/images/badtooth.png", AssetType.IMAGE);
		className.set ("assets/images/cavetile.png", __ASSET__assets_images_cavetile_png);
		type.set ("assets/images/cavetile.png", AssetType.IMAGE);
		className.set ("assets/images/Copy.png", __ASSET__assets_images_copy_png);
		type.set ("assets/images/Copy.png", AssetType.IMAGE);
		className.set ("assets/images/DownWalkSomnia.png", __ASSET__assets_images_downwalksomnia_png);
		type.set ("assets/images/DownWalkSomnia.png", AssetType.IMAGE);
		className.set ("assets/images/duck.png", __ASSET__assets_images_duck_png);
		type.set ("assets/images/duck.png", AssetType.IMAGE);
		className.set ("assets/images/Flashlight.png", __ASSET__assets_images_flashlight_png);
		type.set ("assets/images/Flashlight.png", AssetType.IMAGE);
		className.set ("assets/images/health.png", __ASSET__assets_images_health_png);
		type.set ("assets/images/health.png", AssetType.IMAGE);
		className.set ("assets/images/IdleSomnia.png", __ASSET__assets_images_idlesomnia_png);
		type.set ("assets/images/IdleSomnia.png", AssetType.IMAGE);
		className.set ("assets/images/invi.png", __ASSET__assets_images_invi_png);
		type.set ("assets/images/invi.png", AssetType.IMAGE);
		className.set ("assets/images/LeftWalkSomnia.png", __ASSET__assets_images_leftwalksomnia_png);
		type.set ("assets/images/LeftWalkSomnia.png", AssetType.IMAGE);
		className.set ("assets/images/map/MapFull.png", __ASSET__assets_images_map_mapfull_png);
		type.set ("assets/images/map/MapFull.png", AssetType.IMAGE);
		className.set ("assets/images/map/MapOnlyBuildings.png", __ASSET__assets_images_map_maponlybuildings_png);
		type.set ("assets/images/map/MapOnlyBuildings.png", AssetType.IMAGE);
		className.set ("assets/images/map.png", __ASSET__assets_images_map_png);
		type.set ("assets/images/map.png", AssetType.IMAGE);
		className.set ("assets/images/mouthbg.png", __ASSET__assets_images_mouthbg_png);
		type.set ("assets/images/mouthbg.png", AssetType.IMAGE);
		className.set ("assets/images/RightWalkSomnia.png", __ASSET__assets_images_rightwalksomnia_png);
		type.set ("assets/images/RightWalkSomnia.png", AssetType.IMAGE);
		className.set ("assets/images/Somnia.png", __ASSET__assets_images_somnia_png);
		type.set ("assets/images/Somnia.png", AssetType.IMAGE);
		className.set ("assets/images/tile2.png", __ASSET__assets_images_tile2_png);
		type.set ("assets/images/tile2.png", AssetType.IMAGE);
		className.set ("assets/images/tile3.png", __ASSET__assets_images_tile3_png);
		type.set ("assets/images/tile3.png", AssetType.IMAGE);
		className.set ("assets/images/tooth.png", __ASSET__assets_images_tooth_png);
		type.set ("assets/images/tooth.png", AssetType.IMAGE);
		className.set ("assets/images/tooth2.png", __ASSET__assets_images_tooth2_png);
		type.set ("assets/images/tooth2.png", AssetType.IMAGE);
		className.set ("assets/images/UpWalkSomnia.png", __ASSET__assets_images_upwalksomnia_png);
		type.set ("assets/images/UpWalkSomnia.png", AssetType.IMAGE);
		className.set ("assets/images/WorldMap-Neighborhood.png", __ASSET__assets_images_worldmap_neighborhood_png);
		type.set ("assets/images/WorldMap-Neighborhood.png", AssetType.IMAGE);
		className.set ("assets/images/WorldMap-Neighborhood2.png", __ASSET__assets_images_worldmap_neighborhood2_png);
		type.set ("assets/images/WorldMap-Neighborhood2.png", AssetType.IMAGE);
		className.set ("assets/sound/ES_AStrangeDream.mp3", __ASSET__assets_sound_es_astrangedream_mp3);
		type.set ("assets/sound/ES_AStrangeDream.mp3", AssetType.MUSIC);
		className.set ("assets/sound/ES_AStrangeDream.ogg", __ASSET__assets_sound_es_astrangedream_ogg);
		type.set ("assets/sound/ES_AStrangeDream.ogg", AssetType.MUSIC);
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/help.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/MapTestCollision.tmx";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Test Level.oel";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/Testing Map.oep";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/TileMap.oep";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/font.ttf";
		className.set (id, __ASSET__assets_font_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/images/badtooth.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/cavetile.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Copy.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/DownWalkSomnia.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/duck.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Flashlight.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/health.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/IdleSomnia.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/invi.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/LeftWalkSomnia.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/map/MapFull.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/map/MapOnlyBuildings.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/map.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/mouthbg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/RightWalkSomnia.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Somnia.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tile2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tile3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tooth.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/tooth2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/UpWalkSomnia.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/WorldMap-Neighborhood.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/WorldMap-Neighborhood2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sound/ES_AStrangeDream.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sound/ES_AStrangeDream.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "flixel/sounds/beep.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/sounds/flixel.ogg";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "flixel/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__flixel_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/fonts/monsterrat.ttf";
		className.set (id, __ASSET__flixel_fonts_monsterrat_ttf);
		
		type.set (id, AssetType.FONT);
		id = "flixel/images/ui/button.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/help.oel", __ASSET__assets_data_help_oel);
		type.set ("assets/data/help.oel", AssetType.TEXT);
		
		className.set ("assets/data/MapTestCollision.tmx", __ASSET__assets_data_maptestcollision_tmx);
		type.set ("assets/data/MapTestCollision.tmx", AssetType.TEXT);
		
		className.set ("assets/data/Test Level.oel", __ASSET__assets_data_test_level_oel);
		type.set ("assets/data/Test Level.oel", AssetType.TEXT);
		
		className.set ("assets/data/Testing Map.oep", __ASSET__assets_data_testing_map_oep);
		type.set ("assets/data/Testing Map.oep", AssetType.TEXT);
		
		className.set ("assets/data/TileMap.oep", __ASSET__assets_data_tilemap_oep);
		type.set ("assets/data/TileMap.oep", AssetType.TEXT);
		
		className.set ("assets/font.ttf", __ASSET__assets_font_ttf);
		type.set ("assets/font.ttf", AssetType.FONT);
		
		className.set ("assets/images/badtooth.png", __ASSET__assets_images_badtooth_png);
		type.set ("assets/images/badtooth.png", AssetType.IMAGE);
		
		className.set ("assets/images/cavetile.png", __ASSET__assets_images_cavetile_png);
		type.set ("assets/images/cavetile.png", AssetType.IMAGE);
		
		className.set ("assets/images/Copy.png", __ASSET__assets_images_copy_png);
		type.set ("assets/images/Copy.png", AssetType.IMAGE);
		
		className.set ("assets/images/DownWalkSomnia.png", __ASSET__assets_images_downwalksomnia_png);
		type.set ("assets/images/DownWalkSomnia.png", AssetType.IMAGE);
		
		className.set ("assets/images/duck.png", __ASSET__assets_images_duck_png);
		type.set ("assets/images/duck.png", AssetType.IMAGE);
		
		className.set ("assets/images/Flashlight.png", __ASSET__assets_images_flashlight_png);
		type.set ("assets/images/Flashlight.png", AssetType.IMAGE);
		
		className.set ("assets/images/health.png", __ASSET__assets_images_health_png);
		type.set ("assets/images/health.png", AssetType.IMAGE);
		
		className.set ("assets/images/IdleSomnia.png", __ASSET__assets_images_idlesomnia_png);
		type.set ("assets/images/IdleSomnia.png", AssetType.IMAGE);
		
		className.set ("assets/images/invi.png", __ASSET__assets_images_invi_png);
		type.set ("assets/images/invi.png", AssetType.IMAGE);
		
		className.set ("assets/images/LeftWalkSomnia.png", __ASSET__assets_images_leftwalksomnia_png);
		type.set ("assets/images/LeftWalkSomnia.png", AssetType.IMAGE);
		
		className.set ("assets/images/map/MapFull.png", __ASSET__assets_images_map_mapfull_png);
		type.set ("assets/images/map/MapFull.png", AssetType.IMAGE);
		
		className.set ("assets/images/map/MapOnlyBuildings.png", __ASSET__assets_images_map_maponlybuildings_png);
		type.set ("assets/images/map/MapOnlyBuildings.png", AssetType.IMAGE);
		
		className.set ("assets/images/map.png", __ASSET__assets_images_map_png);
		type.set ("assets/images/map.png", AssetType.IMAGE);
		
		className.set ("assets/images/mouthbg.png", __ASSET__assets_images_mouthbg_png);
		type.set ("assets/images/mouthbg.png", AssetType.IMAGE);
		
		className.set ("assets/images/RightWalkSomnia.png", __ASSET__assets_images_rightwalksomnia_png);
		type.set ("assets/images/RightWalkSomnia.png", AssetType.IMAGE);
		
		className.set ("assets/images/Somnia.png", __ASSET__assets_images_somnia_png);
		type.set ("assets/images/Somnia.png", AssetType.IMAGE);
		
		className.set ("assets/images/tile2.png", __ASSET__assets_images_tile2_png);
		type.set ("assets/images/tile2.png", AssetType.IMAGE);
		
		className.set ("assets/images/tile3.png", __ASSET__assets_images_tile3_png);
		type.set ("assets/images/tile3.png", AssetType.IMAGE);
		
		className.set ("assets/images/tooth.png", __ASSET__assets_images_tooth_png);
		type.set ("assets/images/tooth.png", AssetType.IMAGE);
		
		className.set ("assets/images/tooth2.png", __ASSET__assets_images_tooth2_png);
		type.set ("assets/images/tooth2.png", AssetType.IMAGE);
		
		className.set ("assets/images/UpWalkSomnia.png", __ASSET__assets_images_upwalksomnia_png);
		type.set ("assets/images/UpWalkSomnia.png", AssetType.IMAGE);
		
		className.set ("assets/images/WorldMap-Neighborhood.png", __ASSET__assets_images_worldmap_neighborhood_png);
		type.set ("assets/images/WorldMap-Neighborhood.png", AssetType.IMAGE);
		
		className.set ("assets/images/WorldMap-Neighborhood2.png", __ASSET__assets_images_worldmap_neighborhood2_png);
		type.set ("assets/images/WorldMap-Neighborhood2.png", AssetType.IMAGE);
		
		className.set ("assets/sound/ES_AStrangeDream.mp3", __ASSET__assets_sound_es_astrangedream_mp3);
		type.set ("assets/sound/ES_AStrangeDream.mp3", AssetType.MUSIC);
		
		className.set ("assets/sound/ES_AStrangeDream.ogg", __ASSET__assets_sound_es_astrangedream_ogg);
		type.set ("assets/sound/ES_AStrangeDream.ogg", AssetType.MUSIC);
		
		className.set ("flixel/sounds/beep.ogg", __ASSET__flixel_sounds_beep_ogg);
		type.set ("flixel/sounds/beep.ogg", AssetType.SOUND);
		
		className.set ("flixel/sounds/flixel.ogg", __ASSET__flixel_sounds_flixel_ogg);
		type.set ("flixel/sounds/flixel.ogg", AssetType.SOUND);
		
		className.set ("flixel/fonts/nokiafc22.ttf", __ASSET__flixel_fonts_nokiafc22_ttf);
		type.set ("flixel/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("flixel/fonts/monsterrat.ttf", __ASSET__flixel_fonts_monsterrat_ttf);
		type.set ("flixel/fonts/monsterrat.ttf", AssetType.FONT);
		
		className.set ("flixel/images/ui/button.png", __ASSET__flixel_images_ui_button_png);
		type.set ("flixel/images/ui/button.png", AssetType.IMAGE);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = flash.net.URLLoaderDataFormat.BINARY;
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofData (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_help_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_maptestcollision_tmx extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_test_level_oel extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_testing_map_oep extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_data_tilemap_oep extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_font_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_images_badtooth_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_cavetile_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_copy_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_downwalksomnia_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_duck_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_flashlight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_health_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_idlesomnia_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_invi_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_leftwalksomnia_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_map_mapfull_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_map_maponlybuildings_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_map_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_mouthbg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_rightwalksomnia_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_somnia_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tile2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tile3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tooth_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_tooth2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_upwalksomnia_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_worldmap_neighborhood_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_worldmap_neighborhood2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sound_es_astrangedream_mp3 extends null { }
@:keep @:bind #if display private #end class __ASSET__assets_sound_es_astrangedream_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }


#elseif html5






@:keep #if display private #end class __ASSET__assets_font_ttf extends lime.text.Font { public function new () { super (); name = "Visitor TT1 BRK"; } } 



























@:keep #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { super (); name = "Monsterrat"; } } 



#else



#if (windows || mac || linux || cpp)


@:file("assets/data/help.oel") #if display private #end class __ASSET__assets_data_help_oel extends lime.utils.Bytes {}
@:file("assets/data/MapTestCollision.tmx") #if display private #end class __ASSET__assets_data_maptestcollision_tmx extends lime.utils.Bytes {}
@:file("assets/data/Test Level.oel") #if display private #end class __ASSET__assets_data_test_level_oel extends lime.utils.Bytes {}
@:file("assets/data/Testing Map.oep") #if display private #end class __ASSET__assets_data_testing_map_oep extends lime.utils.Bytes {}
@:file("assets/data/TileMap.oep") #if display private #end class __ASSET__assets_data_tilemap_oep extends lime.utils.Bytes {}
@:font("assets/font.ttf") #if display private #end class __ASSET__assets_font_ttf extends lime.text.Font {}
@:image("assets/images/badtooth.png") #if display private #end class __ASSET__assets_images_badtooth_png extends lime.graphics.Image {}
@:image("assets/images/cavetile.png") #if display private #end class __ASSET__assets_images_cavetile_png extends lime.graphics.Image {}
@:image("assets/images/Copy.png") #if display private #end class __ASSET__assets_images_copy_png extends lime.graphics.Image {}
@:image("assets/images/DownWalkSomnia.png") #if display private #end class __ASSET__assets_images_downwalksomnia_png extends lime.graphics.Image {}
@:image("assets/images/duck.png") #if display private #end class __ASSET__assets_images_duck_png extends lime.graphics.Image {}
@:image("assets/images/Flashlight.png") #if display private #end class __ASSET__assets_images_flashlight_png extends lime.graphics.Image {}
@:image("assets/images/health.png") #if display private #end class __ASSET__assets_images_health_png extends lime.graphics.Image {}
@:image("assets/images/IdleSomnia.png") #if display private #end class __ASSET__assets_images_idlesomnia_png extends lime.graphics.Image {}
@:image("assets/images/invi.png") #if display private #end class __ASSET__assets_images_invi_png extends lime.graphics.Image {}
@:image("assets/images/LeftWalkSomnia.png") #if display private #end class __ASSET__assets_images_leftwalksomnia_png extends lime.graphics.Image {}
@:image("assets/images/map/MapFull.png") #if display private #end class __ASSET__assets_images_map_mapfull_png extends lime.graphics.Image {}
@:image("assets/images/map/MapOnlyBuildings.png") #if display private #end class __ASSET__assets_images_map_maponlybuildings_png extends lime.graphics.Image {}
@:image("assets/images/map.png") #if display private #end class __ASSET__assets_images_map_png extends lime.graphics.Image {}
@:image("assets/images/mouthbg.png") #if display private #end class __ASSET__assets_images_mouthbg_png extends lime.graphics.Image {}
@:image("assets/images/RightWalkSomnia.png") #if display private #end class __ASSET__assets_images_rightwalksomnia_png extends lime.graphics.Image {}
@:image("assets/images/Somnia.png") #if display private #end class __ASSET__assets_images_somnia_png extends lime.graphics.Image {}
@:image("assets/images/tile2.png") #if display private #end class __ASSET__assets_images_tile2_png extends lime.graphics.Image {}
@:image("assets/images/tile3.png") #if display private #end class __ASSET__assets_images_tile3_png extends lime.graphics.Image {}
@:image("assets/images/tooth.png") #if display private #end class __ASSET__assets_images_tooth_png extends lime.graphics.Image {}
@:image("assets/images/tooth2.png") #if display private #end class __ASSET__assets_images_tooth2_png extends lime.graphics.Image {}
@:image("assets/images/UpWalkSomnia.png") #if display private #end class __ASSET__assets_images_upwalksomnia_png extends lime.graphics.Image {}
@:image("assets/images/WorldMap-Neighborhood.png") #if display private #end class __ASSET__assets_images_worldmap_neighborhood_png extends lime.graphics.Image {}
@:image("assets/images/WorldMap-Neighborhood2.png") #if display private #end class __ASSET__assets_images_worldmap_neighborhood2_png extends lime.graphics.Image {}
@:file("assets/sound/ES_AStrangeDream.mp3") #if display private #end class __ASSET__assets_sound_es_astrangedream_mp3 extends lime.utils.Bytes {}
@:file("assets/sound/ES_AStrangeDream.ogg") #if display private #end class __ASSET__assets_sound_es_astrangedream_ogg extends lime.utils.Bytes {}
@:file("C:/Users/ringk2/haxelib install openfl/flixel/4,1,1/assets/sounds/beep.ogg") #if display private #end class __ASSET__flixel_sounds_beep_ogg extends lime.utils.Bytes {}
@:file("C:/Users/ringk2/haxelib install openfl/flixel/4,1,1/assets/sounds/flixel.ogg") #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends lime.utils.Bytes {}
@:font("C:/Users/ringk2/haxelib install openfl/flixel/4,1,1/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/Users/ringk2/haxelib install openfl/flixel/4,1,1/assets/fonts/monsterrat.ttf") #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:image("C:/Users/ringk2/haxelib install openfl/flixel/4,1,1/assets/images/ui/button.png") #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__assets_font_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_font_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__flixel_fonts_monsterrat_ttf (); src = font.src; name = font.name; super (); }}

#end

#end