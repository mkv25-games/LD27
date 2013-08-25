package net.mkv25.ld27.screens;
import net.mkv25.ld27.ui.ButtonUI;

class EventLogScreen extends Screen
{
	var playAgainButton:ButtonUI;
	
	public function new() 
	{
		super();
	}
	
	override function postSetup():Void 
	{
		setBackground("img/screen_eventlog_background.png");
		
		playAgainButton = new ButtonUI();
		playAgainButton.setup("Begin a new Adventure", eventbus.requestBeginGame.dispatch);
		playAgainButton.artwork.x = 650;
		playAgainButton.artwork.y = 470;
		
		artwork.addChild(playAgainButton.artwork);
	}
}