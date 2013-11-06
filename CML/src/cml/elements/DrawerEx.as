//////////////////////////////////////////////////////////////////////////////
// This example demostrates the use of the Dial class within CML.
/////////////////////////////////////////////////////////////////////////////

package cml.elements
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;

	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]

	public class DrawerEx extends GestureWorks
	{
		public function DrawerEx():void 
		{	
			super();
			cml = "elements/Drawer.cml";			
			gml = "gml/gestures.gml";
			
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