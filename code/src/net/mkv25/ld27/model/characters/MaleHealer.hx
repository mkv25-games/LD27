package net.mkv25.ld27.model.characters;

import net.mkv25.ld27.enums.BodyTypeEnum;
import net.mkv25.ld27.enums.EquipmentEnum;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.enums.ValueTypeEnum;
import net.mkv25.ld27.model.CharacterVO;
import net.mkv25.ld27.model.OptionVO;

class MaleHealer extends CharacterVO
{
	public function new() 
	{
		super();
		
		name = "Healer";
		gender = GenderEnum.Male;
		bodyType = BodyTypeEnum.MaleHealer;
		
		startingGold = 10;
		startingFollowers = 100;
		startingLand = 2;
		
		createOptions();
	}	
	
	override private function createOptions():Dynamic 
	{
		speech1 = "Death, decay, rot. Let me\n assail these things for you.";
		speech2 = "There's a bad smell around here!\n Do you require my services?";
		
		options = new Array<OptionVO>();
		options.push(new OptionVO("Reject the " + name, ValueTypeEnum.Followers, ValueTypeEnum.Gold, 10, ValueTypeEnum.Gold, -10, null,
			"Your people herded the " + name + " away, and earnt coin instead.",
			"Your people grew ill and unproductive, hounded by the " + name + "'s followers."
		));
		
		options.push(new OptionVO("Welcome the " + name, ValueTypeEnum.Gold, ValueTypeEnum.Followers, 20, ValueTypeEnum.Gold, -10, null,
			"The " + name + " was welcomed in, healing your people, gaining you more followers.",
			"Your people grew ill and unproductive, unable to pay the " + name + "'s fees."
		));
		
		options.push(new OptionVO("Provide Land", ValueTypeEnum.Land, ValueTypeEnum.Followers, 20, ValueTypeEnum.None, 0, null,
			"The " + name + " sets up on your land, bringing followers from far and wide.",
			"The " + name + " has no need for your offer of land."
		));
		
		options.push(new OptionVO("Hire their Services", ValueTypeEnum.Gold, ValueTypeEnum.Followers, 20, ValueTypeEnum.None, 0, null,
			"The " + name + ", under your employment, educates and expands your following.",
			"The " + name + " has no interest in your lousy finances."
		));
	}
}