package as3.components
{
	import com.gestureworks.cml.components.LiveVideoViewer;
	import com.gestureworks.cml.element.Button;
	import com.gestureworks.cml.element.VideoCamera;
	import com.gestureworks.cml.element.Container;
	import com.gestureworks.cml.element.Frame;
	import com.gestureworks.cml.element.Graphic;
	import com.gestureworks.cml.element.LiveVideo;
	import com.gestureworks.cml.element.Menu;
	import com.gestureworks.cml.element.Microphone;
	import com.gestureworks.cml.element.Text;
	import com.gestureworks.cml.element.TouchContainer;
	import com.gestureworks.cml.element.VideoCamera;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class LiveVideoViewerEx extends GestureWorks
	{
		[Embed(source="../../../lib/openexhibits_assets.swf",symbol="org.openexhibits.assets.Info")]
		private var infoBtn:Class;
		
		[Embed(source="../../../lib/openexhibits_assets.swf",symbol="org.openexhibits.assets.Close")]
		private var closeBtn:Class;
		
		public function LiveVideoViewerEx():void
		{
			gml = "assets/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("LiveVideo Viewer");
			exTemp.createDesc("<p>This class captures and displays video input from a user’s camera. Default has width and height defined for the video but also allows the user to specify their own width and height for the video.This example also captures audio from microphone.Viewer tags are used as larger containers which help to combine menu items and extra functionality with elements.</p><br /><p>In this case, the menu not only provides a helpful visual frame and an info panel, but buttons which allow access to the liveVideo's stop function.</p><br /><p>This example loads a liveVideo, and flips it with an info-panel.</p>");
			
			var lvViewer:LiveVideoViewer = new LiveVideoViewer();
			
			//The viewer frame
			var frameContainer:TouchContainer = new TouchContainer();
			frameContainer.className = "frame_container";
			frameContainer.visible = true;
			frameContainer.targetParent = true;
			frameContainer.init();
			
			var frame:Frame = new Frame();
			frame.className = "frame_element";
			frameContainer.addChild(frame);
			frameContainer.childToList("frame_element", frame);
			
			frame.init();
			
			lvViewer.addChild(frameContainer);
			lvViewer.childToList("frame_container", frameContainer);
			
			// The video video itself.
			var videoContainer:TouchContainer = new TouchContainer();
			videoContainer.className = "video_container";
			videoContainer.visible = true;
			videoContainer.targetParent = true;
			videoContainer.init();
			
			//width and height of the video
			var liveVideo:LiveVideo = new LiveVideo();
			liveVideo.width = 400;
			liveVideo.height = 300;
			
			var camera:VideoCamera = new VideoCamera();
			liveVideo.camera = camera;
			
			var mic:Microphone = new Microphone();
			liveVideo.microphone = mic;
			
			videoContainer.addChild(liveVideo);
			
			liveVideo.init();
			
			lvViewer.addChild(videoContainer);
			lvViewer.childToList("video_container", videoContainer);
			
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
			infoBg.color = 0xBD7994;
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
			infoTitle.text = "Live Video";
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
			infoBody.text = "The LiveVideoViewer displays live web camera video as a multitouch object.";
			
			infoContainer.addChild(infoTitle);
			infoContainer.childToList("title", infoTitle);
			infoContainer.addChild(infoBody);
			infoContainer.childToList("info_description", infoBody);
			
			lvViewer.addChild(infoContainer);
			lvViewer.childToList("info_container", infoContainer);
			lvViewer.back = infoContainer;
			
			//Info section ends.
			
			// Menu
			
			var menu:Menu = new Menu();
			menu.className = "menu_container";
			menu.alpha = 0.6;
			menu.position = "bottomight";
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
			
			lvViewer.addChild(menu);
			lvViewer.childToList("menu", menu);
			lvViewer.menu = menu;
			
			lvViewer.x = 600;
			lvViewer.y = 250;
			lvViewer.width = 400;
			lvViewer.height = 300;
			lvViewer.rotation = -20;
			lvViewer.mouseChildren = true;
			
			lvViewer.gestureEvents = true;
			lvViewer.gestureList = {"n-drag": true, "n-scale": true, "n-rotate": true};
			
			addChild(lvViewer);
			
			lvViewer.init();
		}
		
		private function createButton(b:Button, type:String, offX:Number, offY:Number, btnClass:Class):Button
		{
			var btnUp:Container = new Container();
			btnUp.id = type + "-up";
			
			var btnUpBg:Graphic = new Graphic();
			btnUpBg.shape = "circle";
			btnUpBg.alpha = 1;
			btnUpBg.radius = 20;
			btnUpBg.lineStroke = 1.5;
			btnUpBg.color = 0x282E33;
			
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
			btnDownBg.color = 0x495E67;
			
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