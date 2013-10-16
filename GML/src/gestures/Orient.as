package gestures
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class Orient extends GestureWorks
	{
		public function Orient():void
		{
			gml = "gml/orient.gml";
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");
			
			// entry point			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("orient");
			exTemp.createDesc("The \"orient\" gesture analyzes the orientation of a group of five touch points. The orient algorithm uses the relative position of five touch points to identify which " + "touchpoint is likely to be the user's thumb. The thumb is then removed from the cluster processing and the remaining four fingers are used to establish the approximate orientation of the user's hand. " + "<br /><br />This gesture ONLY works with five touch points and can be used as a reliable measure of user orientation when the hand is placed in a \"natural\" resting position.<br /><br />This example " + "demonstrates the identification of each finger, on the square, through the debug display.");
			
			// create a touchable sprite 
			var touchSprite:TouchSprite = new TouchSprite();
			
			// draw a simple graphic
			touchSprite.graphics.beginFill(0x00FF00);
			touchSprite.graphics.drawRect(0, 0, 500, 500);
			touchSprite.graphics.endFill();
			
			// center graphic in the middle of the stage
			touchSprite.x = (stage.stageWidth - 100) / 2;
			touchSprite.y = (stage.stageHeight - 500) / 2;
			
			// add touch sprite to display list 
			touchSprite.debugDisplay = true;
			addChild(touchSprite);
			
			// add events 
			touchSprite.affineTransform = true
			touchSprite.nativeTransform = true;
			touchSprite.gestureList = {"orient": true};
			touchSprite.addEventListener(GWGestureEvent.ORIENT, gestureHandler);
			
			function gestureHandler(e:GWGestureEvent):void
			{
				trace(e.value.orient_thumbID);
			}
		}
	
	}

}