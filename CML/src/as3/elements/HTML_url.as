package as3.elements
{
	import com.gestureworks.cml.elements.HTML;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class HTML_url extends GestureWorks
	{
		public function HTML_url():void
		{
			gml = "gml/gestures.gml";			
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");		
			// entry point
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("HTML");
			exTemp.createDesc("<p>This class loads a url or inline HTML using the WebKit AIR Browser.</p>");
			
			var html:HTML = new HTML();			
			html.x = 650;
			html.y = 100;
			html.width = 600;
			html.height = 500;
			html.src = "http://ideum.com/";
			html.init();
			addChild(html);
		}
	}
}