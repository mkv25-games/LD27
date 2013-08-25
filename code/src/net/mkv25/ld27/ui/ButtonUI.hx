package net.mkv25.ld27.ui;

import net.mkv25.ld27.core.Text;
import nme.Assets;
import nme.display.Bitmap;
import nme.display.Sprite;
import nme.events.MouseEvent;
import nme.text.TextField;
import nme.text.TextFormatAlign;

class ButtonUI 
{
	public var artwork:Sprite;
	
	var bitmap:Bitmap;
	var textField:TextField;
	
	var action:Dynamic->Void;
	
	public function new() 
	{
		artwork = new Sprite();
		bitmap = new Bitmap();
		textField = Text.makeTextField("fonts/gabriola.ttf", 32, 0x282420, TextFormatAlign.CENTER);
		
		artwork.addEventListener(MouseEvent.CLICK, onMouseClick);
		artwork.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
		artwork.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
		artwork.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		artwork.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
	}
	
	public function setup(label:String, action:Dynamic->Void):Void
	{
		artwork.addChild(bitmap);
		artwork.addChild(textField);
		
		textField.text = label;
		textField.width = 120;
		textField.height = 36;
		textField.x = - Math.ceil(textField.width / 2);
		textField.y = - Math.ceil(textField.height / 2);
		
		this.action = action;
		
		upState();
	}
	
	function onMouseClick(e):Void
	{
		if (action != null)
		{
			action(this);
		}
	}
	
	function upState()
	{
		bitmap.bitmapData = Assets.getBitmapData("img/button_select_up.png");
		bitmap.x = - Math.ceil(bitmap.width / 2);
		bitmap.y = - Math.ceil(bitmap.height / 2);
	}
	
	function overState()
	{
		bitmap.bitmapData = Assets.getBitmapData("img/button_select_over.png");
		bitmap.x = - Math.ceil(bitmap.width / 2);
		bitmap.y = - Math.ceil(bitmap.height / 2);
	}
	
	function downState()
	{
		bitmap.bitmapData = Assets.getBitmapData("img/button_select_down.png");
		bitmap.x = - Math.ceil(bitmap.width / 2);
		bitmap.y = - Math.ceil(bitmap.height / 2);
	}
	
	function onMouseOver(e)
	{
		overState();
	}
	
	function onMouseOut(e)
	{
		upState();
	}
	
	function onMouseDown(e)
	{
		downState();
	}
	
	function onMouseUp(e)
	{
		overState();
	}
}