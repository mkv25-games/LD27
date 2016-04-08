package net.mkv25.ld27.controller;

import net.mkv25.ld27.screens.ConversationScreen;
import net.mkv25.ld27.screens.EventLogScreen;
import net.mkv25.ld27.screens.IntroScreen;
import net.mkv25.ld27.screens.PickerScreen;
import net.mkv25.ld27.screens.Screen;
import openfl.display.Sprite;
import openfl.display.Stage;

class ScreenController 
{
	var stage:Stage;
	var eventbus:EventBus;
	var characterController:CharacterController;
	
	var screens:Array<Screen>;
	var currentScreen:Screen;
	
	public function new() 
	{
		stage = null;
		eventbus = null;
		
		screens = new Array<Screen>();
		currentScreen = null;
	}
	
	public function setup(stage:Stage, eventbus:EventBus, characterController:CharacterController):Void
	{
		this.stage = stage;
		this.eventbus = eventbus;
		this.characterController = characterController;
		
		while (screens.length > 0)
			screens.pop();
		
		addScreen(new IntroScreen());
		addScreen(new PickerScreen());
		addScreen(new ConversationScreen());
		addScreen(new EventLogScreen());
		
		eventbus.requestBeginGame.add(onRequestBeginGame);
		eventbus.requestNextScreen.add(onRequestNextScreen);
		
		showScreen(screens[0]);
	}
	
	function onRequestBeginGame(model:Dynamic)
	{
		showScreen(screens[1]);
	}
	
	function onRequestNextScreen(model:Dynamic)
	{
		showNextScreen();
	}
	
	public function addScreen(screen:Screen):Screen
	{
		screens.push(screen);
		screen.setup(eventbus, characterController);
		
		return screen;
	}
	
	public function showScreen(screen:Screen):Void
	{
		if (currentScreen != null)
			stage.removeChild(currentScreen.artwork);
			
		stage.addChild(screen.artwork);
		screen.show();
		
		currentScreen = screen;
	}
	
	public function showNextScreen():Void
	{
		var i = Lambda.indexOf(screens, currentScreen);
		i++;
		if (i >= screens.length)
			i = 0;
			
		showScreen(screens[i]);
	}
}