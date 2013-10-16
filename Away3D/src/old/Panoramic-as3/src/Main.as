package 
{
	import com.gestureworks.cml.element.Image;
	import com.gestureworks.cml.element.Panoramic;
	import com.gestureworks.cml.element.TouchContainer;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.events.Event;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class Main extends GestureWorks 
	{
		private var counter:Number = 0;
		private var pano:Panoramic;
		
		public function Main():void 
		{
			
			
		}
		
		override protected function gestureworksInit():void 
		{
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("Panoramic");
			exTemp.createDesc("<p>This class is used to load in panorama files using Away3D. Panoramic types that can be loaded are Cubic (projectionType=\"cube\") or Spherical (projectionType=\"sphere\").</p><br /><p>Panoramic images can only go up to 2048 pixels in texture, and for any size smaller they must be a power of 2 (ie: 512, 1024, 2048.) This means cubic panoramic image files can each be up to 2048 x 2048, and for a spherical panorama the longest side for the image must be 2048 or a power of 2 less. The image file itself does not need to have its dimensions altered, the width and height properties can be set in CML or Actionscript.</p><br /><p>In this example, the panorama viewer loads in a cubic panorama by being directed to the six files necessary. Note that for cubic panoramas it is important that they are loaded in this order: right, left, up, down, front, back.</p><br /><p>Once loaded, the panorama can be navigated by dragging, and by two finger scaling (pinch/zoom).</p>");
			
			
			
			//Genearate the actual panorama element with settings.
			pano = new Panoramic();
			pano.projectionType = "cube";
			pano.cubeFace = true;
			pano.width = 700;
			pano.height = 500;
			pano.x = 500;
			pano.mouseChildren = true;
			
			// Generate a touch container to control the touch interaction.
			var touchC:TouchContainer = new TouchContainer();
			touchC.nestedTransform = false;
			touchC.gestureEvents = true;
			touchC.mouseChildren = false;
			touchC.disableAffineTransform = true;
			touchC.disableNativeTransform = true;
			touchC.gestureList = { "n-drag":true, "n-scale":true };
			touchC.init();
			
			// The images need to be loaded in a specific order: right, left, up, down, front, back.
			// The parser will load them in the fastest order, so we'll attach event listeners to each
			// image, then add them to the pano's display list in the proper order.
			
			var imageBack:Image = new Image();
			imageBack.width = 1024;
			imageBack.addEventListener(Event.COMPLETE, imageComplete);
			imageBack.open("../../../../_assets/panoramic/30kabah_b.jpg");
			
			
			var imageLeft:Image = new Image();
			imageLeft.width = 1024;
			imageLeft.addEventListener(Event.COMPLETE, imageComplete);
			imageLeft.open("../../../../_assets/panoramic/30kabah_l.jpg");
			
			
			var imageFront:Image = new Image();
			imageFront.width = 1024;
			imageFront.addEventListener(Event.COMPLETE, imageComplete);
			imageFront.open("../../../../_assets/panoramic/30kabah_f.jpg");
			
			
			var imageRight:Image = new Image();
			imageRight.width = 1024;
			imageRight.addEventListener(Event.COMPLETE, imageComplete);
			imageRight.open("../../../../_assets/panoramic/30kabah_r.jpg");
			
			
			var imageUp:Image = new Image();
			imageUp.width = 1024;
			imageUp.addEventListener(Event.COMPLETE, imageComplete);
			imageUp.open("../../../../_assets/panoramic/30kabah_u.jpg");
			
			
			var imageDown:Image = new Image();
			imageDown.width = 1024;
			imageDown.addEventListener(Event.COMPLETE, imageComplete);
			imageDown.open("../../../../_assets/panoramic/30kabah_d.jpg");
			
			
			function imageComplete(e:Event):void {
				e.target.removeEventListener(Event.COMPLETE, imageComplete);
				e.target.init();
				
				if ( counter == 5 ) {
					
					// Here we actually add the images to the pano's display list in the appropriate order:
					// Right, Left, Up, Down, Front, Back.
					pano.addChild(imageRight);
					pano.addChild(imageLeft);
					pano.addChild(imageUp);
					pano.addChild(imageDown);
					pano.addChild(imageFront);
					pano.addChild(imageBack);
					
					// Here we add the touch container to receive touch.
					pano.addChild(touchC);
					
					addChild(pano);
					
					// Finally, initialize the pano. If initialization is attempted before the images are loaded, it will fail.
					// Likewise, if initialized before added as a child, it will fail.
					pano.init();
				}
				else { counter++; }
			}
		}
	}
	
}