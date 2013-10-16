package cml.elements
{
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.element.Slider;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the Slider tag.
	 */
	public class SliderEx extends GestureWorks
	{
		public function SliderEx():void
		{
			super();
			cml = "elements/Slider.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
			
			var horizontal:Slider = CMLObjectList.instance.getId("horizontal");
			var vertical:Slider = CMLObjectList.instance.getId("vertical");
			horizontal.addEventListener(StateEvent.CHANGE, onStateEvent);
			vertical.addEventListener(StateEvent.CHANGE, onStateEvent);
			
			function onStateEvent(event:StateEvent):void
			{
				trace(event.id, event.property, event.value);
			}
			
			var inputHoriz:Slider = CMLObjectList.instance.getId("input-horiz");
			var inputVert:Slider = CMLObjectList.instance.getId("input-vert");
			
			var timer:Timer = new Timer(10);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
			var cnt:Number = 0;
			
			function onTimer(event:TimerEvent):void
			{
				inputHoriz.input(cnt);
				inputVert.input(cnt);
				cnt += .1;
			}
		}
	}
}