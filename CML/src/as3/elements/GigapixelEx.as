package as3.elements
{
	import com.gestureworks.cml.elements.Gigapixel;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class GigapixelEx extends GestureWorks
	{	
		public function GigapixelEx():void
		{
			gml = "gml/gestures.gml";		
		}
		
		override protected function gestureworksInit():void
		{		
			//Description
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("Gigapixel Element");
			exTemp.createDesc("<p>This class is used to load in a gigapixel image. Gigapixel images are massive images made by tiling smaller images in a seamless, pyramid structured fashion.</p><br /><p>"
			+"The Gigapixel will always maintain its aspect ratio, so you only need to give it a width or a height. If given both width and height, the element will simply have a viewable area of that size, but will not necessarily fill that area until zoomed in.</p><br/><p>"
			+"The Gigapixel loads a base xml file that references its branching folders to get the actual images.</p><br />");
			addChild(exTemp);		
			
			var gpElement:Gigapixel = new Gigapixel();
			gpElement.src = "assets/deepzoom/space.xml";
			gpElement.x = 500;
			gpElement.width = 600;
			gpElement.height = 600;
			addChild(gpElement);
			gpElement.init();
		}
	
	}

}