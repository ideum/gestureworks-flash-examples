package as3.elements
{
	import com.gestureworks.cml.element.Toggle;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class ToggleEx extends GestureWorks
	{
		public function ToggleEx():void
		{
			gml = "gml/gestures.gml";		
		}		
		
		override protected function gestureworksInit():void
		{
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("Toggle");
			exTemp.createDesc("<p>This tag acts as a toggle button and adds crossline inside square when toggled.</p>");
			
			var tg:Toggle = new Toggle();
			
			tg.x = 730;
			tg.y = 200;
			tg.backgroundColor = 0xFFFFFF;
			tg.backgroundLineColor = 0xFF0000;
			tg.backgroundLineStoke = 3;
			tg.toggleColor = 0xFF0000;
			tg.toggleLineStoke = 1;
			
			//event listener
			tg.addEventListener(StateEvent.CHANGE, onToggle);
			
			tg.init();
			addChild(tg);
		}
		
		// handles state event
		private function onToggle(event:StateEvent):void
		{
			trace(event.value);
		}
	
	}
}