package;

 import flixel.FlxSprite;
 import flixel.system.FlxAssets.FlxGraphicAsset;
 import flixel.util.FlxColor;
 import flixel.FlxG; 
 import flixel.math.FlxPoint;
 import flixel.text.FlxText;
 import flixel.FlxObject;

 class Water extends FlxSprite
 {
  	

	  public function new(?X:Float=0, ?Y:Float=0) //optional,if not supplied=0
	 {
	 	
	 	super( (FlxG.mouse.x), (FlxG.mouse.y) );
		makeGraphic(240, 144, FlxColor.GREEN);
	 	drag.y = 2000;

	 }

   override public function update(elapsed:Float):Void
   {
   	
   	super.update(elapsed);
   }
   
   

}
