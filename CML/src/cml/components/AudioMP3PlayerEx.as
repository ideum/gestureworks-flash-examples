package cml.components
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the CML MP3Player tag.
	 */
	public class AudioMP3PlayerEx extends GestureWorks
	{
		public function AudioMP3PlayerEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "components/AudioMP3Player.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			trace("cmlInit()");
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
		}
	}
}