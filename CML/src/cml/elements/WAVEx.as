package cml.elements
{
	import com.gestureworks.cml.core.CMLAir;	
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;

	// Load AIR classes
	CMLAir;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class WAVEx extends GestureWorks
	{
		public function WAVEx():void 
		{
			super();
			gml = "gml/gestures.gml";
			cml = "elements/WAV.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
	
		private function cmlInit(event:Event):void
		{
			trace("cmlInit()");
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
	}
	
}