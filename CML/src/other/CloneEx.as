package other
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
