package net.mkv25.ld27.screens;
import motion.Actuate;
import motion.easing.Linear;
import net.mkv25.ld27.core.Text;
import net.mkv25.ld27.model.CharacterVO;
import net.mkv25.ld27.model.OptionVO;
import net.mkv25.ld27.ui.ButtonUI;
import net.mkv25.ld27.ui.CharacterUI;
import nme.text.TextField;
import nme.text.TextFormatAlign;

class ConversationScreen extends Screen
{
	var firstShow:Bool;

	var playerGoldText:TextField;
	var playerLandText:TextField;
	var playerFollowersText:TextField;
	
	var aiGoldText:TextField;
	var aiLandText:TextField;
	var aiFollowersText:TextField;
	
	var playerSpeechText:TextField;
	var aiSpeechText:TextField;
	
	var timeRemainingText:TextField;
	var timeRemaining:Float;
	var ignoreTimer:Bool;
	
	var playerCharacterUI:CharacterUI;
	var aiCharacterUI:CharacterUI;
	var playerNameText:TextField;
	var aiNameText:TextField;
	
	var optionButtons:Array<ButtonUI>;
	var ignoreOption:Bool;
	
	public function new() 
	{
		super();
		
		playerGoldText = Text.makeTextField("fonts/gabriola.ttf", 36, 0x2E2724, TextFormatAlign.LEFT);
		playerLandText = Text.makeTextField("fonts/gabriola.ttf", 36, 0x2E2724, TextFormatAlign.LEFT);
		playerFollowersText = Text.makeTextField("fonts/gabriola.ttf", 36, 0x2E2724, TextFormatAlign.RIGHT);
		
		aiGoldText = Text.makeTextField("fonts/gabriola.ttf", 32, 0x2E2724, TextFormatAlign.CENTER);
		aiLandText = Text.makeTextField("fonts/gabriola.ttf", 32, 0x2E2724, TextFormatAlign.CENTER);
		aiFollowersText = Text.makeTextField("fonts/gabriola.ttf", 32, 0x2E2724, TextFormatAlign.CENTER);
		
		playerSpeechText = Text.makeTextField("fonts/gabriola.ttf", 32, 0x2E2724, TextFormatAlign.LEFT);
		aiSpeechText = Text.makeTextField("fonts/gabriola.ttf", 32, 0x2E2724, TextFormatAlign.RIGHT);
		
		timeRemainingText = Text.makeTextField("fonts/lucon.ttf", 38, 0x010101, TextFormatAlign.CENTER);
		timeRemaining = 0;
		ignoreTimer = false;
		
		playerCharacterUI = new CharacterUI();
		aiCharacterUI = new CharacterUI();
		playerNameText = Text.makeTextField("fonts/gabriola.ttf", 32, 0x2E2724, TextFormatAlign.CENTER);
		aiNameText = Text.makeTextField("fonts/gabriola.ttf", 32, 0x2E2724, TextFormatAlign.CENTER);
		
		optionButtons = new Array<ButtonUI>();
		for (i in 0...4)
		{
			var button = new ButtonUI();
			button.setup("Option " + (i + 1), null);
			optionButtons.push(button);
		}
	}
	
	override function postSetup():Void 
	{		
		setBackground("img/screen_conversation_background.png");
		
		artwork.addChild(playerCharacterUI.artwork);
		artwork.addChild(aiCharacterUI.artwork);
		
		eventbus.requestBeginGame.add(onGameReset);
		eventbus.readyForNextTurn.add(onReadyForNextTurn);
	}
	
