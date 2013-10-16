package techniques
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.events.KeyboardEvent;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class ResetInertia extends GestureWorks
	{
		public function ResetInertia():void
		{
			gml = "assets/n-drag-inertia-boundary.gml";
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");
			
			// entry point			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("Reset Inertia");
			exTemp.createDesc("<p>You may need to reset the inertia cache for various reasons. Removing the event listener will simply stop listening to the event. The event " + "is still processed in the background, so at any point you can listen to it again. One way to reset the intertia is to reset the gesture by re-initializing the gestureList.</p><br />" + "<p>This example demonstrates this technique by re-initializing the gestureList on any keyboard input. Toss the square and press a keyboard button to stop and reset the inertia.</p>");
			
			// create a touchable sprite 
			var touchSprite:TouchSprite = new TouchSprite();
			
			// draw a simple graphic
			touchSprite.graphics.beginFill(0xFF0000);
			touchSprite.graphics.drawRect(0, 0, 200, 200);
			touchSprite.graphics.endFill();
			
			// align the graphic
			touchSprite.x = 750;
			touchSprite.y = (stage.stageHeight - 200) / 2;
			
			// add touch sprite to display list 
			addChild(touchSprite);
			
			//enable release inertia
			touchSprite.gestureReleaseInertia = true;
			
			// add gesture and configure
			touchSprite.affineTransform = true;
			touchSprite.nativeTransform = true;
			touchSprite.gestureList = {"n-drag-inertia-boundary": true};
			
			// store gesture object for later use
			var gestureList:Object = touchSprite.gestureList;
			
			// key input toggles re-initialization of gestureList
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKey);
			
			function onKey(e:KeyboardEvent):void
			{
				touchSprite.gestureList = null;
				touchSprite.gestureList = gestureList;
			}
		
		}
	
	}
}