package gestures
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.events.GestureEvent;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class Scroll extends GestureWorks
	{
		public function Scroll():void
		{
			gml = "gml/scroll.gml";
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");
			
			// entry point			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("scroll");
			exTemp.createDesc("The 'scroll' gesture can be activated by any number of touch points. When a touch down is recognized on a touch object, the velocity and acceleration of the touch points are " + "tracked. If velocity of the cluster is above the translation threshold a scroll event is dispatched.<br /><br />The value returned in each dimension is temporal mean average of the touch point " + "velocities over set of processing frames as denoted by \"etm_dx\" and \"etm_dy\". This has the effect of evening out changes in the values to that they can be mapped to display object and present " + "smoothed continuous motion.<br /><br />This example traces the return values to the output window.");
			
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
			touchSprite.gestureList = {"scroll": true};
			touchSprite.addEventListener(GWGestureEvent.SCROLL, gestureEventHandler);
		}
		
		private function gestureEventHandler(e:GWGestureEvent):void
		{
			trace(e.value.scroll_dx, e.value.scroll_dy);
		}
	}

}