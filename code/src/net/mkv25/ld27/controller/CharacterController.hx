package net.mkv25.ld27.controller;

import net.mkv25.ld27.enums.EquipmentEnum;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.enums.ValueTypeEnum;
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
import net.mkv25.ld27.model.OptionVO;
import net.mkv25.ld27.ui.CharacterUI;

class CharacterController 
{
	public var characters:Array<CharacterVO>;
	public var selectedCharacter:CharacterVO;
	public var eventLog:Array<String>;
	
	public var turn:Int = 0;
	public var aiTurnPosition:Int = 0;
	
	var eventbus:EventBus;
	
	public function new() 
	{
		characters = new Array<CharacterVO>();
		selectedCharacter = null;
		eventLog = new Array<String>();
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
		
		eventbus.requestBeginGame.add(onGameReset);
		eventbus.requestStartGameWithCharacter.add(onCharacterSelected);
		eventbus.requestNextTurn.add(onTurnAdvance);
	}
	
	public function addCharacter(character:CharacterVO):CharacterVO
	{
		characters.push(character);
		
		character.reset();
		
		return character;
	}
	
	function nextTurn():Void
	{
		turn++;
		aiTurnPosition++;
		
		// skip an extra step to prevent player being selected as AI
		if (getAiCharacter() == selectedCharacter)
		{
			aiTurnPosition++;
		}
		
		eventbus.readyForNextTurn.dispatch(this);
	}
	
	public function getAiCharacter():CharacterVO
	{
		var charIndex:Int = Lambda.indexOf(characters, selectedCharacter);
		var index:Int = (aiTurnPosition + charIndex + Math.round(characters.length / 2)) % characters.length;
		
		var ai = characters[index];
		
		return ai;
	}
	
	function onGameReset(e):Void
	{
		for (character in characters)
		{
			character.reset();
		}
		
		while (eventLog.length > 0)
			eventLog.pop();
		
		turn = 1;
		aiTurnPosition = 1;
	}
	
	function onCharacterSelected(character:CharacterVO)
	{
		selectedCharacter = character;
		eventbus.requestNextScreen.dispatch(this);
	}
	
	function onTurnAdvance(e):Void
	{
		nextTurn();
	}
	
	public function processOption(option:OptionVO):Void
	{	
		var player = selectedCharacter;
		var ai = getAiCharacter();
		
		var success:Bool = switch(option.compareType)
		{
			case ValueTypeEnum.Followers:
				(player.followers > ai.followers);
			case ValueTypeEnum.Gold:
				(player.gold > ai.gold);
			case ValueTypeEnum.Land:
				(player.land > ai.land);
			case ValueTypeEnum.None:
				false;
		}
		
		if (success)
		{
			switch(option.rewardType)
			{
				case ValueTypeEnum.Followers:
					player.followers += option.rewardAmount;
				case ValueTypeEnum.Gold:
					player.gold += option.rewardAmount;
				case ValueTypeEnum.Land:
					player.land += option.rewardAmount;
				case ValueTypeEnum.None:
					// chill
			}
			
			if (option.equipmentBonus != null)
			{
				player.equipment.push(option.equipmentBonus);
			}
			
			eventLog.push(option.storyTextSuccess);
		}
		else
		{
			switch(option.punishType)
			{
				case ValueTypeEnum.Followers:
					player.followers += option.punishAmount;
				case ValueTypeEnum.Gold:
					player.gold += option.punishAmount;
				case ValueTypeEnum.Land:
					player.land += option.punishAmount;
				case ValueTypeEnum.None:
					// chill
			}
			
			eventLog.push(option.storyTextFail);
		}
	}
	
}