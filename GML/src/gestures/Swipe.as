package gestures
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class Swipe extends GestureWorks
	{
		public function Swipe():void
		{
			gml = "gml/swipe.gml";
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");
			
			// entry point			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("swipe");
			exTemp.createDesc("The 'swipe' gesture can be activated by any number of touch points. When a touch down is recognized on a touch object, the velocity and acceleration of the touch points are " + "tracked. If acceleration of the cluster is below the acceleration threshold a swipe event is dispatched.<br /><br />The acceleration threshold is defined in the \"<variables>\" tag in the \"<analysis>\" " + "block. In the example below the var=\"etm_ddx\" has an allowable maximum value of var_max=\"1\". This sets maximum value of 1 on the variable \"etm_ddx\" (mean acceleration in the x direction). " + "If the average group acceleration of the touch point cluster is greater than 1 pixle per second per second, the return value of the dimension is set to zero. If both dimensions are have zero value " + "the gesture will be put in an inactive state and no event will dispatched.<br /><br />This example traces the return values to the output window on each swipe event.");
			
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
			touchSprite.gestureList = {"swipe": true};
			touchSprite.addEventListener(GWGestureEvent.SWIPE, gestureEventHandler);
		}
		
		private function gestureEventHandler(e:GWGestureEvent):void
		{
			trace(e.value.swipe_dx, e.value.swipe_dy);
		}
	}

}