package as3.elements
{
	import com.gestureworks.cml.element.Image;
	import com.gestureworks.cml.element.ScrollPane;
	import com.gestureworks.cml.element.TouchContainer;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
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
			sp.width = 500;
			sp.height = 400;
			sp.x = 500;
			sp.y = 100;
			sp.paneStroke = 0;
			sp.scrollThickness = 20;
			sp.mouseChildren = true;
			sp.targetParent = false;
			sp.clusterBubbling = true;
			
			var img:Image = new Image();
			img.open("assets/images/baby.jpg");
			img.width = 600;
			img.height = 500;
			sp.addChild(img);
			
			var tc:TouchContainer = new TouchContainer();
			tc.nativeTransform = false;
			tc.gestureList = {"n-drag": true, "n-scale": true};
			sp.addChild(tc);
			
			sp.init();
			addChild(sp);
		}
	
	}

}