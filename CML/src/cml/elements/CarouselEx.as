package cml.elements
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]

	/**
	 * This example demonstrates the Carousel tag.
	 */
	public class CarouselEx extends GestureWorks
	{
		public function CarouselEx():void
		{
			super();
			gml = "gml/gestures.gml";
			cml = "elements/Carousel.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
		}
	}
}