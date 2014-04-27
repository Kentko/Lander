package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	private var _lander:Ship;
	
	override public function create():Void
	{
		add(new FlxText(FlxG.width/4, FlxG.height - 20, 550, "W, up for thrust; A, D or right, left to rotate", 12));
		
		//create the lander
		_lander = new Ship(FlxG.width/2 -32, 25);
		add(_lander);
		
		
		
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
		
		
		super.update();
	}	
}