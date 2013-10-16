package cml.elements
{
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.element.Text;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the Button tag
	 */
	public class ButtonEx extends GestureWorks
	{
		private var txt:Text;
		
		public function ButtonEx():void
		{
			super();
			cml = "elements/Button.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
			addEventListener(StateEvent.CHANGE, buttonState);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
			txt = CMLObjectList.instance.getId("t");
		}
		
		private function buttonState(e:StateEvent):void
		{
			txt.text = e.value;
		}
	}
}