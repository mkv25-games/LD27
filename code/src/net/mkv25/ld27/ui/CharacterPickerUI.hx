package net.mkv25.ld27.ui;
import motion.Actuate;
import motion.easing.Bounce;
import motion.easing.Quad;
import net.mkv25.ld27.core.Signal;
import net.mkv25.ld27.core.Text;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.model.CharacterVO;
import nme.display.Sprite;
import nme.events.MouseEvent;
import nme.text.TextField;
import nme.text.TextFormatAlign;

class CharacterPickerUI 
{
	public var artwork:Sprite;
	public var characterSelected:Signal;
	
	var character:CharacterUI;
	var textField:TextField;
	
	public function new() 
	{
		artwork = new Sprite();
		characterSelected = new Signal();
		
		character = new CharacterUI();
		textField = Text.makeTextField("fonts/gabriola.ttf", 24, 0xDBD1D1, TextFormatAlign.CENTER);
		
		artwork.addEventListener(MouseEvent.CLICK, onMouseClick);
		artwork.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
		artwork.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
	}
	
	public function setup(characterModel:CharacterVO):Void
	{
		character.setup(characterModel);
		artwork.addChild(character.artwork);
		
		textField.text = characterModel.name;
		textField.x = - Math.ceil(textField.width / 2);
		textField.y = (characterModel.gender == GenderEnum.Female) ? - 90 : 60;
		artwork.addChild(textField);
		
		upState();
	}
	
	function upState()
	{
		Actuate.stop(character.artwork);
		character.artwork.scaleX = character.artwork.scaleY = 0.25;
		character.artwork.alpha = 0.5;
	}
	
	function overState()
	{
		Actuate.stop(character.artwork);
		character.artwork.scaleX = character.artwork.scaleY = 0.25;
		character.artwork.alpha = 1.0;
	}
	
	function onMouseClick(e)
	{
		Actuate.tween(character.artwork, 0.2, { scaleX: 0.2, scaleY: 0.2 } ).reflect().ease(Quad.easeIn).repeat(1).onComplete(onMouseClickComplete);
	}
	
	function onMouseClickComplete()
	{
		characterSelected.dispatch(character.model);
	}
	
	function onMouseOver(e)
	{
		overState();
	}
	
	function onMouseOut(e)
	{
		upState();
	}
	
}