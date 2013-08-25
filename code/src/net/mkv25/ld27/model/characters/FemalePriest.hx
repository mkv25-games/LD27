package net.mkv25.ld27.model.characters;

import net.mkv25.ld27.enums.BodyTypeEnum;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.model.CharacterVO;

class FemalePriest extends CharacterVO
{
	public function new() 
	{
		super();
		
		name = "Prioress";
		gender = GenderEnum.Female;
		bodyType = BodyTypeEnum.FemalePriest;
		
		startingGold = 20;
		startingFollowers = 100;
		startingLand = 10;
	}	
}