package net.mkv25.ld27.ui;

import net.mkv25.ld27.enums.BodyTypeEnum;
import net.mkv25.ld27.enums.EquipmentEnum;
import net.mkv25.ld27.enums.GenderEnum;
import net.mkv25.ld27.model.CharacterVO;
import nme.Assets;
import nme.display.Bitmap;
import nme.display.Sprite;

class CharacterUI 
{
	public var artwork:Sprite;
	public var model:CharacterVO;
	
	var bodyBitmap:Bitmap;
	var crownBitmap:Bitmap;
	var staffBitmap:Bitmap;
	
	public function new() 
	{
		artwork = new Sprite();
		bodyBitmap = new Bitmap();
		crownBitmap = new Bitmap();
		staffBitmap = new Bitmap();
		
		model = null;
	}
	
	public function setup(model:CharacterVO):Void
	{
		this.model = model;
		
		artwork.addChild(bodyBitmap);
		artwork.addChild(crownBitmap);
		artwork.addChild(staffBitmap);
		
		draw();
	}
	
	public function draw():Void
	{
		drawBodyType(model.bodyType);
		drawEquipment(model.equipment);
	}
	
	function drawBodyType(bodyType:BodyTypeEnum)
	{
		var asset:String = switch(bodyType)
		{
			case BodyTypeEnum.FemaleHealer:
				"img/character_female_healer.png";
			case BodyTypeEnum.FemaleLandOwner:
				"img/character_female_landowner.png";
			case BodyTypeEnum.FemaleMerchant:
				"img/character_female_merchant.png";
			case BodyTypeEnum.FemaleMidwife:
				"img/character_female_midwife.png";
			case BodyTypeEnum.FemalePriest:
				"img/character_female_priest.png";
				
			case BodyTypeEnum.MaleHealer:
				"img/character_male_healer.png";
			case BodyTypeEnum.MaleLandOwner:
				"img/character_male_landowner.png";
			case BodyTypeEnum.MaleMerchant:
				"img/character_male_merchant.png";
			case BodyTypeEnum.MalePriest:
				"img/character_male_priest.png";
			case BodyTypeEnum.MaleWiseMan:
				"img/character_male_wiseman.png";
		}
		
		bodyBitmap.bitmapData = Assets.getBitmapData(asset);
		bodyBitmap.smoothing = true;
		bodyBitmap.x = - Math.ceil(bodyBitmap.width / 2);
		bodyBitmap.y = - Math.ceil(bodyBitmap.height / 2);
	}
	
	function drawEquipment(equipment:Array<EquipmentEnum>)
	{
		crownBitmap.visible = false;
		staffBitmap.visible = false;
		
		for (item in equipment)
		{
			switch(item)
			{	
				case EquipmentEnum.Crown:
					var crownAsset:String = (model.gender == GenderEnum.Female) ? "img/equipment_female_crown.png" : "img/equipment_male_crown.png";
					crownBitmap.bitmapData = Assets.getBitmapData(crownAsset);
					crownBitmap.visible = true;
				case EquipmentEnum.HolyRod:
					var holyRodAsset:String = "img/equipment_holy_rod.png";
					staffBitmap.bitmapData = Assets.getBitmapData(holyRodAsset);
					staffBitmap.visible = true;
				case EquipmentEnum.WoodenStaff:
					var woodenStaffAsset:String = "img/equipment_wooden_staff.png";
					staffBitmap.bitmapData = Assets.getBitmapData(woodenStaffAsset);
					staffBitmap.visible = true;
			}
		}
		
		crownBitmap.smoothing = true;
		crownBitmap.x = - Math.ceil(crownBitmap.width / 2);
		crownBitmap.y = - Math.ceil(crownBitmap.height / 2);
		
		staffBitmap.smoothing = true;
		staffBitmap.x = - Math.ceil(staffBitmap.width / 2);
		staffBitmap.y = - Math.ceil(staffBitmap.height / 2);
	}
	
}