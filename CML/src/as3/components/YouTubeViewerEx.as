package as3.components
{
	import as3.components.ui.InfoPanel;
	import as3.components.ui.ViewerMenu;
	import com.gestureworks.cml.components.YouTubeViewer;
	import com.gestureworks.cml.elements.Frame;
	import com.gestureworks.cml.elements.YouTube;
	import com.gestureworks.cml.utils.DisplayUtils;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class YouTubeViewerEx extends GestureWorks
	{		
		public function YouTubeViewerEx():void
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			//Description			
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("Youtube Viewer");
			exTemp.createDesc("<p>Viewer classes are used as larger containers which help to combine menu items and extra functionality with elements.</p><br /><p>"
			+"In this case, the menu not only provides a helpful visual frame and an info panel, but buttons which allow access to the YouTube's play and pause functions without having to set chrome=\"true\" in the element class.</p><br /><p>"
			+"This example loads a YouTube, and flips it with an info-panel.</p>");
			addChild(exTemp);			
			
			//YouTube Viewer Component
			var youtubeViewer:YouTubeViewer = new YouTubeViewer();			
			youtubeViewer.x = 600;
			youtubeViewer.y = 150;
			youtubeViewer.gestureList = { "n-drag": true, "n-scale": true, "n-rotate": true };			
			addChild(youtubeViewer);
			
			//FRONT: YouTube element			
			var youtube:YouTube = new YouTube();
			youtube.src = "Fo3u_8pZ7Pw";
			youtube.width = 600;
			youtube.height = 360;
			youtube.autoplay = false;
			youtube.targetParent = true;
			youtubeViewer.addChild(youtube);			
			
			//BACK: info panel
			var infoPanel:InfoPanel = new InfoPanel();
			infoPanel.title = "Open Exhibits";
			infoPanel.descr = "Open Exhibits focuses on the development of new human computer interaction (HCI) exhibits that holds the promise of creating visitor experiences that are physically engaging and socially interactive. The Open Exhibits software collection includes templates, components, and utilities that serve as building blocks for creating digital exhibits and interactives. These tools facilitate the development of applications that encourage shared-surface, collaborative computing and other HCI innovations.";
			youtubeViewer.addChild(infoPanel);
			youtubeViewer.back = infoPanel;
						
			//Frame
			var frame:Frame = new Frame();
			frame.frameColor = 0x232223;
			frame.frameThickness = 20;
			frame.targetParent = true;
			frame.mouseChildren = false;
			youtubeViewer.addChild(frame);
			
			// Menu
			var menu:ViewerMenu = new ViewerMenu(true, true, true, true);
			menu.btnColor = 0x282E33;
			menu.paddingBottom = 10;
			menu.paddingRight = 10;
			menu.paddingLeft = 300;
			youtubeViewer.addChild(menu);
			
			//Initialize component
			DisplayUtils.initAll(youtubeViewer);			
		}
	}

}