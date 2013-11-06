package as3.components
{
	import com.gestureworks.cml.components.FlickrViewer;
	import com.gestureworks.cml.element.Button;
	import com.gestureworks.cml.element.Container;
	import com.gestureworks.cml.element.Flickr;
	import com.gestureworks.cml.element.Frame;
	import com.gestureworks.cml.element.Graphic;
	import com.gestureworks.cml.element.Menu;
	import com.gestureworks.cml.element.Text;
	import com.gestureworks.cml.element.TouchContainer;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class FlickrViewerEx extends GestureWorks
	{
		[Embed(source="../../../lib/openexhibits_assets.swf",symbol="org.openexhibits.assets.Info")]
		private var infoBtn:Class;
		
		[Embed(source="../../../lib/openexhibits_assets.swf",symbol="org.openexhibits.assets.Close")]
		private var closeBtn:Class;
		
		public function FlickrViewerEx():void
		{
			gml = "assets/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("Flickr Viewer");
			exTemp.createDesc("<p>This class is used to load images in from Flickr using the Flickr API. It can be placed inside a viewer, containers, and collection viewers.</p><br /><p>You will need two things to load a picture from Flickr: a picture ID, and an API Key. Your API key is something you can sign up for free at <a href=\"http://www.flickr/com/service/api\"> http://www.flickr/com/service/api</a> to allow you to submit queries to the Flickr database.</p><br /><p>This example will not actually load a picture until you set the API key property with your own key.</p><br /><p>Pictures must be public and available to be accessed.</p>");
			
			var flickrViewer:FlickrViewer = new FlickrViewer();
			
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
			
			flickrViewer.addChild(frameContainer);
			flickrViewer.childToList("frame_container", frameContainer);
			
			// The actual Flickr image.
			var flickrContainer:TouchContainer = new TouchContainer();
			flickrContainer.className = "flickr_container";
			flickrContainer.visible = true;
			flickrContainer.targetParent = true;
			flickrContainer.init();
			/**
			 * The Flickr ID is a numerical ID associated with the picture. To find a picture ID from a link, look at the digits following the slash after the contributor's name.
			 * For example, in: www.flickr.com/photos/paulslab/4385244497/, the number "438524497" is the ID you need to put in the "src" field of the class.
			 */
			var flickrImg:Flickr = new Flickr();
			flickrImg.className = "flickr_element";
			flickrImg.apikey = "ENTER FLICKR API KEY";
			flickrImg.src = "4385244497";
			flickrContainer.addChild(flickrImg);
			flickrContainer.childToList("flickr_element", flickrImg);
			
			flickrImg.init();
			
			flickrViewer.addChild(flickrContainer);
			flickrViewer.childToList("flickr_container", flickrContainer);
			flickrViewer.image = flickrImg;
			
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
			infoTitle.text = "Chrome Alum Crystals";
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
			infoBody.text = "This is a photo of chrome alum crystals in a chrome alum solution, at 20x magnification. Taken with my Canon SX110 IS, through a Novex stereo microscope with lighting from underneath. The crystals are grown from a saturated solution and are no more than 1 mm in diameter. Created myself, Paul, from www.paulslab.com";
			
			infoContainer.addChild(infoTitle);
			infoContainer.childToList("title", infoTitle);
			infoContainer.addChild(infoBody);
			infoContainer.childToList("info_description", infoBody);
			
			flickrViewer.addChild(infoContainer);
			flickrViewer.childToList("info_container", infoContainer);
			flickrViewer.back = infoContainer;
			
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
			
			flickrViewer.addChild(menu);
			flickrViewer.childToList("menu", menu);
			flickrViewer.menu = menu;
			
			addChild(flickrViewer);
			
			flickrViewer.init();
			
			flickrViewer.x = 500;
			flickrViewer.y = 100;
			flickrViewer.mouseChildren = true;
			
			flickrViewer.gestureEvents = true;
			flickrViewer.gestureList = {"n-drag": true, "n-scale": true, "n-rotate": true, "tap": true};
		
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