package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxAngle;
import flixel.util.FlxMath;
import flixel.util.FlxRandom;
import flixel.util.FlxSpriteUtil;

/**
 * ...
 * @author Kentko
 */
class Ship extends FlxSprite
{
	private var _thrust:Float = 0;

	public function new(X:Float, Y:Float) 
	{
		super(X, Y);
		
		loadGraphic("assets/images/ship.png", true, 32, 32);
		
		// set starting orientation of ship to random angle
		angle = FlxRandom.floatRanged( -180, 180);
		
	}
	
	override public function update():Void
	{
		angularVelocity = 0;
		animation.frameIndex = 0;
		
		if (FlxG.keys.anyPressed(["A", "LEFT"]))
		{
			angularVelocity -= 240;
		}

		if (FlxG.keys.anyPressed(["D", "RIGHT"]))
		{
			angularVelocity += 240;
		}
		
		if (FlxG.keys.anyPressed(["W", "UP"]))
		{
			//show sprite with thrust graphic
			animation.frameIndex = 1;
			
			//FlxAngle.rotatePoint(90, 0, 0, 0, angle, acceleration);
		}

		acceleration.set();
		
		FlxSpriteUtil.screenWrap(this);

		super.update();
	}
}