package as3.components 
{
	import com.gestureworks.cml.components.WAVPlayer;
	import com.gestureworks.cml.elements.Button;
	import com.gestureworks.cml.elements.Container;
	import com.gestureworks.cml.elements.Frame;
	import com.gestureworks.cml.elements.Graphic;
	import com.gestureworks.cml.elements.Menu;
	import com.gestureworks.cml.elements.Text;
	import com.gestureworks.cml.elements.TouchContainer;
	import com.gestureworks.cml.elements.WAV;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Ideum
	 */
	
	 [SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	 
	public class WAVPlayerEx extends GestureWorks 
	{
		[Embed(source = "../../../../_../../../lib/openexhibits_assets.swf", symbol = "org.openexhibits.assets.Info")]
		private var infoBtn:Class;
		
		[Embed(source = "../../../../_../../../lib/openexhibits_assets.swf", symbol = "org.openexhibits.assets.Play")]
		private var playBtn:Class;
		
		[Embed(source = "../../../../_../../../lib/openexhibits_assets.swf", symbol = "org.openexhibits.assets.Pause")]
		private var pauseBtn:Class;
		
		[Embed(source = "../../../../_../../../lib/openexhibits_assets.swf", symbol = "org.openexhibits.assets.Close")]
		private var closeBtn:Class;
		
		public function WAVPlayerEx():void 
		{
			gml = "gestures.gml";
		}
		
		override protected function gestureworksInit():void 
		{
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("Wav Viewer");
			exTemp.createDesc("<p>Viewer and Player tags are used as larger containers which help to combine menu items and extra functionality with elements.</p><br /><p>Due to certain constraints in Actionscript programming, this element requires your AS3 project to be an AIR project.</p><br /><p>In this case, the menu not only provides a helpful visual frame and an info panel, but buttons which allow access to the WAV's play and pause functions.</p><br /><p>It has also been styled differently to give it a more unique border and theme.</p><br /><p>This example loads a WAV, and flips it with an info-panel.</p>");
			
			var wavplayer:WAVPlayer = new WAVPlayer();
			
			//The viewer frame
			var frameContainer:TouchContainer = new TouchContainer();
			frameContainer.class_ = "frame_container";
			frameContainer.visible = true;
			frameContainer.targetParent = true;
			frameContainer.init();
			
			var frame:Frame = new Frame();
			frame.class_ = "frame_element";
			frame.frameColor = 0x591202;
			frame.frameThickness = 5;
			frame.frameAlpha = 1;
			frameContainer.addChild(frame);
			frameContainer.childToList("frame_element", frame);
			
			frame.init();
			
			wavplayer.addChild(frameContainer);
			wavplayer.childToList("frame_container", frameContainer);
			
			// The actual wave Element
			var wavContainer:TouchContainer = new TouchContainer();
			wavContainer.class_ = "wav_container";
			wavContainer.visible = true;
			wavContainer.targetParent = true;
			wavContainer.init();
			
			var wav:WAV = new WAV();
			wav.class_ = "wav_element";
			wav.src = "library/assets/FDR-Infamy.wav";
			wav.autoplay = true;
			wav.display = "waveform";
			wav.waveColor = 0xD9B26A;
			wav.backgroundColor = 0x574A59;
			wav.width = 500;
			wav.height = 250;
			wav.volume = 0.5;
			
			wavContainer.addChild(wav);
			wavContainer.childToList("wav_element", wav);
			
			wav.init();
			
			wavplayer.addChild(wavContainer);
			wavplayer.childToList("wav_container", wavContainer);
			wavplayer.wav = wav;
			
			// Info container
			var infoContainer:TouchContainer = new TouchContainer();
			infoContainer.class_ = "info_container";
			infoContainer.visible = false;
			infoContainer.targetParent = true;
			infoContainer.init();
			
			var infoBg:Graphic = new Graphic();
			infoBg.shape = "rectangle";
			infoBg.class_ = "info_bg";
			infoBg.alpha = 0.6;
			infoBg.lineStroke = 0;
			infoBg.color = 0xBF935E;
			infoContainer.addChild(infoBg);
			infoContainer.childToList("info_bg", infoBg);
			
			var infoTitle:Text = new Text();
			infoTitle.border = false;
			infoTitle.embedFonts = true;
			infoTitle.font = "OpenSansBold";
			infoTitle.fontSize = 20;
			infoTitle.color = 0xffffff;
			infoTitle.class_ = "title";
			infoTitle.selectable = false;
			infoTitle.text = "FDR's Infamy Speech";
			infoTitle.x = 30;
			infoTitle.y = 60;
			
			var infoBody:Text = new Text();
			infoBody.border = false;
			infoBody.class_ = "info_description";
			infoBody.selectable = false;
			infoBody.multiline = true;
			infoBody.wordWrap = true;
			infoBody.width = 300;
			infoBody.fontSize = 14;
			infoBody.color = 0xffffff;
			infoBody.font = "OpenSansRegular";
			infoBody.text = "Franklin Deleanor Roosevelt's address to a Joint Session of Congress after the attack on the Pearl Harbor Naval Base by the Empire of Japan.";
			
			infoContainer.addChild(infoTitle);
			infoContainer.childToList("title", infoTitle);
			infoContainer.addChild(infoBody);
			infoContainer.childToList("info_description", infoBody);
			
			wavplayer.addChild(infoContainer);
			wavplayer.childToList("info_container", infoContainer);
			wavplayer.back = infoContainer;
			
			//Info section ends.
			
			// Menu
			
			var menu:Menu = new Menu();
			menu.class_ = "menu_container";
			menu.alpha = 0.6;
			menu.position = "bottom";
			menu.paddingLeft = 30;
			menu.paddingBottom = -50;
			menu.paddingRight = 20;
			menu.autoHide = true;
			menu.visible = false;
			menu.y = -65;
			
			var infoButton:Button = new Button();
			infoButton = createButton(infoButton, "info", 15, 8, infoBtn);
			infoButton.id = "info-btn";
			infoButton.class_ = "info_btn";
			
			menu.addChild(infoButton);
			infoButton.init();
			menu.childToList("infoBtn", infoButton);
			
			var playButton:Button = new Button();
			playButton = createButton(playButton, "play", 15, 8, playBtn);
			playButton.id = "play-btn";
			playButton.class_ = "play_btn";
			
			menu.addChild(playButton);
			playButton.init();
			menu.childToList("playBtn", playButton);
			
			var pauseButton:Button = new Button();
			pauseButton = createButton(pauseButton, "pause", 14.5, 8.5, pauseBtn);
			pauseButton.id = "pause-btn";
			pauseButton.class_ = "pause_btn";
			
			menu.addChild(pauseButton);
			pauseButton.init();
			menu.childToList("pauseBtn", pauseButton);
			
			var closeButton:Button = new Button();
			closeButton = createButton(closeButton, "close", 11, 11, closeBtn);
			closeButton.id = "close-btn";
			closeButton.class_ = "close_btn";
			
			menu.addChild(closeButton);
			closeButton.init();
			menu.childToList("closeBtn", closeButton);
			
			menu.init();
			
			wavplayer.addChild(menu);
			wavplayer.childToList("menu", menu);
			wavplayer.menu = menu;
			
			addChild(wavplayer);
			
			wavplayer.init();
			
			wavplayer.x = 535;
			wavplayer.y = 250;
			wavplayer.width = 500;
			wavplayer.height = 250;
			wavplayer.rotation = -17;
			wavplayer.mouseChildren = true;
			
			wavplayer.gestureEvents = true;
			wavplayer.gestureList = { "n-drag":true, "n-scale":true, "n-rotate":true, "tap":true };
		}
		
		private function createButton(b:Button, type:String, offX:Number, offY:Number, btnClass:Class):Button {
			var btnUp:Container = new Container();
			btnUp.id = type + "-up";
			
			var btnUpBg:Graphic = new Graphic();
			btnUpBg.shape = "circle";
			btnUpBg.alpha = 1;
			btnUpBg.radius = 20;
			btnUpBg.lineStroke = 1.5;
			btnUpBg.lineColor = 0xD9B26A;
			btnUpBg.color = 0xD9B26A;
			
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
			btnDownBg.color = 0x591202;
			
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