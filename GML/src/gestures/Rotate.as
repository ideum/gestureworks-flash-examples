package gestures
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class Rotate extends GestureWorks
	{
		public function Rotate():void
		{
			gml = "gml/rotate.gml";
		}
		
		override protected function gestureworksInit():void
		{	
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("rotate");
			exTemp.createDesc("The Rotate gesture is designed to provide object rotation functionality using any number of touch points. It is considered to be one of the three fundamental object "
			+ "manipulation gestures.<br /><br />This gesture can be activated by any number of touch points between 2 and 10. When two or more touch points are recognized on a touch object the relative "
			+ "orientation of the touch points are tracked and grouped into a cluster. This change in the orientation of the cluster is mapped directly to the rotation of the touch object.<br /><br />This "
			+ "example rotates the square around the cluster point center on each rotate event.");
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
			touchSprite.gestureList = {"rotate": true};
		}
	}

}