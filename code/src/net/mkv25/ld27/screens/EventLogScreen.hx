package net.mkv25.ld27.screens;

class EventLogScreen extends Screen
{
	public function new() 
	{
		super();
	}
	
	override function postSetup():Void 
	{
		setBackground("img/screen_eventlog_background.png");
	}
}