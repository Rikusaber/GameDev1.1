 package;

 import flixel.FlxSprite;
 import flixel.math.FlxPoint;
 import flixel.system.FlxAssets.FlxGraphicAsset;
 import flixel.util.FlxColor;
 import flixel.FlxG;
 import flixel.math.FlxPoint;
 import flixel.FlxObject;

 class Player extends FlxSprite
 {
	 var speed:Float = 200;
	 var _rot:Float = 0;
	 //helper variables to be able to tell which keys are pressed
	 var _up:Bool = false;
	 var _down:Bool = false;
	 var _left:Bool = false;
	 var _right:Bool = false;
	 
     public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
     {
         super(X, Y, SimpleGraphic);
		 //makeGraphic(16, 16, FlxColor.GREEN);
		 loadGraphic("assets/images/duck.png", true, 100, 114); //Asset name, Animated Bool, Width, Height
		 //setFacingFlip(direction,flipx,flipy
		 setFacingFlip(FlxObject.LEFT, true, false);
		 setFacingFlip(FlxObject.RIGHT, false, false);
		 animation.add("walk", [0, 1, 0, 2], 5, true);
		 
		 drag.x = drag.y = 1600;
     }
	 
	 override public function update(elapsed:Float):Void
	 {
		 movement();
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
		 else {animation.stop;}
		 
		// velocity.set(100, 0);
		//velocity.set(speed, 0);
	 }
 }