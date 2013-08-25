package net.mkv25.ld27.controller;
import net.mkv25.ld27.core.Signal;

class EventBus 
{
	public var requestBeginGame:Signal;
	public var requestNextScreen:Signal;
	public var requestStartGameWithCharacter:Signal;
	public var requestNextTurn:Signal;
	public var readyForNextTurn:Signal;
	
	public function new() 
	{
		requestBeginGame = new Signal();
		requestNextScreen = new Signal();
		requestStartGameWithCharacter = new Signal();
		requestNextTurn = new Signal();
		readyForNextTurn = new Signal();
	}
	
}