package;


 import flixel.FlxSprite;
 import flixel.math.FlxPoint;
 import flixel.system.FlxAssets.FlxGraphicAsset;
 import flixel.util.FlxColor;
 import flixel.FlxG;
 import flixel.math.FlxPoint;
 import flixel.FlxObject;

 class BoxCollider extends FlxSprite
 {
	  var speed:Float = 200;
	 var _rot:Float = 0;
	 //helper variables to be able to tell which keys are pressed
	 var _up:Bool = false;
	 var _down:Bool = false;
	 var _left:Bool = false;
	 var _right:Bool = false;
	 var courage:Int = 0;
	 
	 
	 var _score:Float = 0; //Variable to keep track of the score the player accumulates
     public function new(?X:Float=0, ?Y:Float=0)
     {
         super(X, Y);
		 makeGraphic(10, 10, FlxColor.BLACK);
		 
		 drag.x = drag.y = 1600;
     }
	  
	 override public function update(elapsed:Float):Void
	 {
		 movement();
		 //Interaction "range" should be one "tile" length up, down, left, or right
		
		 super.update(elapsed);
	 }
	 function movement():Void
	 {
		 _up = FlxG.keys.anyPressed([UP, W]);
		 _down = FlxG.keys.anyPressed([DOWN, S]);
		 _left = FlxG.keys.anyPressed([LEFT, A]);
		 _right = FlxG.keys.anyPressed([RIGHT, D]);
		 
		 //cancel out opposing directions
		 if (_up && _down)
		 {
			 _up = false;
			 _down = false;
		 }
		 if (_left && _right)
		 {
			 _left = _right = false;
		 }
		 if (_up || _down || _left || _right){
			if (_left)
			{
				_rot = 180;
				facing = FlxObject.LEFT;
				if (_up) _rot += 45;
				else if (_down) _rot -= 45;
			}
			else if (_right){
				_rot = 0;
				facing = FlxObject.RIGHT;
				if (_up) _rot -= 45;
				else if (_down) _rot += 45;
			}
			else if (_down) _rot = 90;
			else if (_up) _rot = 270;
			
			 
			velocity.set(speed, 0);
			velocity.rotate(new FlxPoint(0, 0), _rot);
		 }
		 if (velocity.x != 0 || velocity.y != 0){
			animation.play("walk");
		 }
		 else {
			
			animation.play("idle");
		 }
		 
		// velocity.set(100, 0);
		//velocity.set(speed, 0);
	 }
 }