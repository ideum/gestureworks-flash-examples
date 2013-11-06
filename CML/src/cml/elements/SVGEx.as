package cml.elements
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	/**
	 * This example demonstrates the Accordion tag
	 */
	public class SVGEx extends GestureWorks
	{		
		public function SVGEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "elements/SVG.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(e:Event = null):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
		}
	}
}