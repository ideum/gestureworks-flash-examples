package as3.components
{
	import as3.components.ui.InfoPanel;
	import as3.components.ui.ViewerMenu;
	import com.gestureworks.cml.components.MediaViewer;
	import com.gestureworks.cml.elements.Button;
	import com.gestureworks.cml.elements.Container;
	import com.gestureworks.cml.elements.Frame;
	import com.gestureworks.cml.elements.Graphic;
	import com.gestureworks.cml.elements.Media;
	import com.gestureworks.cml.elements.Menu;
	import com.gestureworks.cml.elements.Text;
	import com.gestureworks.cml.elements.TouchContainer;
	import com.gestureworks.cml.utils.DisplayUtils;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	
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
			exTemp.createDesc("<p>The MediaViewer is a component that is meant to load various types of media files on the front and metadata on the back. It is composed of the following elements: media, front, back, menu, and frame. The width and height of the component are automatically set to the dimensions of the media element unless it is previously specifed by the component.</p><br />" + "<p>This example loads a Media, and flips it with an info-panel.</p>" + "<br /><p>See also:<br />Media<br />VideoViewer<br />ImageViewer<br />MP3Player<br /></p>");
			addChild(exTemp);			
			
			//Media Viewer Component
			var mediaViewer:MediaViewer = new MediaViewer();
			mediaViewer.x = 575;
			mediaViewer.y = 300;
			mediaViewer.width = 510;
			mediaViewer.height = 290;
			mediaViewer.rotation = -20;
			mediaViewer.mouseChildren = true;			
			mediaViewer.gestureList = {"n-drag": true, "n-scale": true, "n-rotate": true};			
			addChild(mediaViewer);			
			
			//FRONT media element			
			var media:Media = new Media();
			media.width = 510;
			media.height = 290;
			media.targetParent = true;
			media.autoplay = true;
			media.loop = true;
			media.src = "assets/market-street.mov";
			mediaViewer.addChild(media);
			
			//BACK: info panel
			var infoPanel:InfoPanel = new InfoPanel();
			infoPanel.bkgColor = 0xFFAE1F;
			infoPanel.tFontSize = 20;
			infoPanel.dFontSize = 16;
			infoPanel.title = "Market Street";
			infoPanel.descr = "add description";
			mediaViewer.addChild(infoPanel);
			mediaViewer.back = infoPanel;			
						
			//Frame
			var frame:Frame = new Frame();
			frame.targetParent = true;
			frame.mouseChildren = false;
			mediaViewer.addChild(frame);
			
			// Menu
			var menu:ViewerMenu = new ViewerMenu();
			menu.btnColor = 0x282E33;
			menu.paddingLeft = 375;
			menu.paddingRight = 20;
			mediaViewer.addChild(menu);
			
			//Initialize component
			DisplayUtils.initAll(mediaViewer);
		}
	}

}