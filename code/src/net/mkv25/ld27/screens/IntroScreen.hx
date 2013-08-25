package net.mkv25.ld27.screens;
import net.mkv25.ld27.controller.EventBus;
import net.mkv25.ld27.core.Signal;
import net.mkv25.ld27.ui.ButtonUI;

class IntroScreen extends Screen
{
	var beginButton:ButtonUI;
	
	public function new() 
	{
		super();
	}
	
	override function postSetup():Void 
	{
		setBackground("img/screen_intro_background.png");
		
		beginButton = new ButtonUI();
		beginButton.setup("Begin game", eventbus.requestBeginGame.dispatch);
		beginButton.artwork.x = 400;
		beginButton.artwork.y = 450;
		
		artwork.addChild(beginButton.artwork);
	}
}