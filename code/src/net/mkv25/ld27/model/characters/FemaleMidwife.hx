package net.mkv25.ld27.model.characters;

import net.mkv25.ld27.enums.BodyTypeEnum;
import net.mkv25.ld27.enums.EquipmentEnum;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.enums.ValueTypeEnum;
import net.mkv25.ld27.model.CharacterVO;
import net.mkv25.ld27.model.OptionVO;

class FemaleMidwife extends CharacterVO
{
	public function new() 
	{
		super();
		
		name = "Midwife";
		gender = GenderEnum.Female;
		bodyType = BodyTypeEnum.FemaleMidwife;
		
		startingGold = 5;
		startingFollowers = 60;
		startingLand = 1;
		
		createOptions();
	}
	
	override private function createOptions():Dynamic 
	{
		speech1 = "Your families, your young,\n let me show them the way.";
		speech2 = "A wholesome lifestyle promotes\n health and sanity!";
		
		options = new Array<OptionVO>();
		options.push(new OptionVO("Pay for Services", ValueTypeEnum.Gold, ValueTypeEnum.Followers, 10, ValueTypeEnum.Land, -1, null,
			"Many more births survive following the " + name + "'s services.",
			"The " + name + " trades you out of some land."
		));
		
		options.push(new OptionVO("Offer Land", ValueTypeEnum.Land, ValueTypeEnum.Gold, 5, ValueTypeEnum.None, 0, null,
			"The " + name + " opens up a clinic on your land, and pays a regular fee.",
			"The " + name + " has no need for your offer of land."
		));
		
		options.push(new OptionVO("Barter an Exchange", ValueTypeEnum.Followers, ValueTypeEnum.Land, 15, ValueTypeEnum.Land, -5, null,
			"You convince the " + name + " to secure new housing in exchange for access to improved midwifery services.",
			"The " + name + ", insulted by your offer, uses her influence to have land seized from you."
		));
		
		options.push(new OptionVO("Share Wisdom", ValueTypeEnum.Followers, ValueTypeEnum.None, 0, ValueTypeEnum.Gold, -10, EquipmentEnum.WoodenStaff,
			"You impress the " + name + " with your wisdom. They offer you a staff of knowledge as a symbol of respect.",
			"The " + name + " is humoured by your knowledge, offers their own advice, and bills you for their time."
		));
	}
}