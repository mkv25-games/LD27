package net.mkv25.ld27.model;

import net.mkv25.ld27.enums.EquipmentEnum;
import net.mkv25.ld27.enums.ValueTypeEnum;

class OptionVO 
{
	public var text:String;
	public var compareType:ValueTypeEnum;
	public var rewardType:ValueTypeEnum;
	public var rewardAmount:Int;
	public var punishType:ValueTypeEnum;
	public var punishAmount:Int;
	public var equipmentBonus:EquipmentEnum;
	public var storyTextSuccess:String;
	public var storyTextFail:String;
	
	public function new(text:String, compareType:ValueTypeEnum, rewardType:ValueTypeEnum, rewardAmount:Int, punishType:ValueTypeEnum, punishAmount:Int, equipmentBonus:EquipmentEnum=null, storyTextSuccess:String="", storyTextFail:String="") 
	{
		this.text = text;
		this.compareType = compareType;
		this.rewardType = rewardType;
		this.rewardAmount = rewardAmount;
		this.punishType = punishType;
		this.punishAmount = punishAmount;
		this.equipmentBonus = equipmentBonus;
		this.storyTextSuccess = storyTextSuccess;
		this.storyTextFail = storyTextFail;
	}
	
}