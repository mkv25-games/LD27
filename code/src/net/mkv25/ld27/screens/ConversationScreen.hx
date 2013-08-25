package net.mkv25.ld27.screens;
import motion.Actuate;
import motion.easing.Linear;
import net.mkv25.ld27.core.Text;
import net.mkv25.ld27.model.CharacterVO;
import net.mkv25.ld27.ui.CharacterUI;
import nme.text.TextField;
import nme.text.TextFormatAlign;

class ConversationScreen extends Screen
{

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
	}
	
	override function postSetup():Void 
	{		
		setBackground("img/screen_conversation_background.png");
		
		artwork.addChild(playerCharacterUI.artwork);
		artwork.addChild(aiCharacterUI.artwork);
	}
	
	override public function show():Void 
	{
		super.show();
		
		var player:CharacterVO = characterController.selectedCharacter;
		var ai:CharacterVO = characterController.selectedCharacter;
		
		setupTextField(playerGoldText, 120, 3, formatThousands(player.gold));
		setupTextField(playerLandText, 440, 3, formatThousands(player.land));
		setupTextField(playerFollowersText, 605, 3, formatThousands(player.followers));
		
		setupTextField(aiGoldText, 613, 390, formatThousands(player.startingGold), 60);
		setupTextField(aiLandText, 676, 390, formatThousands(player.startingLand), 60);
		setupTextField(aiFollowersText, 734, 390, formatThousands(player.startingFollowers), 60);
		
		setupTextField(playerSpeechText, 208, 85, "Hail, friend or foe?\nA challenger no less.", 390, 80);
		setupTextField(aiSpeechText, 597, 171, "What havest we here lo, a fiend?\nA beast? Perhaps a dolt.", 390, 80);
		
		setupTextField(timeRemainingText, 121, 380, "!!!", 100, 80);
		
		playerCharacterUI.setup(player);
		playerCharacterUI.artwork.x = 130;
		playerCharacterUI.artwork.y = 193;
		playerCharacterUI.artwork.scaleX = playerCharacterUI.artwork.scaleY = 0.5;
		
		aiCharacterUI.setup(ai);
		aiCharacterUI.artwork.x = 680;
		aiCharacterUI.artwork.y = 193;
		aiCharacterUI.artwork.scaleX = aiCharacterUI.artwork.scaleY = 0.5;
		
		setupTextField(playerNameText, 130, 310, player.name, 120, 30);
		setupTextField(aiNameText, 680, 310, ai.name, 120, 30);
		
		Actuate.tween(timeRemainingText, 0.05, { alpha: 0.0 } ).repeat(7).reflect(true).delay(0.15).onComplete(startTimer);
	}
	
	function startTimer()
	{
		ignoreTimer = false;
		timeRemaining = 10.0;
		Actuate.tween(this, 10.0, { timeRemaining: 0 } ).ease(Linear.easeNone).onUpdate(onTimerUpdate).onComplete(onTimerComplete);
	}
	
	function stopTimer()
	{
		ignoreTimer = true;
		Actuate.stop(this);
		timeRemainingText.text = "?";
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
			
		Actuate.tween(timeRemainingText, 0.05, { alpha: 0.0 } ).repeat(7).reflect(true).delay(0.15);
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