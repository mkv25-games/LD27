package net.mkv25.ld27.screens;

import motion.Actuate;
import net.mkv25.ld27.controller.EventBus;
import nme.Assets;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.display.Sprite;

class Screen
{
	public var eventbus:EventBus;
	public var artwork:Sprite;
	
	var background:Bitmap;
	
	public function new() 
	{
		artwork = new Sprite();
		background = new Bitmap();
		
		artwork.addChild(background);
	}
	
	public function setup(eventbus:EventBus):Void
	{
		this.eventbus = eventbus;
	}
	
	public function setBackground(asset:String):Void
	{
		background.bitmapData = Assets.getBitmapData(asset);	
	}
	
	public function show():Void
	{
		artwork.alpha = 0.0;
		Actuate.tween(artwork, 1.0, { alpha: 1.0 } ).onComplete(onShowComplete);
	}
	
	function onShowComplete():Void
	{
		
	}
}