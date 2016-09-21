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
	 public var isFloat = false;
	 var speed:Float = 200;
	 var _rot:Float = 0;
	 //helper variables to be able to tell which keys are pressed
	 var _up:Bool = false;
	 var _down:Bool = false;
	 var _left:Bool = false;
	 var _right:Bool = false;
	 var courage:Int = 0;
	 
	 
	 var _score:Float = 0; //Variable to keep track of the score the player accumulates
	 
     public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
     {
         super(X, Y, SimpleGraphic);
		 loadGraphic("assets/images/Somnia.png", true, 96, 96);
		 //makeGraphic(16, 16, FlxColor.GREEN);
		 //loadGraphic("assets/images/DownWalkSomnia.png", true, 96, 96);
		 //setFacingFlip(direction,flipx,flipy)
		 setFacingFlip(FlxObject.LEFT, true, false);
		 setFacingFlip(FlxObject.RIGHT, false, false);
		 //animation.add("walk", [0, 1, 2, 3], 5, true);
		 animation.add("idle", [0, 1, 2, 3, 4], 6, true);
		 
		 //loadGraphic("assets/images/DownWalkSomnia.png", true, 96, 96);
		 animation.add("down", [5, 6, 7, 8], 6, true);
		 //loadGraphic("assets/images/IdleSomnia.png", true, 96, 96);
		 //animation.add("idle", [0, 1, 2, 3, 4], 5, true);
		 animation.add("up", [10, 11, 12, 13], 6, true);
		 animation.add("left", [15, 16, 17, 18], 6, true);
		 animation.add("right", [20, 21, 22, 23], 6, true);
		 
		 animation.add("idlewat", [25, 26, 27, 28, 29], 6, true);
		 animation.add("downwat", [30, 31, 32, 33], 6, true);
		 animation.add("upwat", [35, 36, 37, 38], 6, true);
		 animation.add("leftwat", [40, 41, 42, 43], 6, true);
		 animation.add("rightwat", [45, 46, 47, 48], 6, true);
		 
		 
		 drag.x = drag.y = 1600;
     }
	 
	 override public function update(elapsed:Float):Void
	 {
		 movement();
		 //Interaction "range" should be one "tile" length up, down, left, or right
		 if (FlxG.keys.justPressed.SPACE ) //If the Spacebar is pressed and the player is in range of an object they can interact with (denote with a member variable)
			{
				//NEED TO ADD CONDITION FOR OBJECT IN RANGE
				//isTouching(Direction:Int):Bool function checks if something is touched in the given direction and returns true/false
				//Directions here are LEFT, RIGHT, UP, and DOWN
				interact ();
			}
		//slow the player's movement when swimming
		if (isFloat == false){
			speed = 200;
		}
		if (isFloat == true){
			speed = 50;
		}
		
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
		 //if (velocity.x != 0 || velocity.y != 0){
			//animation.play("walk");
		 //}
		 if (isFloat == false){
			 if (_up){
				 animation.play("up");
			 }
			 else if (_down){
				 animation.play("down");
			 }
			 else if (_right || _left){
				 animation.play("right");
			 }
			 else {
				
				animation.play("idle");
			 }
		 }
		if (isFloat == true){
			if (_up){
				 animation.play("upwat");
			 }
			 else if (_down){
				 animation.play("downwat");
			 }
			 else if (_right || _left){
				 animation.play("rightwat");
			 }
			 else {
				
				animation.play("idlewat");
			 }
		}

		 
		// velocity.set(100, 0);
		//velocity.set(speed, 0);
	 }
	 
	 function interact():Void  //Function to initiate interaction with a valid object if player is in range
	 {
		//Initiate the interaction with the object, in this case checking the attached minigame and loading its corresponding Gamestate
		//trace("interact() called");
		
		//switchTo(nextState:FlxState):Bool //Use this function to switch gamestate (trying to determine optimal place to implement
	 }
 }