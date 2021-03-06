package cml.elements
{
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.elements.Switch;
	import com.gestureworks.cml.elements.Text;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the Swich tag.
	 */
	public class SwitchEx extends GestureWorks
	{
		private var text:Text = new Text;
		
		public function SwitchEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "elements/Switch.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
			
			var sw:Switch = Switch(CMLObjectList.instance.getId("switch"));
			sw.addEventListener(StateEvent.CHANGE, onStateChange);
			
			text.text = "FALSE";
			text.visible = false;
			text.color = 0xFFFFFF;
			text.fontSize = 25;
			addChild(text);
		}
		
		private function onStateChange(event:StateEvent):void
		{
			trace(event.value);
			text.visible = true;
			if (event.value == true) {
				text.str = "TRUE";
				text.x = 915;
				text.y = 300;				
			}
			else {
				text.str = "FALSE";
				text.x = 708;
				text.y = 300;	
			}
		}
	
	}
}