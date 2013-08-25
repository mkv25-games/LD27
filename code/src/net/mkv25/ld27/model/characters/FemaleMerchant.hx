package net.mkv25.ld27.model.characters;

import net.mkv25.ld27.enums.BodyTypeEnum;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.model.CharacterVO;

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
	}	
}