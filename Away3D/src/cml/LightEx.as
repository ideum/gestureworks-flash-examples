package cml {
	import com.gestureworks.away3d.TouchManager3D;
	import com.gestureworks.cml.core.CMLAway3D;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	// load Away3D classes
	CMLAway3D;	
	
	[SWF(width="1280", height="720", frameRate="60", backgroundColor="0x000000")]
	public class LightEx extends GestureWorks {	
		
		public function LightEx() {		
			super();
			TouchManager3D.initialize(); // TouchManager3D must be initialized
			gml = "gml/gestures.gml";			
			cml = "cml/Light.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void {
			trace("cmlInit()");
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
		}	
	}
}