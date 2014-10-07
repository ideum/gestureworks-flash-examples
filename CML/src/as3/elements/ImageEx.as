package as3.elements 
{
	import com.gestureworks.cml.elements.Image;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class ImageEx extends GestureWorks 
	{
		public function ImageEx():void 
		{
			gml = "gml/gestures.gml";			
		}
		
		override protected function gestureworksInit():void 
		{
			// entry point			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("Image Element");
			exTemp.createDesc("<p>This class allows you to load and display jpg, png, or gif image files.</p>");
			
			// Set the file path using the src attribute. File paths are relative to the executable or swf file.
			var img1:Image = new Image();
			img1.src = "assets/images/plane.jpg";
			img1.scale = 0.6;
			img1.x = 460;
			img1.y = 50;
			img1.init();
			addChild(img1);
			
			// Downsampling can improve performance. You can set just one dimension to maintain the original aspect ratio.			
			var img2:Image = new Image();
			img2.src = "assets/images/train.jpg";
			img2.width = 300;
			img2.resample = true;
			img2.x = 950;
			img2.y = 350;
			addChild(img2);
		}
		
	}
	
}