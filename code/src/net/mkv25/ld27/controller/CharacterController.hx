package net.mkv25.ld27.controller;

import net.mkv25.ld27.model.characters.FemaleHealer;
import net.mkv25.ld27.model.characters.FemaleLandOwner;
import net.mkv25.ld27.model.characters.FemaleMerchant;
import net.mkv25.ld27.model.characters.FemaleMidwife;
import net.mkv25.ld27.model.characters.FemalePriest;
import net.mkv25.ld27.model.characters.MaleHealer;
import net.mkv25.ld27.model.characters.MaleLandOwner;
import net.mkv25.ld27.model.characters.MaleMerchant;
import net.mkv25.ld27.model.characters.MalePriest;
import net.mkv25.ld27.model.characters.MaleWiseMan;
import net.mkv25.ld27.model.CharacterVO;
import net.mkv25.ld27.ui.CharacterUI;

class CharacterController 
{
	public var characters:List<CharacterVO>;
	public var selectedCharacter:CharacterVO;
	
	var eventbus:EventBus;
	
	public function new() 
	{
		characters = new List<CharacterVO>();
	}
	
	public function setup(eventbus:EventBus):Void
	{
		this.eventbus = eventbus;
		
		addCharacter(new FemaleHealer());
		addCharacter(new FemalePriest());
		addCharacter(new FemaleMerchant());
		addCharacter(new FemaleLandOwner());
		addCharacter(new FemaleMidwife());
		addCharacter(new MaleWiseMan());
		addCharacter(new MaleLandOwner());
		addCharacter(new MaleMerchant());
		addCharacter(new MalePriest());
		addCharacter(new MaleHealer());
		
		eventbus.requestStartGameWithCharacter.add(onCharacterSelected);
	}
	
	public function addCharacter(character:CharacterVO):CharacterVO
	{
		characters.add(character);
		
		character.reset();
		
		return character;
	}
	
	function onCharacterSelected(character:CharacterVO)
	{
		selectedCharacter = character;
		eventbus.requestNextScreen.dispatch(this);
	}
	
}