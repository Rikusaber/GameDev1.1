package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.tile.FlxTilemap;

class EndScreen extends FlxState
{
	
	var _playButton:FlxButton;
	var _courageText:FlxText;
	var courage = 0;
	var maxCourage = 0;
	override public function create():Void
	{
		_courageText = new FlxText(FlxG.width/2 - 10, FlxG.height/2 - 30, courage + "/" + maxCourage);
		//add(new FlxText(10,10,100,"Hello, world!"));
		_playButton = new FlxButton(0, 0, "Return", returnTo);
		_playButton.screenCenter();
		add(_playButton);
		add(_courageText);
		super.create();
		
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ENTER)
            FlxG.fullscreen = !FlxG.fullscreen;

	}
	function returnTo():Void
	{
		FlxG.switchState(new PlayState());
	}
}
