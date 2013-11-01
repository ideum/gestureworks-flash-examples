package as3.elements
{
	import com.gestureworks.cml.element.Frame;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class FrameEx extends GestureWorks
	{
		public function FrameEx():void
		{
			gml = "assets/gestures.gml";			
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");		
			// entry point
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("Frame Element");
			exTemp.createDesc("<p>This tag can be used to create display object frames.</p>");
			
			var frame:Frame = new Frame();
			
			//defines frame attributes
			frame.width = 300;
			frame.height = 300;
			frame.x = 700;
			frame.y = 200;
			frame.frameAlpha = .7;
			frame.frameColor = 0xAAAABB;
			frame.frameThickness = 20;
			
			frame.init();
			addChild(frame);
		}
	}
}