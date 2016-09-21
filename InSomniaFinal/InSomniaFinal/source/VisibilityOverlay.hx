package;


 import flixel.FlxSprite;
 import flixel.math.FlxPoint;
 import flixel.system.FlxAssets.FlxGraphicAsset;
 import flixel.util.FlxColor;
 import flixel.FlxG;
 import flixel.math.FlxPoint;
 import flixel.FlxObject;

 class VisibilityOverlay extends FlxSprite
 {
	 var speed:Float = 200;
	 var _rot:Float = 0;

	 var courage:Int = 0;
	 
	 var _score:Float = 0; //Variable to keep track of the score the player accumulates
    
	 public function new(?X:Float=0, ?Y:Float=0)
     {
         super(X - 480, Y - 480);
		 loadGraphic("assets/images/Flashlight.png", true, 1500, 1500);
		 
		 drag.x = drag.y = 1600;
     }
	  
	 override public function update(elapsed:Float):Void
	 {	

		 super.update(elapsed);
	 }
 }