package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.tile.FlxTilemap;

import flash.system.System;

class MenuState extends FlxState
{
	
	var _playButton:FlxButton;
	var _playButton2:FlxButton;
	var _playButton3:FlxButton;
	override public function create():Void
	{
		
		if (FlxG.sound.music == null) // don't restart the music if it's alredy playing
		{
			
			FlxG.sound.playMusic(AssetPaths.ES_AStrangeDream__ogg, 1, true);
			
		}
		//add(new FlxText(10,10,100,"Hello, world!"));
		_playButton = new FlxButton(0, 0, "Play", clickPlay);
		_playButton.screenCenter();
		add(_playButton);
		
		_playButton2 = new FlxButton(80, 80, "MiniGame1", clickPlay2);
		add(_playButton2);
		
		_playButton3 = new FlxButton(240, 80, "MiniGame2", clickPlay3);
		add(_playButton3);
		super.create();
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ENTER)
            FlxG.fullscreen = !FlxG.fullscreen;

	}
	function clickPlay():Void{
		//switch to play scene
		FlxG.switchState(new PlayState());
	}
	
	function clickPlay2():Void{
		//switch to play scene
		FlxG.switchState(new Mini1PlayState());
	}
	
	function clickPlay3():Void{
		//switch to play scene
		FlxG.switchState(new Mini2PlayState());
	}
}
