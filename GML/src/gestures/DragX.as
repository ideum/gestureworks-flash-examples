package gestures
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class DragX extends GestureWorks
	{
		public function DragX():void
		{	
			gml = "gml/drag-x.gml";
		}
		
		override protected function gestureworksInit():void
		{	
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("drag-x-axis");
			exTemp.createDesc("<p>The drag-x gesture is designed to provide horizontal drag functionality. The translation is limited to the x axis by only analyzing the x delta.<br /><br />This example moves the square along the x-axis on each drag event meeting the defined critera.");
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
			touchSprite.affineTransform = true
			touchSprite.nativeTransform = true;
			touchSprite.gestureList = {"drag-x": true};
		}
	
	}

}