package net.mkv25.ld27.screens;

import net.mkv25.ld27.core.Text;
import net.mkv25.ld27.ui.ButtonUI;
import net.mkv25.ld27.ui.CharacterUI;
import openfl.text.TextFormatAlign;
import openfl.text.TextField;

class EventLogScreen extends Screen
{
	var playAgainButton:ButtonUI;
	var bigStoryBox:TextField;
	
	var playerGoldText:TextField;
	var playerLandText:TextField;
	var playerFollowersText:TextField;
	
	var playerCharacterUI:CharacterUI;
	
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
		
		bigStoryBox = Text.makeTextField("fonts/gabriola.ttf", 22, 0x2E2724, TextFormatAlign.JUSTIFY);
		bigStoryBox.width = 560;
		bigStoryBox.height = 430;
		bigStoryBox.x = 10;
		bigStoryBox.y = 70;
		bigStoryBox.text = characterController.eventLog.join(" ");
		
		playerGoldText = Text.makeTextField("fonts/gabriola.ttf", 32, 0x2E2724, TextFormatAlign.CENTER);
		playerLandText = Text.makeTextField("fonts/gabriola.ttf", 32, 0x2E2724, TextFormatAlign.CENTER);
		playerFollowersText = Text.makeTextField("fonts/gabriola.ttf", 32, 0x2E2724, TextFormatAlign.CENTER);
		
		playerCharacterUI = new CharacterUI();
		
		artwork.addChild(bigStoryBox);
		artwork.addChild(playerCharacterUI.artwork);
		artwork.addChild(playAgainButton.artwork);
	}
	
	override public function show():Void 
	{
		super.show();
		var player = characterController.selectedCharacter;
		
		bigStoryBox.text = "Once upon a time, a " + player.name + " ventured into the world. " + characterController.eventLog.join(" ") + " The end.";
		
		setupTextField(playerLandText, 608, 45, formatThousands(player.land), 80, 25);
		setupTextField(playerFollowersText, 688, 45, formatThousands(player.followers), 80, 25);
		setupTextField(playerGoldText, 758, 45, formatThousands(player.gold), 80, 25);
		
		playerCharacterUI.setup(player);
		playerCharacterUI.artwork.x = 689;
		playerCharacterUI.artwork.y = 220;
		playerCharacterUI.artwork.scaleX = playerCharacterUI.artwork.scaleY = 0.5;
	}
	
	function setupTextField(textField:TextField, x:Int, y:Int, label:String, width:Int=120, height:Int=25):TextField
	{
		artwork.addChild(textField);
		
		textField.x = x;
		textField.y = y;
		textField.text = label;
		textField.width = width;
		textField.height = height;
		
		textField.x = switch(textField.defaultTextFormat.align)
		{
			case TextFormatAlign.RIGHT:
				textField.x = x - width;
			case TextFormatAlign.CENTER:
				textField.x = x - Math.ceil(width / 2);
			default:
				x;
		}
		
		return textField;
	}
	
	function formatThousands(number:Float):String
	{
		var input = "" + number;
		var result = "";
		
		if (number < 1000)
			return input;
		
		var c:Int = 0;
		for (i in 0...input.length)
		{
			// every third character, add a "," symbol
			if (c == 3)
			{
				result = "," + result;
				c = 0;
			}
			
			// build the string in reverse
			result = (input.charAt(input.length - i - 1)) + result;
			c++;
		}
		
		return result;
	}
}