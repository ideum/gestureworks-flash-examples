package as3.elements
{
	import com.gestureworks.cml.elements.Button;
	import com.gestureworks.cml.elements.Graphic;
	import com.gestureworks.cml.elements.Image;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class ButtonImagesEx extends GestureWorks
	{
		public function ButtonImagesEx():void
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			// entry point			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("ImageButton");
			exTemp.createDesc("<p>The Button hides or shows DisplayObjects on specified state events. The available button states are initial, down, up, over and out.<br /><br />" + "This example demonstrates a simple button contstructed of external image files. Each image will be visible when its associated button states occur.</p>" + "<br/><p>See also:<br />Button<br />Image<br /></p>");
			
			var button:Button = new Button();
			button.x = 500;
			button.y = 100;
			button.dispatch = "down:toggle-text";
			
			//assign images to button states
			button.hit = getHitArea();
			button.initial = getImage("assets/images/800px-M104_ngc4594_sombrero_galaxy_hi-res.jpg");
			button.down = getImage("assets/images/800px-Messier51_sRGB.jpg");
			button.up = getImage("assets/images/800px-M104_ngc4594_sombrero_galaxy_hi-res.jpg");
			button.over = getImage("assets/images/800px-Messier51_sRGB.jpg");
			button.out = getImage("assets/images/800px-M104_ngc4594_sombrero_galaxy_hi-res.jpg");
			
			button.init();
			addChild(button);
		}
		
		/**
		 * Returns a square graphic the size of the images
		 * @return
		 */
		private function getHitArea():Graphic
		{
			var hit_area:Graphic = new Graphic;
			hit_area.shape = "rectangle";
			hit_area.width = 800;
			hit_area.height = 555;
			hit_area.alpha = 0;
			return hit_area;
		}
		
		/**
		 * Returns an image element from the external source
		 * @param	source
		 * @return
		 */
		private function getImage(source:String):Image
		{
			var img:Image = new Image();
			img.open(source);
			return img;
		}
	
	}

}