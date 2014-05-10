package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxAngle;
import flixel.util.FlxColor;
import flixel.util.FlxMath;
import flixel.util.FlxRandom;
import flixel.util.FlxSpriteUtil;

/**
 * ...
 * @author Kentko
 */
class Ship extends FlxSprite
{	
	public var fuel:Int;
	
	public function new(X:Float, Y:Float) 
	{
		super(X, Y);
		
		loadGraphic("assets/images/lander_16.png", true, 16, 16);
		
		// set starting orientation of ship to a random almost vertical angle
		angle = FlxRandom.floatRanged( -110, -70);
		
		maxVelocity.set(150, 150);
		acceleration.y = 25;
		velocity.set( 0, 20);
		
		fuel = 1000;
		
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
		
		if (FlxG.keys.anyPressed(["W", "UP"]) && (fuel > 0))
		{	
			fuel -= 1;
			//show sprite with thrust graphic
			animation.frameIndex = 1;
			
			FlxAngle.rotatePoint(18, 0, 0, 0, angle, acceleration);
		}
		
		FlxSpriteUtil.screenWrap(this);
		
		super.update();
	}
}