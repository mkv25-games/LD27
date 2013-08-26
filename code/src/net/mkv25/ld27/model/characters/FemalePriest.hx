package net.mkv25.ld27.model.characters;

import net.mkv25.ld27.enums.BodyTypeEnum;
import net.mkv25.ld27.enums.EquipmentEnum;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.enums.ValueTypeEnum;
import net.mkv25.ld27.model.CharacterVO;
import net.mkv25.ld27.model.OptionVO;

class FemalePriest extends CharacterVO
{
	public function new() 
	{
		super();
		
		name = "Prioress";
		gender = GenderEnum.Female;
		bodyType = BodyTypeEnum.FemalePriest;
		
		startingGold = 21;
		startingFollowers = 99;
		startingLand = 9;
		
		createOptions();
	}	
	
	override private function createOptions():Dynamic 
	{
		speech1 = "The way is clear,\n hope is thy name.";
		speech2 = "Only one way, our way.\n Join us.";
		
		options = new Array<OptionVO>();
		options.push(new OptionVO("Listen to the " + name, ValueTypeEnum.Followers, ValueTypeEnum.Gold, 50, ValueTypeEnum.Followers, -10, null,
			"The " + name + "'s followers flock to your lands and earn great coin for your people.",
			"The " + name + " attracts followers away from your lands."
		));
		
		options.push(new OptionVO("Shun the " + name, ValueTypeEnum.Followers, ValueTypeEnum.Gold, 20, ValueTypeEnum.Gold, -20, null,
			"The " + name + " is shunned, and your followers rejoice in coin.",
			"The " + name + " hits back with holy fervour, taxing your people with guilt."
		));
		
		options.push(new OptionVO("Promise Land", ValueTypeEnum.Land, ValueTypeEnum.Followers, 20, ValueTypeEnum.None, 0, null,
			"Glory to the Holy, word spreads of your great deeds to many people.",
			"The " + name + " has no need for your promise of land."
		));
		
		options.push(new OptionVO("Offer Coin", ValueTypeEnum.Gold, ValueTypeEnum.Followers, 20, ValueTypeEnum.None, 0, null,
			"The " + name + " is thankful of your coin and spreads word of your good deeds.",
			"The " + name + " has no interest of your heretical gold."
		));
	}
}