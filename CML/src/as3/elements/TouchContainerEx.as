package as3.elements
{
	import com.gestureworks.cml.element.Image;
	import com.gestureworks.cml.element.TouchContainer;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	import flash.text.TextField;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class TouchContainerEx extends GestureWorks
	{
		private var cont_square:TouchSprite;
		private var cont_square2:TouchSprite;
		
		public function TouchContainerEx():void
		{
			
			simulator = true;
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");
			
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			   exTemp.createHeader();
			   addChild(exTemp);
			
			   exTemp.createTitle("Touch Container");
			   exTemp.createDesc("<p>This tag can be used to create display hierarchies. It keeps track of children through the childlist property.</p>");
			
			
			   var tc:TouchContainer = new TouchContainer();
			
			   tc.x = 700;
			   tc.y = 300;
			   tc.alpha = .25;
			   tc.scale = 1;
			
			   //touch interactions
			   tc.gestureList = { "n-drag":true, "n-scale":true, "n-rotate":true };
			
			   //loading an image through image element
			   var img:Image = new Image();
			   img.open("assets/images/orchid.jpg");
			   img.x = 0;
			   img.y = 0;
			   img.width = 200;
			   img.rotation = -20;
			   img.id = "img1";
			   img.scale = 2;
			   tc.addChild(img);
			
			   //initialise touch container
			   tc.init();
			
			 addChild(tc);
			
			cont_square = new TouchSprite();
			cont_square2 = new TouchSprite();
			
			cont_square2.x = 500;
			
			var graphic_square:Sprite = new Sprite();
			var graphic_square2:Sprite = new Sprite();
			
			graphic_square.graphics.beginFill(0xff0000);
			graphic_square.graphics.drawRect(0, 0, 300, 300);
			graphic_square.graphics.endFill();
			
			graphic_square2.graphics.beginFill(0x00ff00);
			graphic_square2.graphics.drawRect(0, 0, 300, 300);
			graphic_square2.graphics.endFill();
			
			var txt:TextField = new TextField;
			txt.text = "What's up, buddies!";
			addChild(txt);
			
			cont_square.addChild(graphic_square);
			addChild(cont_square);
			cont_square2.addChild(graphic_square2);
			addChild(cont_square2);
			
			cont_square.disableAffineTransform = cont_square2.disableAffineTransform = false;
			
			cont_square.gestureList = {"n-drag": true, "n-scale": true, "n-rotate": true};
			cont_square2.gestureList = {"n-drag": true, "n-scale": true, "n-rotate": true};
			cont_square.addEventListener(GWGestureEvent.DRAG, drag_handler);
			cont_square.addEventListener(GWGestureEvent.SCALE, scale_handler);
			cont_square.addEventListener(GWGestureEvent.ROTATE, rotate_handler);
			cont_square2.addEventListener(GWGestureEvent.DRAG, drag_handler);
			cont_square2.addEventListener(GWGestureEvent.SCALE, scale_handler);
			cont_square2.addEventListener(GWGestureEvent.ROTATE, rotate_handler);
		}
		
		private function drag_handler(event:GWGestureEvent):void
		{
			trace("drag");
			event.target.$x += event.value.drag_dx;
			event.target.$y += event.value.drag_dy;
		}
		
		private function scale_handler(event:GWGestureEvent):void
		{
			trace("scale");
			event.target.$scaleX += event.value.scale_dsx;
			event.target.$scaleY += event.value.scale_dsy;
		}
		
		private function rotate_handler(event:GWGestureEvent):void
		{
			trace("rotate");
			event.target.$rotation += event.value.rotate_dtheta;
		}
	
	}

}