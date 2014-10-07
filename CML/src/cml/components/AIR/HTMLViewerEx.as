package cml.components.AIR
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
		
	// load CML AIR classes
	import com.gestureworks.cml.core.CMLAir; CMLAir;

	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the CML HTMLViewer tag.
	 */
	public class HTMLViewerEx extends GestureWorks
	{
		public function HTMLViewerEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "components/AIR/HTMLViewer.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
		}
	}
}