package cml.filters
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the Blur filter tag.
	 */
	public class BlurEx extends GestureWorks
	{
		public function BlurEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "filters/Blur.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);			
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");		
		}
	}
}