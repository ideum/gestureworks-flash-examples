package gestures
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class DragInertiaBoundary extends GestureWorks
	{
		public function DragInertiaBoundary():void
		{
			gml = "gml/drag-inertia-boundary.gml";
		}
		
		override protected function gestureworksInit():void
		{
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("drag-inertia-boundary");
			exTemp.createDesc("<p>The drag-inertia-boundary gesture is designed to provide object drag functionality using any number of touch points. A filter is " 
			+ "applied within the gesture's \"processing\" tag to enable inertia and transformation boundaries are set on the return values in the mapping block to prevent the object from translating beyond a specific range defined for each axis.<br /><br />"
			+"This example moves the square, within the boundaries, on each drag event and applies " + "inerita with a friction of 0.9 on rlease.");
			addChild(exTemp);			
			
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
			
			//enable release inertia
			touchSprite.releaseInertia = true;
			
			// add events 
			touchSprite.nativeTransform = true;
			touchSprite.gestureList = {"drag-inertia-boundary": true};
		}
	
	}

}