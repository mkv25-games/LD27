package net.mkv25.ld27.model.characters;

import net.mkv25.ld27.enums.BodyTypeEnum;
import net.mkv25.ld27.enums.EquipmentEnum;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.enums.ValueTypeEnum;
import net.mkv25.ld27.model.CharacterVO;
import net.mkv25.ld27.model.OptionVO;

class FemaleHealer extends CharacterVO
{
	public function new() 
	{
		super();
		
		name = "Scientist";
		gender = GenderEnum.Female;
		bodyType = BodyTypeEnum.FemaleHealer;
		
		startingGold = 100;
		startingFollowers = 10;
		startingLand = 2;
		
		createOptions();
	}
	
	override private function createOptions() 
	{
		speech1 = "I bring science,\n let me build your knowledge!";
		speech2 = "My knowledge can bring coin,\n let me show you.";
		
		options = new Array<OptionVO>();
		options.push(new OptionVO("Reject the " + name, ValueTypeEnum.Followers, ValueTypeEnum.Gold, 10, ValueTypeEnum.Followers, -5, null,
			"The " + name + "'s values were rejected, and your followers rejoiced in coin.",
			"The " + name + "'s values were rejected, to your follower's dismay."
		));
		
		options.push(new OptionVO("Welcome the " + name, ValueTypeEnum.Followers, ValueTypeEnum.Gold, 20, ValueTypeEnum.Gold, -20, null,
			"The " + name + "'s ways were accepted, and your followers rejoiced in coin.",
			"The " + name + " took advantage of your people and fleeced them for gold."
		));
		
		options.push(new OptionVO("Provide Land", ValueTypeEnum.Land, ValueTypeEnum.Gold, 20, ValueTypeEnum.None, 0, null,
			"You provide the " + name + " with land and generated a fine income from their research.",
			"The " + name + " has no need for your offer of land."
		));
		
		options.push(new OptionVO("Hire their Services", ValueTypeEnum.Gold, ValueTypeEnum.Followers, 20, ValueTypeEnum.None, 0, null,
			"The " + name + ", under your employment, educates and expands your following.",
			"The " + name + " has no interest in your petty finances."
		));
	}
}