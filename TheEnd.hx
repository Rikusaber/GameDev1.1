package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.FlxObject;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.tile.FlxTilemap;
import flash.system.System;

class TheEnd extends FlxState
{
	
	var _liveButton:FlxButton;
	var timerC:Float = 0;
	var _awake:FlxSprite;
	var _asleep:FlxSprite;
	var currState:FlxText;

	override public function create():Void
	{
		var currState = new FlxText(FlxG.width/2, FlxG.height/2);
		add(currState);
		var _awake = new FlxSprite(0, 0, "assets/images/Bedroom(Awake).png");
		var _asleep = new FlxSprite(0, 0, "assets/images/Bedroom(Asleep).png");
		_liveButton = new FlxButton(0, 0, "Wake up!", wakeMeUpInside);
		_liveButton.screenCenter();
		add(_awake);
		add(_asleep);

		add(_liveButton);
		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		timerC += FlxG.elapsed;
		if (Std.int(timerC) >= 10) 
		{
			after10();
		}
		super.update(elapsed);


	}
	function wakeMeUpInside():Void
	{
		_liveButton.destroy();
		if (PlayState.courage >= 15) {
			 //wake up image & text
			_asleep.destroy();
			after10();
		}
	}

	function after10():Void
	{
		
		System.exit(0);
	}
}
