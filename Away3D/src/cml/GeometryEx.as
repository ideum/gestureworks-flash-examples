package cml {
	import com.gestureworks.away3d.Away3DTouchManager;
	import com.gestureworks.away3d.CML_Away3D; CML_Away3D;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;

	[SWF(width="1920", height="1080", frameRate="60", backgroundColor="0x000000")]
	public class GeometryEx extends GestureWorks {	
		
		public function GeometryEx() {		
			super();
			gml = "gml/gestures.gml";			
			cml = "cml/Geometry.cml";
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