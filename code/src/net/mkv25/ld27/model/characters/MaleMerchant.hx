package net.mkv25.ld27.model.characters;

import net.mkv25.ld27.enums.BodyTypeEnum;
import net.mkv25.ld27.enums.EquipmentEnum;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.enums.ValueTypeEnum;
import net.mkv25.ld27.model.CharacterVO;
import net.mkv25.ld27.model.OptionVO;

class MaleMerchant extends CharacterVO
{
	public function new() 
	{
		super();
		
		name = "Trader";
		gender = GenderEnum.Male;
		bodyType = BodyTypeEnum.MaleMerchant;
		
		startingGold = 200;
		startingFollowers = 10;
		startingLand = 1;
		
		createOptions();
	}	
	
	override private function createOptions() 
	{
		speech1 = "I have armour, weapons,\n and banners for buy and sale.";
		speech2 = "Jest your followers, blaze\n to glory with my wares!";
		
		options = new Array<OptionVO>();
		options.push(new OptionVO("Do Business", ValueTypeEnum.Followers, ValueTypeEnum.Gold, 10, ValueTypeEnum.Gold, -1, null,
			"You sell unneeded weapons from the old war with the " + name + ".",
			"The " + name + " finds some old weapons, and rotting armour to sell to you."
		));
		
		options.push(new OptionVO("Negotiate a better Deal", ValueTypeEnum.Land, ValueTypeEnum.Gold, 15, ValueTypeEnum.Gold, -5, null,
			"You offer a place on your land for the " + name + " to sell goods in return for taxes.",
			"The " + name + " laughs at your pitiful freehold and charms you out of some gold."
		));
		
		options.push(new OptionVO("Offer Services", ValueTypeEnum.Gold, ValueTypeEnum.Gold, 25, ValueTypeEnum.None, 0, null,
			"The " + name + " reveals they are too poor to accept your help.",
			"The " + name + " deems you worthy of hiring, and pays you handsomely."
		));
		
		options.push(new OptionVO("Invite to Dinner", ValueTypeEnum.Land, ValueTypeEnum.Gold, 25, ValueTypeEnum.Gold, -5, null,
			"You explain plans for your land expansion, and the " + name + " advises how you can turn a profit.",
			"You waste the dinner listening to how the " + name + " has invested on great swathes of his land."
		));
	}
}