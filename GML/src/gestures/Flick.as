package gestures
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.geom.ColorTransform;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class Flick extends GestureWorks
	{
		public function Flick():void
		{
			gml = "gml/flick.gml";
		}
		
		override protected function gestureworksInit():void
		{
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("flick");
			exTemp.createDesc("<p>The 'flick' gesture can be activated by any number of touch points. When a touch down is recognized on a touch object, the velocity and acceleration of the touch points "
			+ "are tracked. If acceleration of the cluster is above the acceleration threshold a flick event is dispatched.<br /><br />The acceleration threshold is defined in the \"variables\" tag in the "
			+ "\"analysis\" block. In the GML file, the var=\"etm_ddx\" has an allowable min value of var_min=\"2\". This sets minimum value of two on the variable \"etm_ddx\" (mean acceleration in the x direction "
			+ "if the average group acceleration of the touch point cluster is below 2 pixels per second the return value of the dimensions is set to zero. if both dimensions have a zero value, the gesture "
			+ "will be put in an inactive state and no event will dispatch.<br /><br />This example randomly changes the color of the square on each flick event. It also traces the return values to the output window.");
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
			touchSprite.gestureList = {"flick": true};
			touchSprite.addEventListener(GWGestureEvent.FLICK, gestureEventHandler);
		}
		
		private function gestureEventHandler(e:GWGestureEvent):void
		{
			trace(e.value.flick_dx, e.value.flick_dy);
			var c:ColorTransform = e.target.transform.colorTransform;
			c.color = Math.random() * 0xFFFFFF;
			e.target.transform.colorTransform = c;			
		}
	
	}

}