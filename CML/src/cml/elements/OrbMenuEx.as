package cml.elements
{
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.elements.Graphic;
	import com.gestureworks.cml.elements.OrbMenu;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the OrbMenu tag.
	 */
	public class OrbMenuEx extends GestureWorks
	{
		private var bkg:Graphic;
		
		public function OrbMenuEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "elements/OrbMenu.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
			var orb:OrbMenu = CMLObjectList.instance.getId("ob1");
			orb.addEventListener(StateEvent.CHANGE, onStateEvent);
			bkg = CMLObjectList.instance.getCSSClass("background", 0);
		}
		
		private function onStateEvent(event:StateEvent):void
		{
			trace(event.value);
			
			if (event.value == "btn0")
			{
				bkg.visible = true;
				bkg.color = 0x817679;
			}
			else if (event.value == "btn1")
			{
				bkg.visible = true;
				bkg.color = 0x5E5A80;
			}
			else if (event.value == "btn2")
			{
				bkg.visible = true;
				bkg.color = 0xC48189;
			}
		}
	}
}