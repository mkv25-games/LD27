package net.mkv25.ld27.model.characters;

import net.mkv25.ld27.enums.BodyTypeEnum;
import net.mkv25.ld27.enums.EquipmentEnum;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.enums.ValueTypeEnum;
import net.mkv25.ld27.model.CharacterVO;
import net.mkv25.ld27.model.OptionVO;

class MaleWiseMan extends CharacterVO
{
	public function new() 
	{
		super();
		
		name = "Scholar";
		gender = GenderEnum.Male;
		bodyType = BodyTypeEnum.MaleWiseMan;
		
		startingGold = 5;
		startingFollowers = 60;
		startingLand = 1;
		
		createOptions();
	}
	
	override private function createOptions() 
	{
		speech1 = "Your youth, your workers,\n I can teach them a thing or two.";
		speech2 = "Knowledge is power, power is\n money, money is priceless!";
		
		options = new Array<OptionVO>();
		options.push(new OptionVO("Pay for Services", ValueTypeEnum.Gold, ValueTypeEnum.Gold, 10, ValueTypeEnum.Land, -1, null,
			"Your servants become more productive as a result of " + name + "'s services.",
			"Having no way to pay the " + name + "'s bill, you offer them land instead."
		));
		
		options.push(new OptionVO("Offer Land", ValueTypeEnum.Land, ValueTypeEnum.Gold, 5, ValueTypeEnum.None, 0, null,
			"The " + name + " opens up a clinic on your land, and pays a regular fee.",
			"The " + name + " has no need for your offer of land."
		));
		
		options.push(new OptionVO("Exploit Knowledge", ValueTypeEnum.Followers, ValueTypeEnum.Land, 15, ValueTypeEnum.Land, -5, null,
			"You muscle the " + name + " into supporting a daring land grab using their knowledge.",
			"The " + name + " craftily uses your people to secure more land for his own holdings."
		));
		
		options.push(new OptionVO("Share Wisdom", ValueTypeEnum.Followers, ValueTypeEnum.None, 0, ValueTypeEnum.Gold, -10, EquipmentEnum.WoodenStaff,
			"You impress the " + name + " with your education. They offer you a staff of knowledge as a symbol of respect.",
			"The " + name + " is humoured by your knowledge, teaches his own lessons, and bills you for their time."
		));
	}
}