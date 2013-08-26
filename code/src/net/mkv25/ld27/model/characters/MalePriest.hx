package net.mkv25.ld27.model.characters;

import net.mkv25.ld27.enums.BodyTypeEnum;
import net.mkv25.ld27.enums.EquipmentEnum;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.enums.ValueTypeEnum;
import net.mkv25.ld27.model.CharacterVO;
import net.mkv25.ld27.model.OptionVO;

class MalePriest extends CharacterVO
{
	public function new() 
	{
		super();
		
		name = "Priest";
		gender = GenderEnum.Male;
		bodyType = BodyTypeEnum.MalePriest;
		
		startingGold = 19;
		startingFollowers = 101;
		startingLand = 11;
		
		equipment.push(EquipmentEnum.HolyRod);
		
		createOptions();
	}
	
	override private function createOptions():Dynamic 
	{
		speech1 = "Holiness begets the Holy.\n Heed its word.";
		speech2 = "Renounce your land, your gold,\n listen to the way!";
		
		options = new Array<OptionVO>();
		options.push(new OptionVO("Listen to the " + name, ValueTypeEnum.Followers, ValueTypeEnum.Land, 10, ValueTypeEnum.Followers, -10, null,
			"The " + name + ", impressed by your following, grants you land in return for Holiness.",
			"The " + name + " attracts your followers to the cause of the Holy."
		));
		
		options.push(new OptionVO("Shun the " + name, ValueTypeEnum.Followers, ValueTypeEnum.Gold, 20, ValueTypeEnum.Gold, -20, null,
			"The " + name + " is shunned, and your followers rejoice in coin.",
			"The " + name + " hits back with holy fervour, taxing your people with guilt."
		));
		
		options.push(new OptionVO("Promise Land", ValueTypeEnum.Land, ValueTypeEnum.Land, -20, ValueTypeEnum.Followers, 50, null,
			"The " + name + " blesses you for your offer. Those with no home will have a home with the Holy.",
			"The " + name + " recognises your great sacrifice. He promises your name will be spread far and wide."
		));
		
		options.push(new OptionVO("Promise Coin", ValueTypeEnum.Gold, ValueTypeEnum.Gold, -20, ValueTypeEnum.Land, 50, null,
			"The " + name + " blesses you for your coin. Learn the way of the pauper before mastering your own flight!",
			"The " + name + " recognises your great sacrifice. One day you will own all that the eye can see."
		));
	}
}