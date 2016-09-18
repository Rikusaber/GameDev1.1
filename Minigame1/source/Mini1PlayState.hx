package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;
import flixel.util.FlxTimer;
import flixel.system.FlxAssets.FlxGraphicAsset;


class Mini1PlayState extends FlxState
{
	var _player:PlayerMiniDodge;
	//var _enemies:Enemy;
	var _numEnemies:Int = 5;
	var _score:FlxText;

	//make a group of enemies
	var _enemies = new FlxTypedGroup<Enemy>();
	var score:Float = 0;
	var courage:Float = 0;

	//time limit
	var countdown:Float = 90;


	override public function create():Void
	{
		var bg:FlxSprite = new FlxSprite(0,0);
		bg.loadGraphic("assets/images/mouthbg.png");
		_player = new PlayerMiniDodge();
		add(bg);
		add(_player);
		add(_enemies);

		for (i in 0..._numEnemies) 
		{
			spawnEnemy();
		}

		_player.scale.set(.5, .5);

		//keep track of score
		_score = new FlxText(10,10);
		add(_score);
		updateScore();

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		FlxG.overlap(_player, _enemies, onCollision);
		updateScore();

		//add courage for time elapsed
		endScene();
		super.update(elapsed);
	}

	function spawnEnemy():Void
	{
		var enemy:Enemy = new Enemy();
		enemy.x = FlxG.random.float(0.0, FlxG.width);
		enemy.y = 0;
		enemy.scale.set(FlxG.random.float(0.5, 0.8), FlxG.random.float(0.8,1));
		_enemies.add(enemy);
	}

	function onCollision(_player:FlxSprite, enemies:Enemy):Void
	{
		//if colliding and both exist 
		if (enemies.exists && _player.exists) 
		{
			enemies.kill(); //destroy enemy
			score -= 10;
			if (score <= -20)
			{
				//return to hub
				//FlxG.switchState(new MyState());
				//super.destroy();
			}
		}
	}

	function updateScore():Void
	{
		_score.text = "Score: " + score;
	}

	function endScene():Void
	{
		countdown -= FlxG.elapsed;
		if (countdown <= 0) 
		{
			//return to hub
			//FlxG.switchState(new MyState());
			super.destroy();
		}
	}
}
