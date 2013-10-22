package gestures
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class Manipulate extends GestureWorks
	{
		public function Manipulate():void
		{
			gml = "gml/manipulate.gml";
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");
			
			// entry point			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("manipulate");
			exTemp.createDesc("The manipulate gesture is a single gesture that combines three transformation analysis steps in three separate gesture objects into one.<br /><br />The change in the translation, scale "
			+ "and rotation of the touch point cluster is calculated using the \"manipulate\" algorithm and returned in five independent gesture object dimensions: \"dx\" , \"dy\" , \"dsx\" , \"dsy\" and "
			+ "\"dtheta\".<br /><br />As long as the matching criteria is met (one to ten touch points are recognized by the touch object), the values are continuously queried and dispatched in a structured gesture "
			+ "event that maps the dimensions to: \"x\" , \"y\" , \"scaleX\", \"scaleY\" and \"rotation\".<br /><br />This example translates, scales, and rotates the square on each manipulate event.");
			
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
			touchSprite.gestureList = {"manipulate": true};
		}
	}

}