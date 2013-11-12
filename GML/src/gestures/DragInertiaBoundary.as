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
			exTemp.createDesc("<p>The drag-inertia-boundary gesture is designed to provide object drag functionality using any number of touch points. Filters are " + "applied to the gesture's inertia and boundaries within the \"processing\" tag to restrict the dimension values to a specific range.<br /><br />The example " + "demonstrates the boundary filter by preventing the TouchSprite from being dragged outside of the range, defined by the boundary_min and boundary_max values, on " + "each axis and an inertial friction of 0.9 is applied on release.<br /><br />This example moves the square, within the boundaries, on each drag event and applies " + "inerita on rlease.");
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