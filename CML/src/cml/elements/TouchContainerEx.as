package cml.elements
{
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.element.TouchContainer;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates TouchContainer tag.
	 */
	public class TouchContainerEx extends GestureWorks
	{
		public function TouchContainerEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "elements/TouchContainer.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
			// you can grab any object created in CML using the CMLObjectList
			var image:TouchContainer = CMLObjectList.instance.getId("touch-image");
			trace("image");
		}
	
	}
}