package net.mkv25.ld27.model.characters;

import net.mkv25.ld27.enums.BodyTypeEnum;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.model.CharacterVO;

class MaleHealer extends CharacterVO
{
	public function new() 
	{
		super();
		
		name = "Healer";
		gender = GenderEnum.Male;
		bodyType = BodyTypeEnum.MaleHealer;
		
		startingGold = 100;
		startingFollowers = 10;
		startingLand = 2;
	}	
}