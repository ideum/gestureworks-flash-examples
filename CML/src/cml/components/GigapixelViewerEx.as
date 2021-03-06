package cml.components
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the CML Gigapixel viewer tag.
	 */
	public class GigapixelViewerEx extends GestureWorks
	{
		public function GigapixelViewerEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "components/GigapixelViewer.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
		}
	}
}