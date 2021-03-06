package as3.components
{
	import as3.components.ui.InfoPanel;
	import as3.components.ui.ViewerMenu;
	import com.gestureworks.cml.components.MediaViewer;
	import com.gestureworks.cml.elements.Frame;
	import com.gestureworks.cml.elements.Media;
	import com.gestureworks.cml.utils.DisplayUtils;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class MediaViewerEx extends GestureWorks
	{		
		public function MediaViewerEx():void
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			//Description
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("MediaViewer");
			exTemp.createDesc("<p>The MediaViewer is a component that is meant to load various types of media files on the front and metadata on the back. It is composed of the following elements: media, front, back, menu, and frame. "
			+"The width and height of the component are automatically set to the dimensions of the media element unless it is previously specifed by the component.</p><br />" 
			+ "<p>This example loads a Media, and flips it with an info-panel.</p>" 
			+ "<br /><p>See also:<br />Media<br />VideoViewer<br />ImageViewer<br />MP3Player<br /></p>");
			addChild(exTemp);			
			
			//Media Viewer Component
			var mediaViewer:MediaViewer = new MediaViewer();
			mediaViewer.x = 675;
			mediaViewer.y = 100;
			mediaViewer.width = 485;
			mediaViewer.height = 360;
			mediaViewer.mouseChildren = true;			
			mediaViewer.gestureList = {"n-drag": true, "n-scale": true, "n-rotate": true};			
			addChild(mediaViewer);			
			
			//FRONT media element			
			var media:Media = new Media();
			media.src = "assets/market-street.mov";			
			media.autoplay = true;
			media.loop = true;
			media.scale = 1.5;
			media.targetParent = true;
			media.mouseChildren = false;
			mediaViewer.addChild(media);
			
			//BACK: info panel
			var infoPanel:InfoPanel = new InfoPanel();
			infoPanel.bkgColor = 0x665533;
			infoPanel.tFontSize = 20;
			infoPanel.dFontSize = 16;
			infoPanel.title = "Market Street";
			infoPanel.descr = "A Trip Down Market Street is a 13-minute actuality film recorded by placing a movie camera on the front of a cable car as it travels down San Franciscos Market Street.";
			mediaViewer.addChild(infoPanel);
			mediaViewer.back = infoPanel;			
						
			//Frame
			var frame:Frame = new Frame();
			frame.frameColor = 0x232223;
			frame.frameThickness = 20;
			frame.targetParent = true;
			frame.mouseChildren = false;
			mediaViewer.addChild(frame);
			
			// Menu
			var menu:ViewerMenu = new ViewerMenu(true, true, true, true);
			menu.btnColor = 0x282E33;
			menu.paddingBottom = 10;
			menu.paddingRight = 10;
			menu.paddingLeft = 300;
			mediaViewer.addChild(menu);
			
			//Initialize component
			DisplayUtils.initAll(mediaViewer);
		}
	}

}