package as3.components
{
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
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class ModestMapViewerEx extends GestureWorks
	{
		[Embed(source="../../../lib/openexhibits_assets.swf",symbol="org.openexhibits.assets.Info")]
		private var infoBtn:Class;
		
		[Embed(source="../../../lib/openexhibits_assets.swf",symbol="org.openexhibits.assets.Close")]
		private var closeBtn:Class;
		
		public function ModestMapViewerEx():void
		{
			gml = "assets/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("Modest Map Viewer");
			exTemp.createDesc("<p>Viewer tags are used as larger containers which help to combine menu items and extra functionality with elements.</p> <p>The ModestMapViewer wraps a ModestMap in a frame with optional buttons. The ModestMap has its own drag and scale functions, so a thick frame is helpful in enabling touch and manipulation around the rest of the stage.</p>");
			
			var mapViewer:ModestMapViewer = new ModestMapViewer();
			
			//The viewer frame
			var frameContainer:TouchContainer = new TouchContainer();
			frameContainer.className = "frame_container";
			frameContainer.visible = true;
			frameContainer.targetParent = true;
			frameContainer.init();
			
			var frame:Frame = new Frame();
			frame.className = "frame_element";
			frameContainer.addChild(frame);
			frameContainer.childToList("frame_element", frame);
			
			frame.init();
			
			mapViewer.addChild(frameContainer);
			mapViewer.childToList("frame_container", frameContainer);
			
			// The actual map image.
			var mapContainer:TouchContainer = new TouchContainer();
			mapContainer.className = "map_container";
			mapContainer.visible = true;
			mapContainer.targetParent = false;
			mapContainer.disableNativeTransform = true;
			mapContainer.disableAffineTransform = true;
			mapContainer.init();
			
			var map:ModestMap = new ModestMap();
			map.width = 550;
			map.height = 400;
			map.latitude = 51.1857;
			map.longitude = -1.8143;
			map.zoom = 12;
			map.mapprovider = "MicrosoftAerialMapProvider";
			
			// Add Stonehenge's map maker.
			var stoneHenge:ModestMapMarker = new ModestMapMarker();
			stoneHenge.latitude = 51.1789;
			stoneHenge.longitude = -1.8624;
			
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
			// Stonehenge Map marker complete.
			map.addChild(stoneHenge);
			
			// Add Woodhenge's map maker.
			var woodHenge:ModestMapMarker = new ModestMapMarker();
			woodHenge.latitude = 51.1896;
			woodHenge.longitude = -1.7867;
			
			var whGraphic:Graphic = new Graphic();
			whGraphic.color = 0x594D37;
			whGraphic.shape = "roundRectangle";
			whGraphic.width = 81;
			whGraphic.height = 25;
			whGraphic.cornerWidth = 10;
			whGraphic.cornerHeight = 10;
			whGraphic.lineStroke = 2;
			whGraphic.lineColor = 0x293033;
			woodHenge.addChild(whGraphic);
			
			var whText:Text = new Text();
			whText.text = "Woodhenge";
			whText.color = 0xFAFAC0;
			whText.fontSize = 12;
			whText.width = 81;
			woodHenge.addChild(whText);
			// Woodhenge Map marker complete.
			map.addChild(woodHenge);
			
			mapContainer.addChild(map);
			mapContainer.childToList("map_element", map);
			
			// Not going to initialize here. Due to the way ModestMaps works, we're going to initialize
			// after the viewer class to update the height/width for the frame.
			//map.init();
			
			mapViewer.addChild(mapContainer);
			mapViewer.childToList("map_container", mapContainer);
			mapViewer.map = map;
			
			// Info container
			var infoContainer:TouchContainer = new TouchContainer();
			infoContainer.className = "info_container";
			infoContainer.visible = false;
			infoContainer.targetParent = true;
			infoContainer.init();
			
			var infoBg:Graphic = new Graphic();
			infoBg.shape = "rectangle";
			infoBg.className = "info_bg";
			infoBg.alpha = 0.6;
			infoBg.lineStroke = 0;
			infoBg.color = 0xFFAE1F;
			infoContainer.addChild(infoBg);
			infoContainer.childToList("info_bg", infoBg);
			
			var infoTitle:Text = new Text();
			infoTitle.border = false;
			infoTitle.embedFonts = true;
			infoTitle.font = "OpenSansBold";
			infoTitle.fontSize = 20;
			infoTitle.color = 0xffffff;
			infoTitle.className = "title";
			infoTitle.selectable = false;
			infoTitle.text = "Stonehenge and Woodhenge";
			infoTitle.x = 30;
			infoTitle.y = 60;
			
			var infoBody:Text = new Text();
			infoBody.border = false;
			infoBody.className = "info_description";
			infoBody.selectable = false;
			infoBody.multiline = true;
			infoBody.wordWrap = true;
			infoBody.width = 300;
			infoBody.fontSize = 14;
			infoBody.color = 0xffffff;
			infoBody.font = "OpenSansRegular";
			infoBody.text = "Henges are types of neo-lithic earthwork featuring a ring bank and an inner ditch. It is estimated that henges served important ritual purposes. Stonehenge and Woodhenge likely served for burial ceremonies of esteemed figures.";
			
			infoContainer.addChild(infoTitle);
			infoContainer.childToList("title", infoTitle);
			infoContainer.addChild(infoBody);
			infoContainer.childToList("info_description", infoBody);
			
			mapViewer.addChild(infoContainer);
			mapViewer.childToList("info_container", infoContainer);
			mapViewer.back = infoContainer;
			
			//Info section ends.
			
			// Menu
			
			var menu:Menu = new Menu();
			menu.className = "menu_container";
			menu.alpha = 0.6;
			menu.position = "bottom";
			menu.paddingLeft = 30;
			menu.paddingBottom = -50;
			menu.paddingRight = 20;
			menu.autoHide = true;
			menu.visible = false;
			
			var infoButton:Button = new Button();
			infoButton = createButton(infoButton, "info", 15, 8, infoBtn);
			infoButton.id = "info-btn";
			infoButton.className = "info_btn";
			
			menu.addChild(infoButton);
			infoButton.init();
			menu.childToList("infoBtn", infoButton);
			
			var closeButton:Button = new Button();
			closeButton = createButton(closeButton, "close", 11, 11, closeBtn);
			closeButton.id = "close-btn";
			closeButton.className = "close_btn";
			
			menu.addChild(closeButton);
			closeButton.init();
			menu.childToList("closeBtn", closeButton);
			
			menu.init();
			
			mapViewer.addChild(menu);
			mapViewer.childToList("menu", menu);
			mapViewer.menu = menu;
			
			addChild(mapViewer);
			
			mapViewer.x = 630;
			mapViewer.y = 100;
			mapViewer.rotation = 10;
			mapViewer.width = 550;
			mapViewer.height = 400;
			mapViewer.mouseChildren = true;
			
			mapViewer.init();
			map.init();
			
			mapViewer.gestureEvents = true;
			mapViewer.gestureList = {"n-drag": true, "n-scale": true, "n-rotate": true, "tap": true};
		}
		
		private function createButton(b:Button, type:String, offX:Number, offY:Number, btnClass:Class):Button
		{
			var btnUp:Container = new Container();
			btnUp.id = type + "-up";
			
			var btnUpBg:Graphic = new Graphic();
			btnUpBg.shape = "circle";
			btnUpBg.alpha = 1;
			btnUpBg.radius = 20;
			btnUpBg.lineStroke = 1.5;
			btnUpBg.color = 0x282E33;
			
			btnUp.addChild(btnUpBg);
			btnUp.childToList(type + "UpBg", btnUpBg);
			
			var btnUpIcon:Sprite = new btnClass();
			btnUpIcon.alpha = 1;
			btnUpIcon.x = offX;
			btnUpIcon.y = offY;
			btnUpIcon.scaleX = 1.6;
			btnUpIcon.scaleY = 1.6;
			
			btnUp.addChild(btnUpIcon);
			btnUp.childToList(type + "UpIcon", btnUpIcon);
			
			var btnDown:Container = new Container();
			btnDown.id = "btn-down";
			
			var btnDownBg:Graphic = new Graphic();
			btnDownBg.shape = "circle";
			btnDownBg.id = type + "DownBg";
			btnDownBg.alpha = 1;
			btnDownBg.radius = 20;
			btnDownBg.lineStroke = 1.5;
			btnDownBg.color = 0x495E67;
			
			btnDown.addChild(btnDownBg);
			btnDown.childToList(type + "DownBg", btnDownBg);
			
			var btnDownIcon:Sprite = new btnClass();
			btnDownIcon.alpha = 1;
			btnDownIcon.x = offX;
			btnDownIcon.y = offY;
			btnDownIcon.scaleX = 1.6;
			btnDownIcon.scaleY = 1.6;
			
			btnDown.addChild(btnDownIcon);
			btnDown.childToList(type + "DownIcon", btnDownIcon);
			
			var btnHit:Container = new Container();
			btnHit.id = type + "-hit";
			
			var hitShp:Graphic = new Graphic();
			hitShp.shape = "circle";
			hitShp.id = type + "HitBg";
			hitShp.alpha = 0;
			hitShp.radius = 20;
			hitShp.lineStroke = 1.5;
			hitShp.color = 0xCCCCCC;
			
			btnHit.addChild(hitShp);
			btnHit.childToList(type + "HitBg", hitShp);
			
			b.addChild(btnUp);
			b.childToList(type + "-up", btnUp);
			
			b.addChild(btnDown);
			b.childToList(type + "-down", btnDown);
			
			b.addChild(btnHit);
			b.childToList(type + "-hit", btnHit);
			
			b.initial = type + "-up";
			
			b.up = type + "-up";
			b.out = type + "-up";
			b.down = type + "-down";
			b.hit = type + "-hit";
			
			b.dispatch = "down:" + type;
			
			return b;
		}
	}

}