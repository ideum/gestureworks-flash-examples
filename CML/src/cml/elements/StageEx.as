package cml.elements
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.cml.core.CMLParser;
	import flash.events.Event;
	
	[SWF(width="1280",height="720")]
	
	/**
	 * This example demonstrates the Stage tag.
	 */
	public class StageEx extends GestureWorks
	{
		public function StageEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "elements/Stage.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
		}
	}
}