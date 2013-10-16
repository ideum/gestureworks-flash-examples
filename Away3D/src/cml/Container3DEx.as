package cml {
	import com.gestureworks.away3d.Away3DTouchManager;
	import com.gestureworks.cml.core.CMLAway3D; CMLAway3D;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	[SWF(width="1920", height="1080", frameRate="60", backgroundColor="0x000000")]
	public class Container3DEx extends GestureWorks {	
		
		public function Container3DEx() {		
			super();
			gml = "gml/gestures.gml";			
			cml = "cml/Container3D.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
	
		override protected function gestureworksInit():void {
			trace("gestureWorksInit()");	
		}
		
		private function cmlInit(event:Event):void {
			trace("cmlInit()");
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
		}	
	}
}