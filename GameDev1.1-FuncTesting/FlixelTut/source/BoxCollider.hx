package;

 import flixel.FlxSprite;
 import flixel.system.FlxAssets.FlxGraphicAsset;
 import flixel.util.FlxColor;

 class BoxCollider extends FlxSprite
 {
     public function new(?X:Float=0, ?Y:Float=0)
     {
         super(X, Y);
		 makeGraphic(10, 10, FlxColor.BLACK);
     }
 }