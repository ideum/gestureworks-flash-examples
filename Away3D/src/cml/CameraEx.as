package cml {
	import com.gestureworks.away3d.TouchManager3D;
	import com.gestureworks.cml.core.CMLAway3D; CMLAway3D;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	[SWF(width="1920", height="1080", frameRate="60", backgroundColor="0x000000")]
	public class CameraEx extends GestureWorks {	
		
		public function CameraEx() {		
			super();
			gml = "gml/gestures.gml";
			cml = "cml/Camera.cml";
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