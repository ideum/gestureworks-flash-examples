package as3.components
{
	import as3.components.ui.InfoPanel;
	import as3.components.ui.ViewerMenu;
	import com.gestureworks.cml.components.YouTubeViewer;
	import com.gestureworks.cml.elements.Button;
	import com.gestureworks.cml.elements.Container;
	import com.gestureworks.cml.elements.Frame;
	import com.gestureworks.cml.elements.Graphic;
	import com.gestureworks.cml.elements.Menu;
	import com.gestureworks.cml.elements.Text;
	import com.gestureworks.cml.elements.TouchContainer;
	import com.gestureworks.cml.elements.YouTube;
	import com.gestureworks.cml.utils.DisplayUtils;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	
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
			exTemp.createDesc("<p>Viewer tags are used as larger containers which help to combine menu items and extra functionality with elements.</p><br /><p>"
			+"In this case, the menu not only provides a helpful visual frame and an info panel, but buttons which allow access to the YouTube's play and pause functions without having to set chrome=\"true\" in the element class.</p><br /><p>"
			+"This example loads a YouTube, and flips it with an info-panel.</p>");
			addChild(exTemp);			
			
			//YouTube Viewer Component
			var youtubeViewer:YouTubeViewer = new YouTubeViewer();			
			youtubeViewer.x = 520;
			youtubeViewer.y = 250;
			youtubeViewer.rotation = -20;
			youtubeViewer.mouseChildren = true;
			youtubeViewer.gestureList = {"n-drag": true, "n-scale": true, "n-rotate": true};			
			
			//FRONT: YouTube element			
			var youtube:YouTube = new YouTube();
			youtube.src = "h0MZX-D8xzA";
			youtube.width = 600;
			youtube.height = 360;
			youtube.autoplay = false;
			youtubeViewer.addChild(youtube);			
			
			//BACK: info panel
			var infoPanel:InfoPanel = new InfoPanel();
			infoPanel.bkgColor = 0xFFAE1F;
			infoPanel.tFontSize = 20;
			infoPanel.dFontSize = 16;
			infoPanel.title = "title";
			infoPanel.descr = "description";
			youtubeViewer.addChild(infoPanel);
			youtubeViewer.back = infoPanel;
						
			//Frame
			var frame:Frame = new Frame();
			frame.targetParent = true;
			frame.mouseChildren = false;
			youtubeViewer.addChild(frame);
			
			// Menu
			var menu:ViewerMenu = new ViewerMenu(true, true, true, true);
			youtubeViewer.addChild(menu);
			
			//Initialize component
			DisplayUtils.initAll(youtubeViewer);			
		}
	}

}