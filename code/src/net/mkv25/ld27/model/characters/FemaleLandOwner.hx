package net.mkv25.ld27.model.characters;

import net.mkv25.ld27.enums.BodyTypeEnum;
import net.mkv25.ld27.enums.EquipmentEnum;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.enums.ValueTypeEnum;
import net.mkv25.ld27.model.CharacterVO;
import net.mkv25.ld27.model.OptionVO;

class FemaleLandOwner extends CharacterVO
{
	public function new() 
	{
		super();
		
		name = "Landowner";
		gender = GenderEnum.Female;
		bodyType = BodyTypeEnum.FemaleLandOwner;
		
		startingGold = 50;
		startingFollowers = 5;
		startingLand = 20;
		
		createOptions();
	}
	
	override private function createOptions() 
	{
		speech1 = "Out of my way plebian,\n I have a schedule to meet.";
		speech2 = "No time for idiots,\n remove yourself from my view.";
		
		options = new Array<OptionVO>();
		options.push(new OptionVO("Step aside", ValueTypeEnum.Land, ValueTypeEnum.None, 10, ValueTypeEnum.None, 0, null,
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
		
		options.push(new OptionVO("Invite to Masked Ball", ValueTypeEnum.Land, ValueTypeEnum.None, 0, ValueTypeEnum.Gold, -10, EquipmentEnum.Crown,
			"You reveal to the attendees your true worth, and in awe, the " + name + " crowns you as the lost heir to the land.",
			"The extravagant masked ball leaves a sizeable hole in your wallet."
		));
	}
}