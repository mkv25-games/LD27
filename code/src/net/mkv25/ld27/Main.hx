package net.mkv25.ld27;

import net.mkv25.ld27.controller.CharacterController;
import net.mkv25.ld27.controller.EventBus;
import net.mkv25.ld27.controller.ScreenController;
import openfl.display.Sprite;
import openfl.display.Stage;
import openfl.events.Event;
import openfl.Lib;

class Main extends Sprite
{
	public var eventbus:EventBus;
	public var screenController:ScreenController;
	public var characterController:CharacterController;

	public function new()
	{
		super();
		#if iphone
		Lib.current.stage.addEventListener(Event.RESIZE, init);
		#else
		addEventListener(Event.ADDED_TO_STAGE, init);
		#end
	}

	private function init(e)
	{
		// initialise objects
		eventbus = new EventBus();
		screenController = new ScreenController();
		characterController = new CharacterController();

		// dependency injection
		characterController.setup(eventbus);
		screenController.setup(stage, eventbus, characterController);
	}

	static public function main()
	{
		var stage = Lib.current.stage;
		stage.scaleMode = openfl.display.StageScaleMode.NO_SCALE;
		stage.align = openfl.display.StageAlign.TOP_LEFT;

		Lib.current.addChild(new Main());
	}

}
