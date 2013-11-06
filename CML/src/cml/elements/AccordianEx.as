package cml.elements
{
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.elements.Accordion;
	import com.gestureworks.cml.elements.Text;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import com.greensock.*;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	/**
	 * This example demonstrates the Accordion tag
	 */
	public class AccordianEx extends GestureWorks
	{
		private var tweening:Boolean = false;
		private var tween:TweenLite;
		
		public function AccordianEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "elements/Accordion.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(e:Event = null):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
		}
	}
}