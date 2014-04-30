package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.tweens.misc.NumTween;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var _lander:Ship;	
	private var _showVelocity:FlxText;
	private var _showAcceleration:FlxText;
	private var _showFuel:FlxText;
	
	private var _alphaTweener:NumTween;
	
	override public function create():Void
	{
		add(new FlxText(FlxG.width/4, FlxG.height - 20, 550, "W, up for thrust; A, D or right, left to rotate", 12));
		
		//create the lander
		_lander = new Ship(FlxG.width/2 -32, 25);
		add(_lander);
		
		
		_showAcceleration = new FlxText(2, 2, 175, "Acceleration: " + _lander.acceleration.x +", " + _lander.acceleration.y);
		_showAcceleration.setFormat(null, 12, FlxColor.WHITE, "left", FlxText.BORDER_NONE, FlxColor.BLACK);
		add(_showAcceleration);
		
		_showVelocity = new FlxText(2, 20, 175, "Velocity: " + _lander.velocity.x +", " + _lander.velocity.y);
		_showVelocity.setFormat(null, 12, FlxColor.WHITE, "left", FlxText.BORDER_NONE, FlxColor.BLACK);
		add(_showVelocity);
		
		_showFuel = new FlxText(2, 38, 175, "Fuel: " + _lander.fuel);
		_showFuel.setFormat(null, 12, FlxColor.WHITE, "left", FlxText.BORDER_NONE, FlxColor.BLACK);
		add(_showFuel);
		
		_alphaTweener = FlxTween.num(1.0, 0.5, .5, { ease: FlxEase.sineInOut, type: FlxTween.PINGPONG });
		
		
		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		if (FlxG.keys.anyPressed(["ESCAPE"]))
		{
			FlxG.switchState(new MenuState());
		}		
		
		_showAcceleration.text = "Acceleration: " + Math.floor(_lander.acceleration.x) +", " + Math.floor(_lander.acceleration.y);		
		_showVelocity.text = "Velocity: " + Math.floor(_lander.velocity.x) +", " + Math.floor(_lander.velocity.y);
		_showFuel.text = "Fuel: " + _lander.fuel;
		
		// Make fuel text red and tween the alpha so it flashes to alert player to low fuel
		if (_lander.fuel < 250)
		{
			_showFuel.color = 0xFFFF6262;
			_showFuel.alpha = _alphaTweener.value;
		}
		
		super.update();
	}
}