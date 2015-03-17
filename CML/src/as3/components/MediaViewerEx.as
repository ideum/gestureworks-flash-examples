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
	import flash.events.KeyboardEvent;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class MediaViewerEx extends GestureWorks
	{			
		
		private var media:Media; 
		private var infoPanel:InfoPanel;
		private var mediaViewer:MediaViewer;
		
		private var files:Array = ["assets/market-street.mov", "assets/images/plane.jpg", "assets/RuthCalledShot_vbr.mp3"];
		private var titles:Array = ["Market Street", "Wright Brothers", "Babe Ruth"];
		private var descrs:Array = ["A Trip Down Market Street is a 13-minute actuality film recorded by placing a movie camera on the front of a cable car as it travels down San Franciscos Market Street.", "Orville Wright's famous first airplane flight.", "Babe Ruths called shot was the home run hit by Babe Ruth of the New York Yankees in the fifth inning of Game 3 of the 1932 World Series, held on October 1, 1932, at Wrigley Field in Chicago."];
		private var index:int = 0;
		
		public function MediaViewerEx():void
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			//Description
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("MediaViewer");
			exTemp.createDesc("<p>The MediaViewer is a component that is meant to load various types of media files on the front and metadata on the back. It is composed of the "+ 
							"following elements: media, front, back, menu, and frame. The width and height of the component are automatically set to the dimensions of the media "+ 
							"element unless it is previously specifed by the component. It is useful for situations where the type of media changes during run-time.</p><br />" +
			"<p>This example loads a video file, and flips it with an info-panel. Hit the ENTER key to dynamically switch the media type.</p>" +
			 "<br /><p>See also:<br />Media<br />VideoViewer<br />ImageViewer<br />AudioPlayer<br /></p>");
			addChild(exTemp);		
			
			//Media Viewer Component
			mediaViewer = new MediaViewer();
			mediaViewer.x = 610;
			mediaViewer.y = 183;
			mediaViewer.width = 500;
			mediaViewer.height = 350;
			mediaViewer.mouseChildren = true;			
			mediaViewer.gestureList = {"n-drag": true, "n-scale": true, "n-rotate": true};			
			addChild(mediaViewer);			
			
			//FRONT media element			
			media = new Media();
			media.src = files[index];		
			media.autoplay = true;
			media.loop = true;
			media.targetParent = true;
			media.mouseChildren = false;
			media.resetDimensions = false; 
			mediaViewer.addChild(media);
			
			//BACK: info panel
			infoPanel = new InfoPanel();
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
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, updateMedia);			
		}
		
		private function updateMedia(e:KeyboardEvent):void {
			if (e.keyCode == 13) {
				index = index == files.length - 1 ? 0 : index + 1;								
				infoPanel.title = titles[index];
				infoPanel.descr = descrs[index];
				media.src = files[index];
				mediaViewer.init();
			}
		}		
	}

}