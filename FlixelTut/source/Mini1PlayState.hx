package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;


class Mini1PlayState extends FlxState
{
	var _player:PlayerMiniDodge;
	//var _enemies:Enemy;
	var _numEnemies:Int = 50;
	var _score:FlxText;
	//make a group of enemies
	var _enemies = new FlxTypedGroup<Enemy>();

	var score:Float = 0;
	
	//time limit

	override public function create():Void
	{
		_player = new PlayerMiniDodge();
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
		super.update(elapsed);
		
		if (FlxG.keys.justPressed.SPACE){
            FlxG.switchState(new PlayState());
		}
		if (score == 320)
		{
			FlxG.switchState(new PlayState());
		}
		
	}

	function spawnEnemy():Void
	{
		var enemy:Enemy = new Enemy();
		enemy.x = FlxG.random.float(0.0, FlxG.width);
		enemy.y = 0;
		enemy.scale.set(FlxG.random.float(0.5,1), FlxG.random.float(0.8,1));
		_enemies.add(enemy);
	}

	function onCollision(_player:FlxSprite, enemies:Enemy):Void
	{
		//if colliding and both exist 
		if (enemies.exists && _player.exists) 
		{
			enemies.kill(); //destroy enemy
			score += 10;
		}
	}

	function updateScore():Void
	{
		_score.text = "Score: " + score;
	}


}