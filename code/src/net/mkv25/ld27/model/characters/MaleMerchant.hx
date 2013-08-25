package net.mkv25.ld27.model.characters;

import net.mkv25.ld27.enums.BodyTypeEnum;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.model.CharacterVO;

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
	}	
}