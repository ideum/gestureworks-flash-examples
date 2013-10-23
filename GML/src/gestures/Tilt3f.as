package gestures
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.geom.ColorTransform;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class Tilt3f extends GestureWorks
	{
		public function Tilt3f():void
		{
			gml = "gml/tilt-3f.gml";
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");
			
			// entry point			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("tilt-3f");
			exTemp.createDesc("<p>The tilt gesture is triggered when two touch points are held stationary and the third point is pulled away. The change in the separation \"dsx\" and \"dsy\" is calculated "
				+"and returned to the gesture dimensions \"tilt_dx\" and \"tilt_dy\" respectively.</p><br />" 
				
				+"<p>In this example, the \"tilt-3f\" gesture only works with three touch points. Dimension values are only returned if the change in cluster separation is above the minimum threshold of \"0.015\" pixels. " 
				+"If the threshold is met then the value is passed through the multiply filter which acts to amplify the change in separation so that it becomes 1000 times larger.</p><br />" 
				
				+"<p>This example applies the tilt_dy delta to rotate the square around its x-axis.</p><br />");
			
			// create a touchable sprite 
			var touchSprite:TouchSprite = new TouchSprite();
			
			// draw a simple graphic
			touchSprite.graphics.beginFill(0xFF0000);
			touchSprite.graphics.drawRect(-250, -250, 500, 500);
			touchSprite.graphics.endFill();
			
			// align graphic
			touchSprite.x = ((stage.stageWidth) / 2) + 225
			touchSprite.y = ((stage.stageHeight) / 2);
			
			// add touch sprite to display list 
			addChild(touchSprite);
			
			// add events 
			touchSprite.gestureList = {"3-finger-tilt":true};
			touchSprite.addEventListener(GWGestureEvent.TILT, onTilt);
			
			function onTilt(event:GWGestureEvent):void
			{
				trace("tilt");
				trace("tilt_dsx:", event.value.tilt_dx);
				trace("tilt_dsy:", event.value.tilt_dy);	
				event.target.rotationX += event.value.tilt_dy;
			}
		
		}
	}
}