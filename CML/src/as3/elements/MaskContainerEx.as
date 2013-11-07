package as3.elements 
{
	import com.gestureworks.cml.elements.Image;
	import com.gestureworks.cml.elements.MaskContainer;
	import com.gestureworks.cml.elements.TouchContainer;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.events.Event;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class MaskContainerEx extends GestureWorks 
	{
		private var maskedImages:Array = new Array("assets/spectrum/bulbs_off_therm.jpg",
													"assets/spectrum/bulbs_off_uv.jpg",
													"assets/spectrum/bulbs_therm.jpg",
													"assets/spectrum/bulbs_uv.jpg",
													"assets/spectrum/bulbs_uv_pure.jpg",
													"assets/spectrum/bulbs_ir.jpg",
													"assets/spectrum/bulbs_xray.jpg");
		
		public function MaskContainerEx():void 
		{
			gml = "gml/gestures.gml";			
		}
		
		override protected function gestureworksInit():void 
		{			
			// entry point
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("Mask Container");
			exTemp.createDesc("<p>This class is used to set up a series of images to use with a floating mask that can be dragged, scaled, and rotated via touch. The purpose is to give the appearance of filtering through images, or revealing \"hidden\" details that only the mask can see.</p><br /><p>The MaskContainer itself will mask out any display objects contained within its tags (including Texts and Graphics) so that the display object can only be seen within the area of the MaskContainer. The maskShape may either be a \"rectangle\" or a \"circle\".</p><br /><p>For a rectangle, you will set the maskWidth and maskHeight attributes, for a circle you will set maskRadius. The mask has a border to aid in visibility, and can be made invisible by setting maskBorderAlpha=\"0\".</p><br /><p>If the mask has multiple images that it holds, a user may double-tap if the Gesture is enabled in the gesture list to flip through the various pictures.</p><br /><p>The MaskContainer itself may be included inside other containers and frames.</p>");
			
			// Load the base image that the mask will appear over
			var baseImage:Image = new Image();
			baseImage.x = 500;
			baseImage.y = 150;
			baseImage.width = 600;
			baseImage.resample = true;
			baseImage.open("assets/spectrum/bulbs_vis.jpg");
			addChild(baseImage);
			
			var maskContainer:MaskContainer = new MaskContainer();
			maskContainer.x = 500;
			maskContainer.y = 150;
			maskContainer.mouseChildren = true;
			var maskTouchContainer:TouchContainer = new TouchContainer();
			maskTouchContainer.gestureList = { "n-drag":true, "n-scale":true, "n-rotate":true, "n-double_tap":true };
			maskContainer.addChild(maskTouchContainer);
			// Set up the actual attributes of the mask.
			maskContainer.maskShape = "rectangle";
			maskContainer.maskWidth = 100;
			maskContainer.maskHeight = 64;
			maskContainer.maskBorderColor = 0xff0000;
			maskContainer.maskBorderStroke = 2;
			maskContainer.maskBorderAlpha = 0.75;
			
			// Loop through our array of files and load them.
			for each (var s:String in maskedImages) {
				var i:Image = new Image();
				i.width = 600;
				i.visible = false;
				i.open(s);
				i.addEventListener(Event.COMPLETE, imageLoaded);
			}
			
			var loaded:Number = 0;
			function imageLoaded(e:Event):void {
				e.target.removeEventListener(Event.COMPLETE, imageLoaded);
				
				// Add each image to be masked to the container once loaded.
				maskContainer.addChild(Image(e.target));
				maskContainer.childToList("image", Image(e.target));
				loaded++;
				if (loaded == maskedImages.length) {
					addChild(maskContainer);
					maskContainer.init();
				}
			}
		}
		
	}
	
}