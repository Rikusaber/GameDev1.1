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
	var _numEnemies:Int = 5;
	var _numBoosts:Int = 3;
	var _score:FlxText;

	//keep track of courage and stuff
	static public var courage:Float = 0.0;
    static public var maxCourage:Float = 0.0;

	//make a group of enemies
	var _enemies = new FlxTypedGroup<Enemy>();
	var _boosts = new FlxTypedGroup<Boosts>();
	var score:Float = 0;

	//time limit
	var countdown:Float = 90;

	override public function create():Void
	{
		maxCourage +=  _numBoosts;
		var bg:FlxSprite = new FlxSprite(0,0);
		var health:FlxSprite = new FlxSprite(0,0);
		health.loadGraphic("assets/images/health.png");
		bg.loadGraphic("assets/images/mouthbg.png");
		_player = new PlayerMiniDodge();
		add(bg);
		add(_player);
		add(_enemies);
		add(_boosts);
		add(health);

		for (i in 0..._numEnemies) 
		{
			spawnEnemy();
		}

		for (i in 0..._numBoosts) 
		{
			spawnBoosts();
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
		FlxG.overlap(_player, _boosts, onCollision2);
		updateScore();

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

	function spawnBoosts():Void
	{
		var boost:Boosts = new Boosts();
		boost.x = FlxG.random.float(0.0, FlxG.width);
		boost.y = 0;
		boost.scale.set(FlxG.random.float(0.5, 0.8), FlxG.random.float(0.8,1));
		_boosts.add(boost);
	}

	function onCollision(_player:FlxSprite, enemies:Enemy):Void
	{
		//if colliding and both exist 
		if (enemies.exists && _player.exists) 
		{
			enemies.kill(); //destroy enemy
			score -= 10;
			courage -= 1;
			if (score <= -20)
			{
				//return to hub
				//maxCourage +=  _numBoosts + countdown;
				//courage += countdown;
				FlxG.switchState(new EndScreen());
			}
		}
	}

	function onCollision2(_player:FlxSprite, boosts:Boosts):Void
	{
		//if colliding and both exist 
		if (boosts.exists && _player.exists) 
		{
			boosts.kill(); //destroy teeth
			score += 10;
			courage += 1;
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
			//maxCourage +=  _numBoosts + countdown;
			//courage += countdown;
			FlxG.switchState(new EndScreen());
		}
	}
}