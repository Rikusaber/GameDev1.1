package;

/**
 * ...
 * @author Enoch
 */

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxCollision;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.math.FlxRect;
import flixel.math.FlxPoint;
import flixel.math.FlxVector;
import flixel.math.FlxAngle;
import flixel.util.FlxColor;
import flixel.math.FlxRandom;
import flixel.group.FlxGroup;
import flixel.FlxObject;
import haxe.Timer;

import flixel.group.FlxSpriteGroup;

import flixel.tweens.misc.NumTween;

class Intro extends FlxState
{
	var _overlay:FlxGroup;
	var _text:FlxText;
	
	override public function create():Void {
		_overlay = new FlxGroup();
		add(_overlay);
		
		
		
		_text = new FlxText(0, 0, "Ow!", 16);
		_text.alignment = CENTER;
		_text.screenCenter();
		_overlay.add(_text);
	
		FlxTween.num(0, 1, 2,
		  {
			onComplete: function(_) {
				var timer = new haxe.Timer(500);
				timer.run = function() {
				timer.stop();
				FlxTween.num(1, 0, 2,
				{ 
					onComplete: function(_) {
						/*_text.destroy();
						_text = new FlxText(0,0, "A golden object lies,\ncovered in dust,\non top of an altar.\n\nIs it a weapon?\nSome kind of a tool?", 16);
						_text.alignment = CENTER;
						_text.screenCenter();
						_overlay.add(_text);*/
						_text.text = "You wake up\n with a throbbing pain in your mouth\n-a toothache!";
						_text.screenCenter();
						FlxTween.num(0, 1, 2,
					  {
						onComplete: function(_) {
							var timer = new haxe.Timer(1000);
							timer.run = function() {
							timer.stop();
							FlxTween.num(1, 0, 2,
							{ 
								onComplete: function(_) {
									
									_text.text = "Do you have enough courage to get out of bed?";
									_text.screenCenter();
									FlxTween.num(0, 1, 2,
									  {
											
											onComplete: function(_) {
												
											var timer = new Timer(1000);
											timer.run = function(){
												timer.stop();
												FlxTween.num(1, 0, 2,
												{
													onComplete: function(_){
														_text.text = "...\nWait - you're already outside.";
									_text.screenCenter();
									FlxTween.num(0, 1, 2,
									  {
											
											onComplete: function(_) {
												
											
									
									_text.text = "...\nwait - it's dangerous at night!";
									_text.screenCenter();
									FlxTween.num(0, 1, 2,
									  {
											
											onComplete:function(_){
												var timer = new Timer(1000);
												timer.run = function(){
													timer.stop();
													FlxTween.num(1, 0, 2,
													{
														onComplete: function(_) {
									
									_text.text = "Are you brave enough\nto challenge them...\nTo face your fears...?";
									_text.screenCenter();
									FlxTween.num(0, 1, 2,
									  {
											
											onComplete: endIntro
										
									  },
									  function(e) {
										_text.alpha = e;
									  }
									);
								}
													},
													function(e){
														_text.alpha = e;
													}
													);
												}
											}
										
									  },
									  function(e) {
										_text.alpha = e;
									  }
									);
								}
										
									  },
									  function(e) {
										_text.alpha = e;
									  }
									);
													}
												},
												function(e) {
										_text.alpha = e;
									  }
												);
											}

									
									
								}
										
									  },
									  function(e) {
										_text.alpha = e;
									  }
									);
								}
								
							}, 
							function(e) { _text.alpha = e; });
						  };
						}
					  },
						  function(e) {
							_text.alpha = e;
						  }
						);
					}
					
				}, 
				function(e) { _text.alpha = e; });
			  };
			}
		  },
		  function(e) {
			_text.alpha = e;
		  }
		);
		
		
		
		super.create();
		
	}
	private function endIntro(_) {
		FlxG.camera.fade(FlxColor.BLACK, 4, false, function() {
        FlxG.switchState(new PlayState());
		});
		return;
	}
	
	override public function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.ENTER){
			FlxG.switchState(new PlayState());
		}
		super.update(elapsed);


	}
	
	
}