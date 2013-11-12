package gestures
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class Drag1f extends GestureWorks
	{
		public function Drag1f():void
		{
			gml = "gml/drag-1f.gml";
		}
		
		override protected function gestureworksInit():void
		{		
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("drag-1f");
			exTemp.createDesc("<p>The drag-1f gesture is designed to provide one-finger drag functionality. The touch point requirement is set through the point_number attribute in the \"cluster\" tag");
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
			touchSprite.gestureList = {"drag-1f": true};
		}
	
	}

}