	override public function show():Void 
	{
		if (firstShow)
		{
			super.show();
			firstShow = false;
		}
		
		var player:CharacterVO = characterController.selectedCharacter;
		var ai:CharacterVO = characterController.getAiCharacter();
		
		setupTextField(playerGoldText, 120, 3, formatThousands(player.gold));
		setupTextField(playerLandText, 440, 3, formatThousands(player.land));
		setupTextField(playerFollowersText, 605, 3, formatThousands(player.followers));
		
		setupTextField(aiLandText, 613, 390, formatThousands(player.startingLand), 60);
		setupTextField(aiFollowersText, 676, 390, formatThousands(player.startingFollowers), 60);
		setupTextField(aiGoldText, 734, 390, formatThousands(player.startingGold), 60);
		
		setupTextField(playerSpeechText, 208, 85, player.speech2, 390, 80);
		setupTextField(aiSpeechText, 597, 171, ai.speech1, 390, 80);
		
		setupTextField(timeRemainingText, 121, 380, "!!!", 100, 80);
		
		playerCharacterUI.setup(player);
		playerCharacterUI.artwork.x = 130;
		playerCharacterUI.artwork.y = 193;
		playerCharacterUI.artwork.scaleX = playerCharacterUI.artwork.scaleY = 0.5;
		
		aiCharacterUI.setup(ai);
		aiCharacterUI.artwork.x = 900; // offscreen
		aiCharacterUI.artwork.y = 193;
		aiCharacterUI.artwork.scaleX = aiCharacterUI.artwork.scaleY = 0.5;
		Actuate.tween(aiCharacterUI.artwork, 0.5, { x: 680 } ).delay(0.1);
		
		setupTextField(playerNameText, 130, 310, player.name, 120, 30);
		setupTextField(aiNameText, 680, 310, ai.name, 120, 30);
		
		var c:Int = 0;
		for (button in optionButtons)
		{
			button.artwork.mouseEnabled = false;
			button.artwork.mouseChildren = false;
			
			button.artwork.x = 400;
			button.artwork.y = 550; // offscreen
			button.artwork.alpha = 0.7;
			artwork.addChild(button.artwork);
			
			var targetY:Int = 460 - (55 * c);
			Actuate.tween(button.artwork, 0.5, { y: targetY, alpha: 0.7 } ).delay(0.5 - 0.1 * c);
			
			var option:OptionVO = ai.options[c];
			button.setup(option.text, onOptionButtonSelected);
			
			c++;
		}
		
		ignoreOption = true;
		Actuate.tween(timeRemainingText, 0.05, { alpha: 0.0 } ).repeat(7).reflect(true).delay(0.15).onComplete(startTimer);
	}
	
	function startTimer()
	{
		ignoreTimer = false;
		ignoreOption = false;
		Actuate.tween(this, timeRemaining, { timeRemaining: 0 } ).ease(Linear.easeNone).onUpdate(onTimerUpdate).onComplete(onTimerComplete);
		
		for (button in optionButtons)
		{
			button.artwork.alpha = 1.0;
			button.artwork.mouseEnabled = true;
			button.artwork.mouseChildren = true;
		}
	}
	
	function stopTimer()
	{
		ignoreTimer = true;
		Actuate.stop(this);
	}
	
	function onTimerUpdate():Void
	{
		if (ignoreTimer)
			return;
			
		var label = Math.floor(timeRemaining * 10) / 10 + "";
		if (label.length < 3)
			label = label + ".0";
		timeRemainingText.text = label;
	}
	
	function onTimerComplete()
	{
		if (ignoreTimer)
			return;
			
		ignoreOption = true;
		for (item in optionButtons)
		{
			// hide all options
			Actuate.tween(item.artwork, 0.2, { alpha: 0.0 } );
		}
			
		Actuate.tween(timeRemainingText, 0.05, { alpha: 0.0 } ).repeat(7).reflect(true).delay(0.15).onComplete(onTimerEndComplete);
	}
	
	function onTimerEndComplete()
	{
		// "game over"
		eventbus.requestNextScreen.dispatch(this);
	}
	
	function onOptionButtonSelected(button:ButtonUI)
	{
		if (ignoreOption)
			return;
			
		if (ignoreTimer)
			return;
			
		ignoreOption = true;
		stopTimer();
		
		var optionIndex = Lambda.indexOf(optionButtons, button);
		
		// flash the timer text
		Actuate.tween(timeRemainingText, 0.05, { alpha: 0.0 } ).repeat(7).reflect(true).delay(0.15).onComplete(onOptionSelectedEndComplete, [optionIndex]);
		
		for (item in optionButtons)
		{
			item.artwork.mouseEnabled = false;
			item.artwork.mouseChildren = false;
			
			if (item == button)
			{
				// flash the option
				Actuate.tween(item.artwork, 0.02, { alpha: 0.3 } ).repeat(5).reflect(true).delay(0.05);
			}
			else
			{
				// hide the other options
				Actuate.tween(item.artwork, 0.2, { alpha: 0.0 } );
			}
		}
	}
	
	function onOptionSelectedEndComplete(optionIndex:Int)
	{
		// Get the ai option and process it
		var ai = characterController.getAiCharacter();
		var option:OptionVO = ai.options[optionIndex];
		characterController.processOption(option);
		
		// Move on to the next turn
		if (characterController.turn >= 18)
		{
			// End the game now
			eventbus.requestNextScreen.dispatch(this);
		}
		else
		{
			// Next turn!
			eventbus.requestNextTurn.dispatch(this);
		}
	}
	
	function onGameReset(e)
	{
		firstShow = true;
		timeRemaining = 10.0;
	}
	
	function onReadyForNextTurn(e)
	{
		show();
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