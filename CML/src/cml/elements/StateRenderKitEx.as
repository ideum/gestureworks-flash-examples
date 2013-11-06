package cml.elements
{
	import com.gestureworks.cml.elements.Button;
	import com.gestureworks.cml.elements.TouchContainer;
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
			gml = "gml/gestures.gml";
			cml = "elements/StateRenderKit.cml";			
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
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