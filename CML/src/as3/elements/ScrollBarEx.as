package as3.elements
{
	import com.gestureworks.cml.elements.ScrollBar;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class ScrollBarEx extends GestureWorks
	{
		
		public function ScrollBarEx():void
		{
			gml = "gml/gestures.gml";		
		}
		
		override protected function gestureworksInit():void
		{
			
			// entry point			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("ScrollBar");
			exTemp.createDesc("<p>This class provides a mechanism to horizontally or vertically scroll content. The content is intended to be repositioned in its container relative to the scroll bar's position " + "on its rail.<br /><br />See Also: ScrollPane</p>");
			
			var sb:ScrollBar = new ScrollBar();
			sb.x = 500;
			sb.y = 360;
			sb.fill = 0xFFFFFF;
			sb.orientation = "horizontal";
			sb.contentWidth = 2000;
			sb.width = 700;
			sb.height = 25;
			sb.init();
			addChild(sb);
		}
	
	}

}