package as3.components
{
	import as3.components.ui.InfoPanel;
	import as3.components.ui.ViewerMenu;
	import com.gestureworks.cml.components.ModestMapViewer;
	import com.gestureworks.cml.elements.Button;
	import com.gestureworks.cml.elements.Container;
	import com.gestureworks.cml.elements.Frame;
	import com.gestureworks.cml.elements.Graphic;
	import com.gestureworks.cml.elements.Menu;
	import com.gestureworks.cml.elements.ModestMap;
	import com.gestureworks.cml.elements.ModestMapMarker;
	import com.gestureworks.cml.elements.Text;
	import com.gestureworks.cml.elements.TouchContainer;
	import com.gestureworks.cml.utils.DisplayUtils;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class ModestMapViewerEx extends GestureWorks
	{		
		public function ModestMapViewerEx():void
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			//Description			
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("Modest Map Viewer");
			exTemp.createDesc("<p>Viewer tags are used as larger containers which help to combine menu items and extra functionality with elements.</p>"
			+"<p>The ModestMapViewer wraps a ModestMap in a frame with optional buttons. The ModestMap has its own drag and scale functions, so a thick frame "
			+"is helpful in enabling touch and manipulation around the rest of the stage.</p>");
			addChild(exTemp);			
			
			//Modest Map Viewer Component
			var mapViewer:ModestMapViewer = new ModestMapViewer();			
			mapViewer.x = 630;
			mapViewer.y = 100;
			mapViewer.width = 550;
			mapViewer.height = 400;
			mapViewer.mouseChildren = true;					
			mapViewer.gestureList = { "n-drag": true, "n-scale": true, "n-rotate": true, "tap": true };			
			addChild(mapViewer);						
			
			//FRONT: modest map element
			var map:ModestMap = new ModestMap();
			map.nativeTransform = false;
			map.affineTransform = false;
			map.width = 550;
			map.height = 400;
			map.latitude = 51.1857;
			map.longitude = -1.8143;
			map.zoom = 12;
			map.mapprovider = "MicrosoftAerialMapProvider";
			mapViewer.addChild(map);
			
			//BACK: info panel
			var infoPanel:InfoPanel = new InfoPanel();
			infoPanel.bkgColor = 0xFFAE1F;
			infoPanel.tFontSize = 20;
			infoPanel.dFontSize = 16;
			infoPanel.title = "Stonehenge and Woodhenge";
			infoPanel.descr = "Henges are types of neo-lithic earthwork featuring a ring bank and an inner ditch. It is estimated that henges served important ritual purposes. Stonehenge and Woodhenge likely served for burial ceremonies of esteemed figures.";
			mapViewer.addChild(infoPanel);
			mapViewer.back = infoPanel;		
			
			//Frame
			var frame:Frame = new Frame();
			frame.targetParent = true;
			frame.mouseChildren = false;
			mapViewer.addChild(frame);
			
			// Menu
			var menu:ViewerMenu = new ViewerMenu();
			mapViewer.addChild(menu);
			
			//Initialize component
			DisplayUtils.initAll(mapViewer);			
		}
	}

}