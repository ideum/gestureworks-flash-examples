package cml.elements.AIR
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	// load AIR classes
	import com.gestureworks.cml.core.CMLAir;CMLAir;	
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the HTML tag through a given url address.
	 */
	public class HTML_url extends GestureWorks
	{
		public function HTML_url():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "elements/AIR/HTML-url.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
		}
	}
}