 package;

 import flixel.FlxSprite;
 import flixel.system.FlxAssets.FlxGraphicAsset;
 import flixel.util.FlxColor;
 import flixel.FlxG; 
 import flixel.math.FlxPoint;
 import flixel.text.FlxText;
 import flixel.FlxObject;

 class Enemy extends FlxSprite
 {
  	var speed:Float = FlxG.random.float(0.0, 200);
    var _score:Float = 0;
    var _player:PlayerMiniDodge;

	  public function new(?X:Float=0, ?Y:Float=0) //optional,if not supplied=0
	 {
	 	//spawn enemy position
	 	super( (FlxG.width/2), 0);
	 	drag.y = 2000;

	 }

   override public function update(elapsed:Float):Void
   {
   	fall();
   	bound();

   	super.update(elapsed);
   }


   function fall():Void 
   {
     velocity.set(0,speed);
   }

    function bound():Void 
     {
     //bind the enemy from leaving the screen
     //if out of bounds, move enemy to opposite side of screen
     //bottom of screen
     if ( y > FlxG.height ) 
     {
          setPosition(FlxG.random.float(0.0, FlxG.width));
     }
   }
}
