package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		add(new FlxText(FlxG.width / 3, FlxG.height / 2, 100, "Lander", 22));
		add(new FlxText(FlxG.width / 3, FlxG.height / 2 +40, 300, "Press spacebar to continue", 12));
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
		if (FlxG.keys.anyPressed(["SPACE"]))
		{
			FlxG.switchState(new PlayState());
		}
		super.update();
	}	
}