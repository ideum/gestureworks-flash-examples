package gestures 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.geom.ColorTransform;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate="60")]
	
	public class Hold extends GestureWorks 
	{
		public function Hold():void 
		{
			gml = "gml/hold.gml";
		}
		
		override protected function gestureworksInit():void 
		{
			trace("gestureWorksInit()");						
			
			// entry point			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("hold");
			exTemp.createDesc("The hold gesture is initialized by a touch event and is dispatched when the touch point remains after a specified time frame.<br /><br />The \"event_duration_max\" " +
			"attribute of the \"point\" tag defines the maximum allowable time between touch point events. Similarly \"event_duration_min\" attribute defines the minimum amount of time " +
			"between touch point events. Any touchEnd event that does not occur within time frame defined by the event_duration_min and event_duration_max, will not meet the matching criteria. " +
			"<br /><br />This example randomly changes the color of the square on each hold event. It also traces the return values to the output window.");
			
			// create a touchable sprite 
			var touchSprite:TouchSprite = new TouchSprite();
			
			// draw a simple graphic
			touchSprite.graphics.beginFill(0xFF0000);
			touchSprite.graphics.drawRect(0, 0, 200, 200);
			touchSprite.graphics.endFill();
			
			// center graphic in the middle of the stage
			touchSprite.x = 750;
			touchSprite.y = (stage.stageHeight - 200) / 2;
			
			// add touch sprite to display list 
			addChild(touchSprite);

			// add events 
			touchSprite.gestureList = { "hold":true };
			touchSprite.addEventListener(GWGestureEvent.HOLD, gestureHandler);
		}		
		
		private function gestureHandler(e:GWGestureEvent):void
		{
			trace(e.value.hold_x, e.value.hold_y, e.value.hold_n);
			var ct:ColorTransform = new ColorTransform();
			ct.color = Math.random() * 0xFFFFFF;
			e.target.transform.colorTransform = ct;			
		}
	}
	
}