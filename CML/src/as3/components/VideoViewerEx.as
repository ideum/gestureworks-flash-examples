package as3.components
{
	import as3.components.ui.InfoPanel;
	import as3.components.ui.ViewerMenu;
	import com.gestureworks.cml.components.VideoViewer;
	import com.gestureworks.cml.elements.Button;
	import com.gestureworks.cml.elements.Container;
	import com.gestureworks.cml.elements.Frame;
	import com.gestureworks.cml.elements.Graphic;
	import com.gestureworks.cml.elements.Menu;
	import com.gestureworks.cml.elements.Text;
	import com.gestureworks.cml.elements.TouchContainer;
	import com.gestureworks.cml.elements.Video;
	import com.gestureworks.cml.utils.DisplayUtils;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class VideoViewerEx extends GestureWorks
	{		
		public function VideoViewerEx():void
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			//Description			
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("Video Viewer");
			exTemp.createDesc("<p>Viewer classes are used as larger containers which help to combine menu items and extra functionality with elements.</p><br /><p>"
			+"In this case, the menu not only provides a helpful visual frame and an info panel, but buttons which allow access to the Video's play and pause functions.</p><br /><p>"
			+"This example loads a Video, and flips it with an info-panel.</p>");
			addChild(exTemp);			
			
			//Video Viewer Component
			var videoViewer:VideoViewer = new VideoViewer();
			videoViewer.x = 600;
			videoViewer.y = 150;
			videoViewer.gestureList = {"n-drag": true, "n-scale": true, "n-rotate": true};			
			addChild(videoViewer);						
			
			//FRONT: video element
			var video:Video = new Video();
			video.src = "assets/market-street.mov";
			video.width = 480;
			video.height = 360;
			video.autoplay = true;
			video.loop = true;
			videoViewer.addChild(video);	
			
			//BACK: info panel
			var infoPanel:InfoPanel = new InfoPanel();
			infoPanel.bkgColor = 0x665533;
			infoPanel.tFontSize = 20;
			infoPanel.dFontSize = 16;
			infoPanel.title = "Market Street";
			infoPanel.descr = "A Trip Down Market Street is a 13-minute actuality film recorded by placing a movie camera on the front of a cable car as it travels down San Franciscos Market Street.";
			videoViewer.addChild(infoPanel);
			videoViewer.back = infoPanel;			
					
			//Frame
			var frame:Frame = new Frame();
			frame.frameColor = 0x232223;
			frame.frameThickness = 20;
			frame.targetParent = true;
			frame.mouseChildren = false;
			videoViewer.addChild(frame);
			
			// Menu
			var menu:ViewerMenu = new ViewerMenu(true, true, true, true);
			menu.btnColor = 0x282E33;
			menu.paddingBottom = 10;
			menu.paddingRight = 10;
			menu.paddingLeft = 300;
			videoViewer.addChild(menu);
			
			//Initialize component
			DisplayUtils.initAll(videoViewer);		
		}
	}
}