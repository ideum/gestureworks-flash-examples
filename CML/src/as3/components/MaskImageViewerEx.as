package as3.components 
{
	import as3.components.ui.InfoPanel;
	import as3.components.ui.ViewerMenu;
	import com.gestureworks.cml.components.MaskImageViewer;
	import com.gestureworks.cml.elements.Frame;
	import com.gestureworks.cml.elements.Image;
	import com.gestureworks.cml.elements.MaskContainer;
	import com.gestureworks.cml.utils.DisplayUtils;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.events.Event;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class MaskImageViewerEx extends GestureWorks 
	{
		private var maskedImages:Array = new Array("assets/spectrum/bulbs_off_therm.jpg",
													"assets/spectrum/bulbs_off_uv.jpg",
													"assets/spectrum/bulbs_therm.jpg",
													"assets/spectrum/bulbs_uv.jpg",
													"assets/spectrum/bulbs_uv_pure.jpg",
													"assets/spectrum/bulbs_ir.jpg",
													"assets/spectrum/bulbs_xray.jpg");
		
		public function MaskImageViewerEx():void 
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void 
		{	
			//Description
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("Mask Image Viewer");
			exTemp.createDesc("<p>Viewer classes are used as larger containers which help to combine menu items and extra functionality with elements.</p><br /><p>"
			+"The viewer here provides a helpful frame to give an idea of the boundaries of the maskContainer, gives an easy area to touch since the MaskContainer "
			+"itself has its own context-sensitive touch, and places an info button to gain more information about the subject.</p><br /><p>"
			+"This example loads a MaskContainer, and flips it with an info-panel.</p>");
			addChild(exTemp);
			
			//Mask Image Viewer Component
			var maskImageViewer:MaskImageViewer = new MaskImageViewer();
			maskImageViewer.x = 500;
			maskImageViewer.y = 100;
			maskImageViewer.mouseChildren = true;			
			maskImageViewer.gestureList = { "n-drag":true, "n-scale":true, "n-rotate":true};			
			addChild(maskImageViewer);
											
			//FRONT: the base image that the mask will appear over
			var baseImage:Image = new Image();
			baseImage.targetParent = true;
			baseImage.width = 600;
			baseImage.resample = true;
			baseImage.addEventListener(Event.COMPLETE, baseComplete);
			baseImage.open("assets/spectrum/bulbs_vis.jpg");
			maskImageViewer.addChild(baseImage);
			
			//mask element
			var maskContainer:MaskContainer = new MaskContainer();
			maskContainer.gestureList = { "n-drag":true, "n-scale":true, "n-rotate":true, "n-double_tap":true };
			maskContainer.maskShape = "rectangle";
			maskContainer.maskWidth = 200;
			maskContainer.maskHeight = 100;
			maskContainer.maskBorderColor = 0x4CC7FF;
			maskContainer.maskBorderStroke = 2;
			maskContainer.maskBorderAlpha = 0.75;
			maskImageViewer.addChild(maskContainer);
			maskImageViewer.maskCon = maskContainer;			
			
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
					maskImageViewer.addChild(maskContainer);
					maskImageViewer.childToList("mask_element", maskContainer);
					maskContainer.init();
				}
			}
			
			//BACK: info panel
			var infoPanel:InfoPanel = new InfoPanel();
			infoPanel.bkgColor = 0x6699FF;
			infoPanel.tFontSize = 20;
			infoPanel.dFontSize = 16;
			infoPanel.title = "Light Bulbs";
			infoPanel.descr = "Light bulbs viewed through various types of imaging using thermal, infrared, UV, X-ray, and visible light.";
			maskImageViewer.addChild(infoPanel);
			maskImageViewer.back = infoPanel;			
			
			//Frame
			var frame:Frame = new Frame();
			frame.frameColor = 0x6498B2;
			frame.targetParent = true;
			frame.mouseChildren = false;
			maskImageViewer.addChild(frame);			
						
			// Menu
			var menu:ViewerMenu = new ViewerMenu();
			menu.btnColor = 0x6498B2;
			maskImageViewer.addChild(menu);			
						
			function baseComplete(e:Event):void {
				baseImage.removeEventListener(Event.COMPLETE, baseComplete);
				maskImageViewer.width = baseImage.width;
				maskImageViewer.height = baseImage.height;											
				
				DisplayUtils.initAll(maskImageViewer);
			}
		}
	}
	
}