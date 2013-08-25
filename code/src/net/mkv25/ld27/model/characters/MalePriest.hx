package net.mkv25.ld27.model.characters;

import net.mkv25.ld27.enums.BodyTypeEnum;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.model.CharacterVO;

class MalePriest extends CharacterVO
{
	public function new() 
	{
		super();
		
		name = "Priest";
		gender = GenderEnum.Male;
		bodyType = BodyTypeEnum.MalePriest;
		
		startingGold = 20;
		startingFollowers = 100;
		startingLand = 10;
	}	
}