package gestures
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class Pivot extends GestureWorks
	{
		public function Pivot():void
		{
			gml = "gml/pivot.gml";
		}
		
		override protected function gestureworksInit():void
		{	
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("pivot");
			exTemp.createDesc("The pivot gesture analyzes the motion of a single touch point cluster and calculates the change in rotation (\"pivot_dtheta\") of a pivot arm drawn from the center of the touch object to the touch point.");
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
			
			// add events 
			touchSprite.nativeTransform = true;
			touchSprite.gestureList = {"pivot": true};
		}
	}

}