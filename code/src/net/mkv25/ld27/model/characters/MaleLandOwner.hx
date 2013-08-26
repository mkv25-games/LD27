package net.mkv25.ld27.model.characters;

import net.mkv25.ld27.enums.BodyTypeEnum;
import net.mkv25.ld27.enums.EquipmentEnum;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.enums.ValueTypeEnum;
import net.mkv25.ld27.model.CharacterVO;
import net.mkv25.ld27.model.OptionVO;

class MaleLandOwner extends CharacterVO
{
	public function new() 
	{
		super();
		
		name = "Nobleman";
		gender = GenderEnum.Male;
		bodyType = BodyTypeEnum.MaleLandOwner;
		
		startingGold = 50;
		startingFollowers = 5;
		startingLand = 20;
		
		createOptions();
	}
	
	override private function createOptions():Dynamic 
	{
		speech1 = "These lands are stale,\n I demand to meet with the owner.";
		speech2 = "What a trot of a place,\n completely ghastly I say.";
		
		options = new Array<OptionVO>();
		options.push(new OptionVO("Introduce Yourself", ValueTypeEnum.Land, ValueTypeEnum.None, 10, ValueTypeEnum.None, 0, null,
			"The " + name + " recognised you in jest, and appologised profusely in a panic.",
			"The " + name + " appreciated your disgression. You avoided any trouble."
		));
		
		options.push(new OptionVO("Humiliate the " + name, ValueTypeEnum.Followers, ValueTypeEnum.Land, 5, ValueTypeEnum.Gold, -5, null,
			"You had the " + name + " mocked, and bullied them out of a sizeable land deal.",
			"The " + name + " laughed, and then had their lawyers sue you for slander."
		));
		
		options.push(new OptionVO("Offer Services", ValueTypeEnum.Gold, ValueTypeEnum.Gold, 5, ValueTypeEnum.None, 0, null,
			"The " + name + " reveals they are too poor to accept your help.",
			"The " + name + " deems you worthy of hiring, and pays you handsomely."
		));
		
		options.push(new OptionVO("Invite the for Dinner", ValueTypeEnum.Land, ValueTypeEnum.None, 0, ValueTypeEnum.Gold, -10, EquipmentEnum.Crown,
			"You explain to the " + name + " your true worth, and in awe, they crown as the lost heir to the land.",
			"The extravagant meal with " + name + " leaves a sizeable hole in your wallet."
		));
	}
}