package;


 import flixel.FlxSprite;
 import flixel.math.FlxPoint;
 import flixel.system.FlxAssets.FlxGraphicAsset;
 import flixel.util.FlxColor;
 import flixel.FlxG;
 import flixel.math.FlxPoint;
 import flixel.FlxObject;

 class Floaty extends FlxSprite
 {
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
    {
        super(X, Y, SimpleGraphic);
		loadGraphic("assets/images/life.png", true, 32, 32);

	}

   override public function update(elapsed:Float):Void
   {
   	
   	super.update(elapsed);
   }
   
 }