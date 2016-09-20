package;

 import flixel.FlxSprite;
 import flixel.system.FlxAssets.FlxGraphicAsset;
 import flixel.util.FlxColor;
 import flixel.FlxG; 
 import flixel.math.FlxPoint;
 import flixel.text.FlxText;
 import flixel.FlxObject;

 class Box2 extends FlxSprite
 {
  	

	  public function new(?X:Float=0, ?Y:Float=0) //optional,if not supplied=0
	 {
	 	//spawn enemy position
	 	super( (FlxG.mouse.x), (FlxG.mouse.y) );
		makeGraphic(300, 230, FlxColor.GREEN);
	 	drag.y = 2000;

	 }

   override public function update(elapsed:Float):Void
   {
   	
   	super.update(elapsed);
   }
   
   

}
