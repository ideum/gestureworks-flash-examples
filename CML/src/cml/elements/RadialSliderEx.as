//////////////////////////////////////////////////////////////////////////////
// This example demonstrates the CML RadialSlider tag.
/////////////////////////////////////////////////////////////////////////////

package cml.elements
{
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.cml.element.RadialSlider;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]

	public class RadialSliderEx extends GestureWorks
	{
		public function RadialSliderEx():void 
		{
			super();
			cml = "elements/RadialSlider.cml";
			gml = "gml/gestures.gml";
			
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
			
			setupTimerSlider();
		}
		
		private function setupTimerSlider():void
		{
			var slider:RadialSlider = CMLObjectList.instance.getId("Input Slider");
			
			if (!slider)
			{
				return;
			}
			
			slider.addEventListener(StateEvent.CHANGE , onStateEvent);
			
			//event listener	
			function onStateEvent(event:StateEvent):void
			{
				trace(event.id, event.property, event.value);
			}
			
			//timer	for continous slider
			var timer:Timer = new Timer(10);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
			var cnt:Number = 0;
			
			//timer event set for horintal or vertical slider
			function onTimer(event:TimerEvent):void
			{	
				if (cnt <= 100.0)
				{
					slider.input(cnt);
					cnt += 0.5;
				}
			}
		}
		
	}
}