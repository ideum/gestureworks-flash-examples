package gestures
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class DragY extends GestureWorks
	{
		public function DragY():void
		{
			gml = "gml/drag-y.gml";
		}
		
		override protected function gestureworksInit():void
		{	
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("drag-y");
			exTemp.createDesc("<p>The drag-y gesture is designed to provide vertical drag functionality. The translation is limited to the y axis by only analyzing y delta.<br /><br />This example moves the square along the y-axis on each drag event meeting the defined criteria.");
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
			touchSprite.gestureList = {"drag-y": true};
		}
	
	}

}