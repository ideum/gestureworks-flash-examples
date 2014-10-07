package cml.elements.AIR
{
	import com.gestureworks.cml.core.CMLAir;CMLAir
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class AudioWAVEx extends GestureWorks
	{
		public function AudioWAVEx():void 
		{
			super();
			gml = "gml/gestures.gml";
			cml = "elements/AIR/AudioWAV.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
	
		private function cmlInit(event:Event):void
		{
			trace("cmlInit()");
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
	}
	
}