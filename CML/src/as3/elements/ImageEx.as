package as3.elements 
{
	import com.gestureworks.cml.element.Image;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class ImageEx extends GestureWorks 
	{
		public function ImageEx():void 
		{
			
		}
		
		override protected function gestureworksInit():void 
		{
			
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("Image Element");
			exTemp.createDesc("<p>This tag allows you to load and display external image files such as jpg, png, etc.</p><br /><p>This tag also allows for scaling and resampling.</p>");
			
			// Set the file path using the src attribute. File paths are relative to the executable or swf file.
			
			var img1:Image = new Image();
			img1.src = "assets/images/plane.jpg";
			img1.scale = 0.6;
			img1.x = 460;
			img1.y = 50;
			img1.open(img1.src);
			addChild(img1);
			
			// Downsampling can improve performance. You can set just one dimension to maintain the original aspect ratio.
			
			var loadString:String = "assets/images/train.jpg";
			var img2:Image = new Image();
			img2.open(loadString);
			img2.width = 300;
			img2.resample = true;
			img2.x = 950;
			img2.y = 350;
			addChild(img2);
		}
		
	}
	
}