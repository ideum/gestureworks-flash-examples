package gestures 
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate="60")]
	
	public class ManipulateFilters extends GestureWorks 
	{
		public function ManipulateFilters():void 
		{		
			gml = "gml/manipulate-filters.gml";
		}
		
		override protected function gestureworksInit():void 
		{
			trace("gestureWorksInit()");						
			
			// entry point			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("manipulate-filters");
			exTemp.createDesc("The manipulate-filters gesture is a single gesture that combines three transformation analysis steps in three separate gesture objects into one.<br /><br />Filters are " +
			"applied to the gesture's inertia, deltas, and boundaries within the \"processing\" tag to restrict the dimension values to a specific range.<br /><br />The example demonstrates the boundary filter " +
			"by preventing the TouchSprite from being dragged outside of the range defined by the boundary_min and boundary_max values on each axis. The delta filters cap the drag a scale deltas to a defined maximum " +
			"and an inertial friction of 0.9 is applied on release.")
			
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
			touchSprite.gestureReleaseInertia = true;
			
			// add events 
			touchSprite.nativeTransform = true;
			touchSprite.gestureList = { "manipulate-filters":true };
		}		
	}
	
}