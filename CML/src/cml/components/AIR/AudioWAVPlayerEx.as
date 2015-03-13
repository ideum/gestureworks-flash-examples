package cml.components.AIR
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	// load AIR exclusive CML objects 

	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class AudioWAVPlayerEx extends GestureWorks
	{
		public function AudioWAVPlayerEx():void {
			super();
			gml = "gml/gestures.gml";
			cml = "components/AIR/AudioWAVPlayer.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
	}
	
}