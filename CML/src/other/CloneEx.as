package other
<<<<<<< HEAD
{	
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	[SWF(backgroundColor = "0x000000", frameRate = "30")]
	 
	 
	public class CloneEx extends GestureWorks
	{		
		public function CloneEx ():void {
			gml = "gml/gestures.gml";
			cml = "other/CloneEx.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void {
			
		}
	}
}
=======
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the List layout tag.
	 */
	public class CloneEx extends GestureWorks
	{
		public function CloneEx():void
		{
			super();
			gml = "gml/gestures.gml";
			cml = "other/Clone.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
		}
	}
}
>>>>>>> origin/collection-viewer-refactor
