 package;

 import flixel.FlxSprite;
 import flixel.system.FlxAssets.FlxGraphicAsset;
 import flixel.util.FlxColor;
 import flixel.FlxG; 
 import flixel.math.FlxPoint;
 import flixel.text.FlxText;
 import flixel.FlxObject;

 class PlayerMiniDodge extends FlxSprite
 {

 	 var speed:Float = 200;
 	 var _rot:Float = 0;
 	 //helper variables to be able to tell which keys are pressed
 	 var _left:Bool = false;
 	 var _right:Bool = false;
   var player_health:Float = 0;
   var courage:Int = 0;

   var _score:Float = 0;

     public function new(?X:Float=0, ?Y:Float=0) //optional,if not supplied=0
     {
      //spawn player position    
      super( (FlxG.width/2), FlxG.height-100);
      loadGraphic("assets/images/DownWalkSomnia.png", true, 96, 96);
      setFacingFlip(FlxObject.LEFT, true, false);
      setFacingFlip(FlxObject.RIGHT, false, false);
      animation.add("walk", [0, 1, 0, 2], 5, true);
       
      loadGraphic("assets/images/IdleSomnia.png", true, 96, 96);
      animation.add("idle", [0, 1, 2, 3, 4], 5, true);
       
      drag.x = drag.y = 1600;
    }

   override public function update(elapsed:Float):Void
   {

    movement();
    bound();
   	super.update(elapsed);
   }

   function movement():Void
   {

   	_left = FlxG.keys.anyPressed([LEFT,A]);
   	_right = FlxG.keys.anyPressed([RIGHT,D]);

   	//cancel out opposing directions
   	if(_left && _right)
   	{
   		_left = _right = false;
   	}

   	if(_left || _right)
   	{
   		if (_left) 
   		{
   			_rot = 180;
                  facing = FlxObject.LEFT;
   		}
   		else if (_right)
   		{
   			_rot = 0;
                  facing = FlxObject.RIGHT;
   		}

   		velocity.set(speed,0); //pixels per sec x to right, y
   		velocity.rotate(new FlxPoint(0,0), _rot); //point & angle
   	}
        
        if (velocity.x != 0 || velocity.y != 0) 
        {
             animation.play("walk");
        }
        else animation.play("idle");
   }

   function bound():Void 
   {
     //bind the player from leaving the screen
     //if out of bounds, move player to opposite side of screen
     //left side of screen
     if ( x > FlxG.width ) //a little wonky
     {
          setPosition(0, FlxG.height - 100);
     }
     //right side of screen
     else if ( x < 0 )
     {
          setPosition(FlxG.width, FlxG.height - 100);
     }
   }
 }