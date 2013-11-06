package as3.elements
{
	import com.gestureworks.cml.element.Image;
	import com.gestureworks.cml.element.ScrollBar;
	import com.gestureworks.cml.element.ScrollPane;
	import com.gestureworks.cml.element.TouchContainer;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class ScrollPaneEx extends GestureWorks
	{
		public function ScrollPaneEx():void
		{
			gml = "gml/gestures.gml";		
		}
		
		override protected function gestureworksInit():void
		{
			// entry point			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("ScrollPane");
			exTemp.createDesc("<p>This class provides a mechanism to horizontally or vertically scroll content that exceeds the container's dimensions. Content can be scrolled by dragging " + "the object directly or by using the vertical/horizontal scroll bars.<br /><br />See Also: ScrollBar</p>");
			
			var sp:ScrollPane = new ScrollPane();
			sp.x = 600;
			sp.y = 50;
			sp.width = 500;
			sp.height = 400;			
			sp.releaseInertia = true;
			sp.gestureList = { "n-drag-inertia": true, "n-scale-inertia": true };
			
			var scrollBar:ScrollBar = new ScrollBar;
			scrollBar.buttonFill = 0x222222;
			scrollBar.fill = 0x333333;
			scrollBar.thumbFill = 0x553344;
			scrollBar.width = 20;
			scrollBar.railShape = "roundRectangle";
			scrollBar.cornerHeight = 15;
			scrollBar.cornerWidth = 15;
			sp.addChild(scrollBar);
			
			var img:Image = new Image();
			sp.addChild(img);
			img.addEventListener(StateEvent.CHANGE, onLoad);
			img.open("assets/images/smoke.jpg");
			
			function onLoad(e:StateEvent):void {
				sp.init();
				img.init();
				scrollBar.init();
				addChild(sp);				
			}

		}
	
	}

}