package cml.components
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the CML MP3Player tag.
	 */
	public class MP3PlayerEx extends GestureWorks
	{
		public function MP3PlayerEx():void
		{
			super();
			cml = "components/MP3Player.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		{
			trace("gestureWorksInit()");
		}
		
		private function cmlInit(event:Event):void
		{
			trace("cmlInit()");
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
		}
	}
}