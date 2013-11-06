package cml.elements
{
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.elements.Toggle;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	/**
	 * This example demonstrates the Toggle tag.
	 */
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class ToggleEx extends GestureWorks
	{
		public function ToggleEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "elements/Toggle.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
			var toggle:Toggle = Toggle(CMLObjectList.instance.getId("toggle"));
			toggle.addEventListener(StateEvent.CHANGE, onToggle);
		}
		
		private function onToggle(event:StateEvent):void
		{
			trace(event.value);
		}
	}
}