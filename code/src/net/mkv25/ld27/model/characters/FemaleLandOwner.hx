package net.mkv25.ld27.model.characters;

import net.mkv25.ld27.enums.BodyTypeEnum;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.model.CharacterVO;

class FemaleLandOwner extends CharacterVO
{
	public function new() 
	{
		super();
		
		name = "Landowner";
		gender = GenderEnum.Female;
		bodyType = BodyTypeEnum.FemaleLandOwner;
		
		startingGold = 50;
		startingFollowers = 5;
		startingLand = 20;
	}	
}