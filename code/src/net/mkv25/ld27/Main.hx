package net.mkv25.ld27;

import net.mkv25.ld27.controller.EventBus;
import net.mkv25.ld27.controller.ScreenController;
import nme.display.Sprite;
import nme.display.Stage;
import nme.events.Event;
import nme.Lib;

class Main extends Sprite 
{
	public var eventbus:EventBus;
	public var screenController:ScreenController;
	
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
		
		// dependency injection
		screenController.setup(stage, eventbus);
	}
	
	static public function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		stage.align = nme.display.StageAlign.TOP_LEFT;
		
		Lib.current.addChild(new Main());
	}
	
}
