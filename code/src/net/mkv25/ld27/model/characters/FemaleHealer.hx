package net.mkv25.ld27.model.characters;

import net.mkv25.ld27.enums.BodyTypeEnum;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.model.CharacterVO;

class FemaleHealer extends CharacterVO
{
	public function new() 
	{
		super();
		
		name = "Scientist";
		gender = GenderEnum.Female;
		bodyType = BodyTypeEnum.FemaleHealer;
		
		startingGold = 100;
		startingFollowers = 10;
		startingLand = 2;
	}	
}