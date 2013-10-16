package as3.elements 
{
	import com.gestureworks.cml.element.Graphic;
	import com.gestureworks.cml.element.ModestMap;
	import com.gestureworks.cml.element.ModestMapMarker;
	import com.gestureworks.cml.element.Text;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class ModestMapEx extends GestureWorks 
	{
		public function ModestMapEx():void 
		{		
		}
		
		override protected function gestureworksInit():void 
		{	
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("ModestMap");
			exTemp.createDesc("<p>This tag is used to load a ModestMaps using the ModestMaps API. The element is already touch enabled for the purpose of navigating the map via touch, and switching map providers via touch. Map providers are basically the style of the map. The available map providers are:</p><ul><li>bluemarblemapprovider</li><li>microsoftaerialmapprovider</li><li>microsofthybridmapprovider</li><li>microsoftroadmapprovider</li><li>openstreetmapprovider</li><li>yahooaerialmapprovider</li><li>yahoohybridmapprovider</li><li>yahooroadmapprovider</li></ul><br /><p>The map takes latitude and longitude values to determine the area it displays on load. Negative values are South, and West for the respective coordinates, positive values are North and East.</p><br /><p>You may also add Map Markers to the map provider to point out areas of significance. These markers take display objects, so within their tags you can add Graphics, Texts, Image Elements, or anything else which is a display object.</p><br /><p>Zooming is available when used within a touchContainer, and double-tapping will also be able to switch map providers.</p>");
			
			// The map.
			var map1:ModestMap = new ModestMap;
			map1.x = 500;
			map1.y = 50;
			map1.height = 600;
			map1.width = 600;
			map1.latitude = 51.1789;
			map1.longitude = -1.8624;
			map1.zoom = 7;
			map1.mapprovider = "MicrosoftRoadMapProvider";
			
			/////// Add a map maker.
			var stoneHenge:ModestMapMarker = new ModestMapMarker();
			stoneHenge.latitude = 51.1789;
			stoneHenge.longitude = -1.8264;
			
			var markerGraphic:Graphic = new Graphic();
			markerGraphic.color = 0x594D37;
			markerGraphic.shape = "roundRectangle";
			markerGraphic.width = 81;
			markerGraphic.height = 25;
			markerGraphic.cornerWidth = 10;
			markerGraphic.cornerHeight = 10;
			markerGraphic.lineStroke = 2;
			markerGraphic.lineColor = 0x293033;
			stoneHenge.addChild(markerGraphic);
			
			var markerText:Text = new Text();
			markerText.text = "Stonehenge";
			markerText.color = 0xFAFAC0;
			markerText.fontSize = 12;
			markerText.width = 81;
			stoneHenge.addChild(markerText);
			////// Map marker complete.
			
			map1.addChild(stoneHenge);
			addChild(map1);
			map1.init();
		}
		
	}
	
}