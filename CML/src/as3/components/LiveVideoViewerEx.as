package as3.components
{
	import as3.components.ui.InfoPanel;
	import as3.components.ui.ViewerMenu;
	import com.gestureworks.cml.components.LiveVideoViewer;
	import com.gestureworks.cml.elements.Frame;
	import com.gestureworks.cml.elements.LiveVideo;
	import com.gestureworks.cml.elements.Microphone;
	import com.gestureworks.cml.elements.VideoCamera;
	import com.gestureworks.cml.utils.DisplayUtils;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class LiveVideoViewerEx extends GestureWorks
	{		
		public function LiveVideoViewerEx():void
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			//Description
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("LiveVideo Viewer");
			exTemp.createDesc("<p>This class captures and displays video input from a user’s camera. Default has width and height defined for the video but also allows the user to specify their own width and height "
			+"for the video.This example also captures audio from microphone.Viewer classes are used as larger containers which help to combine menu items and extra functionality with elements.</p><br /><p>"
			+"In this case, the menu not only provides a helpful visual frame and an info panel, but buttons which allow access to the liveVideo's stop function.</p><br /><p>This example loads a liveVideo, "
			+"and flips it with an info-panel.</p>");
			addChild(exTemp);			
			
			//Live Video Viewer Component
			var lvViewer:LiveVideoViewer = new LiveVideoViewer();
			lvViewer.x = 600;
			lvViewer.y = 250;
			lvViewer.rotation = -20;
			lvViewer.mouseChildren = true;
			lvViewer.gestureList = {"n-drag": true, "n-scale": true, "n-rotate": true};			
			addChild(lvViewer);			
			
			//FRONT: live video element
			var liveVideo:LiveVideo = new LiveVideo();
			liveVideo.width = 400;
			liveVideo.height = 300;
			liveVideo.camera = new VideoCamera();			
			liveVideo.microphone = new Microphone();;			
			lvViewer.addChild(liveVideo);
			
			//BACK: info panel
			var infoPanel:InfoPanel = new InfoPanel();
			infoPanel.bkgColor = 0xBD7994;
			infoPanel.tFontSize = 20;
			infoPanel.dFontSize = 16;
			infoPanel.title = "Live Video";
			infoPanel.descr = "The LiveVideoViewer displays live web camera video as a multitouch object.";
			lvViewer.addChild(infoPanel);
			lvViewer.back = infoPanel;
			
			//Frame
			var frame:Frame = new Frame();
			frame.targetParent = true;
			frame.mouseChildren = false;
			lvViewer.addChild(frame);
			
			// Menu
			var menu:ViewerMenu = new ViewerMenu();
			menu.paddingLeft = 250;
			menu.paddingRight = 20;
			lvViewer.addChild(menu);
			
			//Initialize component
			DisplayUtils.initAll(lvViewer);
		}
	}

}