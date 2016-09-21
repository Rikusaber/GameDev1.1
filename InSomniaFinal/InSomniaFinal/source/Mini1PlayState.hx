package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;
import flixel.util.FlxTimer;
import flixel.tile.FlxTilemap;
import openfl.Assets;
import flixel.system.FlxAssets.FlxGraphicAsset;


class Mini1PlayState extends FlxState
{
	var _player:PlayerMiniDodge;
	var _numEnemies:Int = 20;
	var _numBoosts:Int = 12;
	var _score:FlxText;
	var _timer:FlxText;
	var _inst:FlxText;

	//keep track of courage and stuff
	//static public var courage:Float = 0.0;
    //static public var maxCourage:Float = 0.0;

	//make a group of enemies
	var _enemies = new FlxTypedGroup<Enemy>();
	var _boosts = new FlxTypedGroup<Boosts>();
	var score:Float = 0;

	//time limit
	var countdown:Float = 90;


	override public function create():Void
	{

		var bg:FlxSprite = new FlxSprite(0,0);
		bg.loadGraphic("assets/images/mouthbg.png");
		_player = new PlayerMiniDodge();
		_player.width = 24;
		_player.height = 36;
		_player.origin.set(-16,0);
		add(bg);
		add(_player);
		add(_enemies);
		add(_boosts);
		for (i in 0...4) 
		{
			spawnEnemy();
		}

		for (i in 0...3) 
		{
			spawnBoosts();
		}
		
		_player.scale.set(.5, .5);

		//keep track of score
		_score = new FlxText(10, 10);
		_score.screenCenter();
		_score.y = 10;
		_timer = new FlxText(FlxG.width - 110, 10);
		add(_score);
		add(_timer);
		updateScore();
		
		_inst = new FlxText(10, 10);
		
		_inst.scrollFactor.set(0, 0);
		_inst.text = "Collect the White Teeth\nAvoid the Yellow Teeth";
		add(_inst);
		
		

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		countdown -= FlxG.elapsed;
		_timer.text = "Time reminaing: " + Std.int(countdown);
		//spawn more enemies
		if (_boosts.countLiving() == 0) 
		{
			contSpawn();
		}

		endScene();
		FlxG.overlap(_player, _enemies, onCollision);
		FlxG.overlap(_player, _boosts, onCollision2);
		updateScore();
		
		if (FlxG.keys.justPressed.ENTER){
            FlxG.fullscreen = !FlxG.fullscreen;
		}


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

	function contSpawn():Void
	{
		//if total spawned is not 32
		if ( (_boosts.countDead() + _enemies.countDead() != (_numEnemies + _numBoosts)) )
		{
			for (i in 0...4)
			{
				spawnEnemy();
			}
			for (i in 0...3)
			{
				spawnBoosts();
			}
		}
	}
	function onCollision(_player:FlxSprite, enemies:Enemy):Void
	{
		//if colliding and both exist 
		if (enemies.exists && _player.exists) 
		{
			enemies.kill(); //destroy enemy
			score -= 10;
			PlayState.courage -= 1;
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
			PlayState.courage += 1;
		}
	}


	function updateScore():Void
	{
		_score.text = "Score: " + score;
	}

	function endScene():Void
	{
		//this part is just for presentation purposes. press p to quickly end minigame
		if (FlxG.keys.justPressed.P){
            FlxG.switchState(new EndScreen());
		}
		
		if (countdown <= 0) 
		{
			//return to hub
			PlayState.maxCourage +=  _boosts.countDead();
			FlxG.switchState(new EndScreen());
		}
	}
}