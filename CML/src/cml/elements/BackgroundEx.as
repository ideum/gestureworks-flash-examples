package cml.elements
{	
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;

	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]

	/**
	 * This example demonstrates the use of the CML Background tag.
	 */
	public class BackgroundEx extends GestureWorks
	{
		public function BackgroundEx():void 
		{
			super();
			cml = "elements/Background.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");			
		}	
	}
}