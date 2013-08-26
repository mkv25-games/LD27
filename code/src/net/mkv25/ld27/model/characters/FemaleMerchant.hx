package net.mkv25.ld27.model.characters;

import net.mkv25.ld27.enums.BodyTypeEnum;
import net.mkv25.ld27.enums.EquipmentEnum;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.enums.ValueTypeEnum;
import net.mkv25.ld27.model.CharacterVO;
import net.mkv25.ld27.model.OptionVO;

class FemaleMerchant extends CharacterVO
{
	public function new() 
	{
		super();
		
		name = "Merchant";
		gender = GenderEnum.Female;
		bodyType = BodyTypeEnum.FemaleMerchant;
		
		startingGold = 200;
		startingFollowers = 10;
		startingLand = 1;
		
		createOptions();
	}
	
	override private function createOptions() 
	{
		speech1 = "I have rare spices,\n and finest silks, come this way.";
		speech2 = "My, a beautiful face, say,\n have you seen my wares?";
		
		options = new Array<OptionVO>();
		options.push(new OptionVO("Do Business", ValueTypeEnum.Gold, ValueTypeEnum.Land, 10, ValueTypeEnum.Land, -1, null,
			"You trade land from " + name + " with your vast stocks of gold.",
			"The " + name + " trades you out of some land."
		));
		
		options.push(new OptionVO("Negotiate a better Deal", ValueTypeEnum.Followers, ValueTypeEnum.Land, 5, ValueTypeEnum.Land, -2, null,
			"You convince the " + name + " to offer you land in a valuable deal.",
			"The " + name + " charms you out of some valuable land rights."
		));
		
		options.push(new OptionVO("Offer Services", ValueTypeEnum.Gold, ValueTypeEnum.Gold, 5, ValueTypeEnum.None, 0, null,
			"The " + name + " reveals they are too poor to accept your help.",
			"The " + name + " deems you worthy of hiring, and pays you handsomely."
		));
		
		options.push(new OptionVO("Invite to Masked Ball", ValueTypeEnum.Land, ValueTypeEnum.Gold, 5, ValueTypeEnum.Gold, -10, null,
			"You impress the attendees with your land and wealth, but the " + name + " bribes you into a charity auction.",
			"The extravagant masked ball leaves a sizeable whole in your wallet, and you lose double on a charity action."
		));
	}
}