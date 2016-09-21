package;

 import flixel.FlxSprite;
 import flixel.system.FlxAssets.FlxGraphicAsset;
 import flixel.util.FlxColor;
 import flixel.FlxG; 
 import flixel.math.FlxPoint;
 import flixel.text.FlxText;
 import flixel.FlxObject;

 class DummyMiniStarter extends FlxSprite
 {
  	

	  public function new(?X:Float=0, ?Y:Float=0) //optional,if not supplied=0
	 {
	 	//spawn enemy position
	 	super( (FlxG.mouse.x), (FlxG.mouse.y) );
		makeGraphic(90, 90, FlxColor.BLUE);
	 	drag.y = 2000;

	 }

   override public function update(elapsed:Float):Void
   {
   	
   	super.update(elapsed);
   }
   
   

}
