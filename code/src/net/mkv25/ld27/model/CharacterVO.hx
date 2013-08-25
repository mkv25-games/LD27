package net.mkv25.ld27.model;

import net.mkv25.ld27.enums.BodyTypeEnum;
import net.mkv25.ld27.enums.EquipmentEnum;
import net.mkv25.ld27.enums.GenderEnum;

class CharacterVO
{
	public var gender:GenderEnum;
	public var name:String;
	public var equipment:Array<EquipmentEnum>;	
	public var bodyType:BodyTypeEnum;
	
	public var startingGold:Int;
	public var startingFollowers:Int;
	public var startingLand:Int;
	
	public var gold:Int;
	public var followers:Int;
	public var land:Int;
	
	public function new() 
	{
		gender = null;
		name = null;
		equipment = new Array<EquipmentEnum>();
		bodyType = null;
		
		startingGold = 0;
		startingFollowers = 0;
		startingLand = 0;
		
		gold = 0;
		followers = 0;
		land = 0;
	}
	
	public function reset():Void
	{
		while (equipment.length > 0)
			equipment.pop();
		
		gold = startingGold;
		followers = startingFollowers;
		land = startingLand;
	}
	
}