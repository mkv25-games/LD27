package net.mkv25.ld27.model.characters;

import net.mkv25.ld27.enums.BodyTypeEnum;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.model.CharacterVO;

class FemaleMidwife extends CharacterVO
{
	public function new() 
	{
		super();
		
		name = "Landowner";
		gender = GenderEnum.Female;
		bodyType = BodyTypeEnum.FemaleMidwife;
		
		startingGold = 5;
		startingFollowers = 100;
		startingLand = 1;
	}	
}