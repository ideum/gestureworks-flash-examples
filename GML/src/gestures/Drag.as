package gestures
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class Drag extends GestureWorks
	{
		public function Drag():void
		{
			gml = "gml/drag.gml";
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");
			
			// entry point			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("drag");
			exTemp.createDesc("<p>The drag gesture is designed to provide object drag functionality using any number of touch points. It is considered to be one of the three fundamental object manipulation" + " gestures.<br /><br />This gesture can be activated by any number of touch points between 1 and 10. When a touch is recognized on a touch object the position of the touch point is tracked. This changes in " + "position of the touch point is mapped directly to the position of the touch object.<br /><br />This example moves the sqauare on each drag event meeting the defined criteria. It also traces the return values to the output window.");
			
			// create a touchable sprite 
			var touchSprite:TouchSprite = new TouchSprite();
			
			// draw a simple graphic
			touchSprite.graphics.beginFill(0xFF0000);
			touchSprite.graphics.drawRect(0, 0, 200, 200);
			touchSprite.graphics.endFill();
			
			// center graphic
			touchSprite.x = 750;
			touchSprite.y = (stage.stageHeight - 200) / 2;
			
			// add touch sprite to display list 
			addChild(touchSprite);
			
			// add events 
			touchSprite.affineTransform = true;
			touchSprite.gestureList = {"drag": true};
			touchSprite.addEventListener(GWGestureEvent.DRAG, gestureDragHandler);
		}
		
		private function gestureDragHandler(event:GWGestureEvent):void
		{
			trace(event.value.drag_dx, event.value.drag_dy);
			// move the sprite based on a change in value
			event.target.x += event.value.drag_dx;
			event.target.y += event.value.drag_dy;
		}
	
	}

}