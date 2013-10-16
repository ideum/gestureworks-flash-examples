package as3.elements
{
	import com.gestureworks.cml.element.Graphic;
	import com.gestureworks.cml.element.Image;
	import com.gestureworks.cml.element.Slideshow;
	import com.gestureworks.cml.element.Text;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class SlideshowEx extends GestureWorks
	{
		public function SlideshowEx():void
		{
		
		}
		
		override protected function gestureworksInit():void
		{
			
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("Slideshow");
			exTemp.createDesc("<p>The Slideshow tag allows you to create a slideshow out of any variety of display objects, including text, graphics, images, and containers.</p><br /><p>The Slideshow can even be put inside a viewer or any other container with buttons that allow a user to access Play, Pause, Resume, and Stop.</p><br /><p>The \"rate\" is how long each item is on stage in milliseconds after fading in, the fade duration determines in milliseconds how quickly the fade happens between objects.</p>");
			
			var slideShow:Slideshow = new Slideshow();
			slideShow.x = 500;
			slideShow.y = 100;
			slideShow.rate = 2000;
			slideShow.fadeDuration = 1000;
			slideShow.loop = true;
			slideShow.autoplay = true;
			
			addChild(slideShow);
			
			var text1:Text = new Text();
			text1.width = 800;
			text1.text = "Welcome to the slideshow.";
			text1.color = 0xffffff;
			text1.fontSize = 30;
			
			slideShow.addChild(text1);
			
			var circle:Graphic = new Graphic();
			circle.shape = "circle";
			circle.color = 0xffffff;
			circle.radius = 100;
			
			slideShow.addChild(circle);
			
			var text2:Text = new Text();
			text2.width = 600;
			text2.multiline = true;
			text2.wordWrap = true;
			text2.text = "Even complex, animated objects count as display objects.";
			text2.color = 0xffffff;
			text2.fontSize = 30;
			
			slideShow.addChild(text2);
			
			var text3:Text = new Text();
			text3.width = 600;
			text3.multiline = true;
			text3.wordWrap = true;
			text3.text = "So an entire slideshow can be placed into a stack as a single display object.";
			text3.color = 0xffffff;
			text3.fontSize = 30;
			
			slideShow.addChild(text3);
			
			var img1:Image = new Image();
			img1.src = "assets/images/bee.jpg";
			img1.open(img1.src);
			img1.addEventListener(Event.COMPLETE, imgLoaded);
			
			function imgLoaded(e:Event):void
			{
				img1.removeEventListener(Event.COMPLETE, imgLoaded);
				slideShow.addChild(img1);
				
				slideShow.init();
			}
		}
	
	}

}