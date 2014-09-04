package cml.elements
{
	import com.gestureworks.cml.elements.Window;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorksAIR;
	import flash.events.Event;
	import com.gestureworks.cml.core.CMLAir; CMLAir;
		
	[SWF(width="1920",height="1080")]
	
	/**
	 * This example demonstrates the Window tag (AIR-only).
	 */
	public class WindowEx extends GestureWorksAIR
	{
		public function WindowEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "elements/Window.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
		}
	}
}