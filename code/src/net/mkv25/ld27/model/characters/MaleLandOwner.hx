package net.mkv25.ld27.model.characters;

import net.mkv25.ld27.enums.BodyTypeEnum;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.model.CharacterVO;

class MaleLandOwner extends CharacterVO
{
	public function new() 
	{
		super();
		
		name = "Nobleman";
		gender = GenderEnum.Male;
		bodyType = BodyTypeEnum.MaleLandOwner;
		
		startingGold = 50;
		startingFollowers = 5;
		startingLand = 20;
	}	
}