package net.mkv25.ld27.screens;
import net.mkv25.ld27.controller.CharacterController;
import net.mkv25.ld27.controller.EventBus;
import net.mkv25.ld27.model.CharacterVO;
import net.mkv25.ld27.ui.CharacterPickerUI;
import nme.display.Sprite;

class PickerScreen extends Screen
{	
	var topRow:Sprite;
	var bottomRow:Sprite;
	var characterPickers:Array<CharacterPickerUI>;
	
	var selectedCharacter:CharacterPickerUI;
	
	public function new() 
	{
		super();
		
		topRow = new Sprite();
		bottomRow = new Sprite();
		characterPickers = new Array<CharacterPickerUI>();
		
		setBackground("img/screen_picker_background.png");
	}
	
	override function postSetup():Void 
	{
		// clean up old set
		while (characterPickers.length > 0)
		{
			var picker = characterPickers.pop();
			picker.characterSelected.removeAll();
			artwork.removeChild(picker.artwork);
		}
		
		// generate new set
		for (character in characterController.characters)
		{
			var picker = new CharacterPickerUI();
			characterPickers.push(picker);
			artwork.addChild(picker.artwork);
			picker.characterSelected.add(onCharacterSelected);
			
			picker.setup(character);
		}
		
		// require exact amount
		if (characterController.characters.length != 10)
		{
			throw "Unexpected number of characters, needed exactly 10 for this UI";
			// don't like this behaviour? rewrite it.
		}
		
		var spaceToFill:Float = 600;
		
		// top row
		for (i in 0...5)
		{
			var picker = characterPickers[i];
			picker.artwork.x = (spaceToFill / 4 * i) - (spaceToFill / 2);
			topRow.addChild(picker.artwork);
		}
		topRow.x = 400;
		topRow.y = 100;
		artwork.addChild(topRow);
		
		// bottom row
		for (i in 0...5)
		{
			var picker = characterPickers[i + 5];
			picker.artwork.x = (spaceToFill / 4 * i) - (spaceToFill / 2);
			bottomRow.addChild(picker.artwork);
		}
		bottomRow.x = 400;
		bottomRow.y = 400;
		artwork.addChild(bottomRow);
	}
	
	function onCharacterSelected(character:CharacterVO):Void
	{
		eventbus.requestStartGameWithCharacter.dispatch(character);
	}
	
	
}