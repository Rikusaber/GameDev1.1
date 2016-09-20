 package;

 import flixel.FlxSprite;
 import flixel.system.FlxAssets.FlxGraphicAsset;

 class Buildings extends FlxSprite
 {
     public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
     {
         super(X, Y, SimpleGraphic);
		 loadGraphic("assets/images/map/MapOnlyBuildings.png", true, 1024, 1024);
     }
 }