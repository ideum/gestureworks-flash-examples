package cml.elements
{
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.elements.Text;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the RadioButtons tag.
	 */
	public class RadioButtonsEx extends GestureWorks
	{
		private var text:Text;
		
		public function RadioButtonsEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "elements/RadioButtons.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
			addEventListener(StateEvent.CHANGE, update);
			text = CMLObjectList.instance.getId("selection");
		}
		
		private function update(e:StateEvent):void
		{
			text.text = e.value;
		}
	}
}