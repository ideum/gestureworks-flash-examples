package as3.elements
{
	import com.gestureworks.cml.elements.Switch;
	import com.gestureworks.cml.elements.Text;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class SwitchEx extends GestureWorks
	{
		private var text:Text = new Text();
		
		public function SwitchEx():void
		{
			gml = "gml/gestures.gml";				
		}
		
		override protected function gestureworksInit():void
		{
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("Switch");
			exTemp.createDesc("<p>This class acts as a Switch button. The state can be changed by drag and touch event.</p>");
			
			var sw:Switch = new Switch();
			
			sw.x = 800;
			sw.y = 300;
			
			//background graphics
			sw.backgroundColor = 0x404040;
			sw.backgroundWidth = 100;
			sw.backgroundHeight = 40;
			sw.backgroundEllipseWidth = 25;
			sw.backgroundEllipseHeight = 25;
			
			//button graphics
			sw.buttonWidth = 50;
			sw.buttonHeight = 40;
			sw.buttonEllipseWidth = 25;
			sw.buttonEllipseHeight = 25;
			sw.buttonColor = 0x461B7E;
			
			//event listener
			sw.addEventListener(StateEvent.CHANGE, onStateChange);
			
			sw.init();
			addChild(sw);
			
			text.text = "FALSE";
			text.visible = false;
			text.color = 0xFFFFFF;
			text.fontSize = 25;
			addChild(text);
		}
		
		//handles state event
		private function onStateChange(event:StateEvent):void
		{
			trace(event.value);
			text.visible = true;
			if (event.value == true) {
				text.str = "TRUE";
				text.x = 915;
				text.y = 300;				
			}
			else {
				text.str = "FALSE";
				text.x = 708;
				text.y = 300;	
			}
		}
	
	}
}