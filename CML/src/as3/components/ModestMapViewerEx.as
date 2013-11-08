package as3.components
{
	import as3.components.ui.InfoPanel;
	import as3.components.ui.ViewerMenu;
	import com.gestureworks.cml.components.ModestMapViewer;
	import com.gestureworks.cml.elements.Frame;
	import com.gestureworks.cml.elements.ModestMap;
	import com.gestureworks.cml.elements.ModestMapMarker;
	import com.gestureworks.cml.elements.Text;
	import com.gestureworks.cml.utils.DisplayUtils;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
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
			exTemp.createDesc("<p>Viewer classes are used as larger containers which help to combine menu items and extra functionality with elements.</p>"
			+"<p>The ModestMapViewer wraps a ModestMap in a frame with optional buttons. The ModestMap has its own drag and scale functions, so a thick frame "
			+"is helpful in enabling touch and manipulation around the rest of the stage.</p>");
			addChild(exTemp);			
			
			//Modest Map Viewer Component
			var mapViewer:ModestMapViewer = new ModestMapViewer();			
			mapViewer.x = 630;
			mapViewer.y = 100;
			mapViewer.width = 550;
			mapViewer.height = 400;
			mapViewer.autoTextLayout = false;	
			mapViewer.mouseChildren = true;
			mapViewer.gestureList = { "n-drag": true, "n-scale": true, "n-rotate": true};			
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
			
			//Markers
			map.addChild(marker("Woodhenge", -1.7867, 51.1896));
			map.addChild(marker("Stonehenge", -1.8264, 51.1789));
			
			//BACK: info panel
			var infoPanel:InfoPanel = new InfoPanel();
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
		
		private function marker(name:String, lon:Number, lat:Number):ModestMapMarker {
			var mkr:ModestMapMarker = new ModestMapMarker();
			mkr.longitude = lon; 
			mkr.latitude = lat;
			
			var label:Text = new Text();
			label.str = name;
			label.color = 0xFAFAC0;
			label.fontSize = 12;
			label.width = 100;
			label.height = 25;
			label.background = true;
			label.backgroundColor = 0x594D37;
			mkr.addChild(label);
		
			return mkr;
		}
	}

}