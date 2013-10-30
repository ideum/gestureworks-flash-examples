package cml.elements
{
	import com.gestureworks.cml.element.Button;
	import com.gestureworks.cml.element.TouchContainer;
	import com.gestureworks.cml.managers.StateManager;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.events.StateEvent;
	import flash.events.Event;
	import flash.display.DisplayObjectContainer;

	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]

	/**
	 * This example demonstrates the use of the state machine using within a RenderKit.
	 */
	public class StateRenderKitEx extends GestureWorks
	{
		public function StateRenderKitEx():void 
		{
			super();
			cml = "elements/StateRenderKit.cml";			
			
			// add this event listener so we know when the CML parsing is complete
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
	
		override protected function gestureworksInit():void
 		{
			trace("gestureWorksInit()");			
		}
		
		private function cmlInit(event:Event):void
		{
			trace("cmlInit()");
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);

			//load object states associated with stateId
			for each(var btn:Button in CMLObjectList.instance.getClass(Button).getValueArray())
				btn.addEventListener(StateEvent.CHANGE, function(e:StateEvent):void {
					StateManager.loadState(e.value);
				});						
		}
	
	}
}