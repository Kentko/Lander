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
		angle = FlxRandom.floatRanged( -110, -70);
		
		maxVelocity.set(150, 150);
		acceleration.y = 25;
		velocity.set( 0, 0);
		
		
	}
	
	override public function update():Void
	{
		angularVelocity = 0;
		animation.frameIndex = 0;
		
		if (FlxG.keys.anyPressed(["A", "LEFT"]))
		{
			angularVelocity -= 40;
		}

		if (FlxG.keys.anyPressed(["D", "RIGHT"]))
		{
			angularVelocity += 40;
		}
		
		acceleration.set(0, 25);
		
		if (FlxG.keys.anyPressed(["W", "UP"]))
		{
			//show sprite with thrust graphic
			animation.frameIndex = 1;
			
			FlxAngle.rotatePoint(18, 0, 0, 0, angle, acceleration);
			
		}
		
		FlxSpriteUtil.screenWrap(this);
		
		super.update();
	}
}