package gestures
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class StrokeLetterUpper extends GestureWorks
	{
		public function StrokeLetterUpper():void
		{
			gml = "gml/stroke-letter-upper.gml";
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");
			
			// entry point			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("stroke_letter_upper");
			exTemp.createDesc("This gesture object describes a single finger stroke or \"uni-stroke\" gesture. When a user places one touch point on a touch object and draws a path the gesture compares the " + "captured path to the path described in the gesture object and returns a discrete gesture event if it is a match. The exact path and number of touch points are defined in the <match> tag. " + "<br /><br />The process of comparing the GML defined path to a captured path is defined by a series of functions in the \"vectormetric\" referenced in the <analysis> block. This process involves normalizing " + "the number of points used to describe the sample vector path, scaling the sample path so that it is comparatively the same size as the reference path, then finding the cumulative difference between " + "the reference path trajectory and the captured sample path. This returns a probability value which is defined as one of the standard gesture object dimensions. If the probability of the stroke match " + "is below 0.7 a gesture event will not be dispatched. This gesture has a total of three dimensions: \"stroke_prob\" returns the match probability of the reference and sample path, then \"stroke_x\" and " + "\"stroke_y\" which define the x and y coordinates of the center of the stroke sample path.<br /><br />This example will trace the uppercase letter matching the path in the stroke event to the output window.");
			
			// create a touchable sprite 
			var touchSprite:TouchSprite = new TouchSprite();
			
			// draw a simple graphic
			touchSprite.graphics.beginFill(0xFF0000);
			touchSprite.graphics.drawRect(0, 0, 400, 400);
			touchSprite.graphics.endFill();
			
			// center graphic in the middle of the stage
			touchSprite.x = 650;
			touchSprite.y = (stage.stageHeight - 400) / 2;
			
			// add touch sprite to display list
			touchSprite.debugDisplay = true;
			addChild(touchSprite);
			
			// add events 
			touchSprite.affineTransform = true
			touchSprite.gestureList = {"letter-D": true};
			touchSprite.addEventListener(GWGestureEvent.STROKE_LETTER, gestureHandler);
		}
		
		private function gestureHandler(e:GWGestureEvent):void
		{
			trace(e.value.id);
		}
	}

}