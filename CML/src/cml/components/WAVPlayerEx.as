//////////////////////////////////////////////////////////////////////////////
// This example demonstrates the CML WavElement tag.
/////////////////////////////////////////////////////////////////////////////
package 
{
	import com.gestureworks.cml.components.Component;
	import com.gestureworks.cml.element.Slider;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.core.CML_AIR; CML_AIR;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import com.gestureworks.cml.events.StateEvent;

	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class Main extends GestureWorks
	{
		
		public function Main():void 
		{
			super();
			cml = "WAVPlayer.cml";
			
			
			// add this event listener so we know when the CML parsing is complete
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
	
		override protected function gestureworksInit():void
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