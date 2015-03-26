package cml.components
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.elements.Collection;
	import com.gestureworks.cml.elements.TouchContainer;
	import com.gestureworks.cml.utils.document;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.events.GWGestureEvent;
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the CML CollectionViewer tag.
	 */
	public class CollectionViewerEx extends GestureWorks
	{
		public function CollectionViewerEx():void{
			super();
			gml = "gml/gestures.gml"
			cml = "components/CollectionViewer.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			
			//register tap handler on collection objects
			var collection:Collection = document.getElementsByTagName(Collection)[0];
			var i:int = collection.background is DisplayObject ? 1 : 0;
			var object:TouchContainer;
			for (i; i < collection.numChildren; i++) {
				object = collection.getChildAt(i) as TouchContainer;
				object.addEventListener(GWGestureEvent.TAP, invisible);
			}			
		}
		
		/**
		 * Disable visibility of tapped object
		 * @param	e
		 */
		private function invisible(e:GWGestureEvent):void {
			e.target.visible = false; 
		}		
	}
}