package as3.components 
{
	import com.gestureworks.cml.components.MaskImageViewer;
	import com.gestureworks.cml.element.Button;
	import com.gestureworks.cml.element.Container;
	import com.gestureworks.cml.element.Frame;
	import com.gestureworks.cml.element.Graphic;
	import com.gestureworks.cml.element.Image;
	import com.gestureworks.cml.element.MaskContainer;
	import com.gestureworks.cml.element.Menu;
	import com.gestureworks.cml.element.Text;
	import com.gestureworks.cml.element.TouchContainer;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class MaskImageViewerEx extends GestureWorks 
	{
		[Embed(source = "../../../bin/assets/openexhibits_assets.swf", symbol = "org.openexhibits.assets.Info")]
		private var infoBtn:Class;
		
		[Embed(source = "../../../bin/assets/openexhibits_assets.swf", symbol = "org.openexhibits.assets.Close")]
		private var closeBtn:Class;
		
		private var maskedImages:Array = new Array("assets/spectrum/bulbs_off_therm.jpg",
													"assets/spectrum/bulbs_off_uv.jpg",
													"assets/spectrum/bulbs_therm.jpg",
													"assets/spectrum/bulbs_uv.jpg",
													"assets/spectrum/bulbs_uv_pure.jpg",
													"assets/spectrum/bulbs_ir.jpg",
													"assets/spectrum/bulbs_xray.jpg");
		
		public function MaskImageViewerEx():void 
		{
			
		}
		
		override protected function gestureworksInit():void 
		{
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("Mask Image Viewer");
			exTemp.createDesc("<p>Viewer tags are used as larger containers which help to combine menu items and extra functionality with elements.</p><br /><p>The viewer here provides a helpful frame to give an idea of the boundaries of the maskContainer, gives an easy area to touch since the MaskContainer itself has its own context-sensitive touch, and places an info button to gain more information about the subject.</p><br /><p>This example loads a MaskContainer, and flips it with an info-panel.</p>");
			
			var maskImageViewer:MaskImageViewer = new MaskImageViewer();
			
			//The viewer frame
			var frameContainer:TouchContainer = new TouchContainer();
			frameContainer.className = "frame_container";
			frameContainer.visible = true;
			frameContainer.targetParent = true;
			frameContainer.init();
			
			var frame:Frame = new Frame();
			frame.className = "frame_element";
			frame.frameColor = 0x6498B2;
			frameContainer.addChild(frame);
			frameContainer.childToList("frame_element", frame);
			
			// The actual maskImage image.
			var maskImageContainer:TouchContainer = new TouchContainer();
			maskImageContainer.className = "mask_container";
			maskImageContainer.visible = true;
			maskImageContainer.targetParent = true;
			maskImageContainer.init();
			
			// Load the base image that the mask will appear over
			var baseImage:Image = new Image();
			baseImage.width = 600;
			baseImage.resample = true;
			baseImage.addEventListener(Event.COMPLETE, baseComplete);
			baseImage.open("assets/spectrum/bulbs_vis.jpg");
			maskImageContainer.addChild(baseImage);
			
			var maskContainer:MaskContainer = new MaskContainer();
			maskContainer.className = "mask_element";
			maskContainer.mouseChildren = true;
			
			var maskTouchContainer:TouchContainer = new TouchContainer();
			maskTouchContainer.gestureList = { "n-drag":true, "n-scale":true, "n-rotate":true, "n-double_tap":true };
			maskContainer.addChild(maskTouchContainer);
			// Set up the actual attributes of the mask.
			maskContainer.maskShape = "rectangle";
			maskContainer.maskWidth = 200;
			maskContainer.maskHeight = 100;
			maskContainer.maskBorderColor = 0x4CC7FF;
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
					maskImageViewer.addChild(maskContainer);
					maskImageViewer.childToList("mask_element", maskContainer);
					maskContainer.init();
				}
			}
			
			maskImageViewer.addChild(maskImageContainer);
			maskImageViewer.childToList("mask_container", maskImageContainer);
			maskImageViewer.maskCon = maskContainer;
			
			// Info container
			var infoContainer:TouchContainer = new TouchContainer();
			infoContainer.className = "info_container";
			infoContainer.visible = false;
			infoContainer.targetParent = true;
			infoContainer.init();
			
			var infoBg:Graphic = new Graphic();
			infoBg.shape = "rectangle";
			infoBg.className = "info_bg";
			infoBg.alpha = 0.6;
			infoBg.lineStroke = 0;
			infoBg.color = 0x7D7682;
			infoContainer.addChild(infoBg);
			infoContainer.childToList("info_bg", infoBg);
			
			var infoTitle:Text = new Text();
			infoTitle.border = false;
			infoTitle.embedFonts = true;
			infoTitle.font = "OpenSansBold";
			infoTitle.fontSize = 20;
			infoTitle.color = 0xffffff;
			infoTitle.className = "title";
			infoTitle.selectable = false;
			infoTitle.text = "Light Bulbs";
			infoTitle.x = 30;
			infoTitle.y = 60;
			
			var infoBody:Text = new Text();
			infoBody.border = false;
			infoBody.className = "info_description";
			infoBody.selectable = false;
			infoBody.multiline = true;
			infoBody.wordWrap = true;
			infoBody.width = 300;
			infoBody.fontSize = 14;
			infoBody.color = 0xffffff;
			infoBody.font = "OpenSansRegular";
			infoBody.text = "Light bulbs viewed through various types of imaging using thermal, infrared, UV, X-ray, and visible light.";
			
			infoContainer.addChild(infoTitle);
			infoContainer.childToList("title", infoTitle);
			infoContainer.addChild(infoBody);
			infoContainer.childToList("info_description", infoBody);
			
			maskImageViewer.addChild(infoContainer);
			maskImageViewer.childToList("info_container", infoContainer);
			maskImageViewer.back = infoContainer;
			
			//Info section ends.
			
			// Menu
			
			var menu:Menu = new Menu();
			menu.className = "menu_container";
			menu.alpha = 0.6;
			menu.position = "bottom";
			menu.paddingLeft = 30;
			menu.paddingBottom = -50;
			menu.paddingRight = 20;
			menu.autoHide = true;
			menu.visible = false;
			
			var infoButton:Button = new Button();
			infoButton = createButton(infoButton, "info", 15, 8, infoBtn);
			infoButton.id = "info-btn";
			infoButton.className = "info_btn";
			
			menu.addChild(infoButton);
			infoButton.init();
			menu.childToList("infoBtn", infoButton);
			
			var closeButton:Button = new Button();
			closeButton = createButton(closeButton, "close", 11, 11, closeBtn);
			closeButton.id = "close-btn";
			closeButton.className = "close_btn";
			
			menu.addChild(closeButton);
			closeButton.init();
			menu.childToList("closeBtn", closeButton);
			
			menu.init();
			
			maskImageViewer.addChild(menu);
			maskImageViewer.childToList("menu", menu);
			maskImageViewer.menu = menu;
			
			addChild(maskImageViewer);
			
			trace("Mask image viewer init()");
			
			function baseComplete(e:Event):void {
				baseImage.removeEventListener(Event.COMPLETE, baseComplete);
				maskImageViewer.width = baseImage.width;
				maskImageViewer.height = baseImage.height;
				
				trace(maskImageViewer.width, maskImageViewer.height);
				
				maskImageViewer.init();
				
				maskImageViewer.x = 500;
				maskImageViewer.y = 100;
				maskImageViewer.mouseChildren = true;
				maskImageViewer.nestedTransform = true;
				
				maskImageViewer.gestureEvents = true;
				maskImageViewer.gestureList = { "n-drag":true, "n-scale":true, "n-rotate":true, "tap":true };
				
				//frame.width = 1000;
				
				maskImageViewer.addChild(frameContainer);
				maskImageViewer.childToList("frame_container", frameContainer);
				
				frame.width = maskImageViewer.width;
				frame.height = maskImageViewer.height;
				
				frame.init();
			}
		}
		
		private function createButton(b:Button, type:String, offX:Number, offY:Number, btnClass:Class):Button {
			var btnUp:Container = new Container();
			btnUp.id = type + "-up";
			
			var btnUpBg:Graphic = new Graphic();
			btnUpBg.shape = "circle";
			btnUpBg.alpha = 1;
			btnUpBg.radius = 20;
			btnUpBg.lineStroke = 1.5;
			btnUpBg.color = 0x6498B2;
			
			btnUp.addChild(btnUpBg);
			btnUp.childToList(type + "UpBg", btnUpBg);
			
			var btnUpIcon:Sprite = new btnClass();
			btnUpIcon.alpha = 1;
			btnUpIcon.x = offX;
			btnUpIcon.y = offY;
			btnUpIcon.scaleX = 1.6;
			btnUpIcon.scaleY = 1.6;
			
			btnUp.addChild(btnUpIcon);
			btnUp.childToList(type + "UpIcon", btnUpIcon);
			
			
			var btnDown:Container = new Container();
			btnDown.id = "btn-down";
			
			var btnDownBg:Graphic = new Graphic();
			btnDownBg.shape = "circle";
			btnDownBg.id = type + "DownBg";
			btnDownBg.alpha = 1;
			btnDownBg.radius = 20;
			btnDownBg.lineStroke = 1.5;
			btnDownBg.color = 0x7D7682;
			
			btnDown.addChild(btnDownBg);
			btnDown.childToList(type + "DownBg", btnDownBg);
			
			var btnDownIcon:Sprite = new btnClass();
			btnDownIcon.alpha = 1;
			btnDownIcon.x = offX;
			btnDownIcon.y = offY;
			btnDownIcon.scaleX = 1.6;
			btnDownIcon.scaleY = 1.6;
			
			btnDown.addChild(btnDownIcon);
			btnDown.childToList(type + "DownIcon", btnDownIcon);
			
			var btnHit:Container = new Container();
			btnHit.id = type + "-hit";
			
			var hitShp:Graphic = new Graphic();
			hitShp.shape = "circle";
			hitShp.id = type + "HitBg";
			hitShp.alpha = 0;
			hitShp.radius = 20;
			hitShp.lineStroke = 1.5;
			hitShp.color = 0xCCCCCC;
			
			btnHit.addChild(hitShp);
			btnHit.childToList(type + "HitBg", hitShp);
			
			b.addChild(btnUp);
			b.childToList(type + "-up", btnUp);
			
			b.addChild(btnDown);
			b.childToList(type + "-down", btnDown);
			
			b.addChild(btnHit);
			b.childToList(type + "-hit", btnHit);
			
			b.initial = type + "-up";
			
			b.up = type + "-up";
			b.out = type + "-up";
			b.down = type + "-down";
			b.hit = type + "-hit";
			
			b.dispatch = "down:" + type;
			
			return b;
		}
	}
	
}