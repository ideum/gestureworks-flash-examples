package as3.elements 
{
	import com.gestureworks.cml.element.Image
	import com.gestureworks.cml.element.Magnifier;
	import com.gestureworks.cml.element.TouchContainer;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class MagnifierEx extends GestureWorks 
	{
		public function MagnifierEx():void 
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void 
		{
			// entry point
			
			// Instantiate the whole stage so there's graphic data on every pixel.
			
			var sprite:Sprite = new Sprite();
			sprite.graphics.beginFill(0xff0000, 0);
			sprite.graphics.drawRect( 0,0, stage.stageWidth, stage.stageHeight);
			sprite.graphics.endFill();
			addChild(sprite);
			
			//Background image
			
			var bgImage:Image = new Image();
			bgImage.src = "assets/images/oe_bg_720.png";
			bgImage.open(bgImage.src);
			addChild(bgImage);
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("Magnifier");
			exTemp.createDesc("<p>This class is used to load images in from Flickr using the Flickr API. It can be placed inside a viewer, containers, and collection viewers.</p><br /><p>You will need two things to load a picture from Flickr: a picture ID, and an API Key. Your API key is something you can sign up for free at <a href=\"http://www.flickr/com/service/api\"> http://www.flickr/com/service/api</a> to allow you to submit queries to the Flickr database.</p><br /><p>This example will not actually load a picture until you set the API key property with your own key.</p><br /><p>Pictures must be public and available to be accessed.</p>");
			
			//Image to look at
			var image:Image = new Image();
			image.src = "assets/images/foot.png";
			image.x = 500;
			image.height = 600;
			image.y = 60;
			image.resample = true;
			addChild(image);
			image.open(image.src);
			
			// Image that we can move around. Objects moved beneath the magnifier will also be magnified, just like with a real lens.
			var imageContainer:TouchContainer = new TouchContainer();
			imageContainer.x = 900;
			imageContainer.y = 250;
			
			var touchImage:Image = new Image();
			touchImage.src = "assets/images/bee.jpg";
			touchImage.open(touchImage.src);
			// Add the image to our touch container, so it's touchable.
			imageContainer.addChild(touchImage);
			//Create the gestures for our touch container
			imageContainer.gestureEvents = true;
			imageContainer.gestureList = { "n-drag":true, "n-rotate":true, "n-scale":true };
			imageContainer.width = 500;
			imageContainer.height = stage.height;
			imageContainer.x = stage.width / 2;
			addChild(imageContainer);
			imageContainer.init();
			
			//Now add the actual magnifier.
			var magnifier:Magnifier = new Magnifier();
			magnifier.x = 750;
			magnifier.y = 150;
			magnifier.radius = 100;
			magnifier.magnification = 2;
			magnifier.distortionRadius = 40;
			magnifier.graphic = "default";
			
			stage.addChild(magnifier);
			
			magnifier.init();
		}
		
	}
	
}