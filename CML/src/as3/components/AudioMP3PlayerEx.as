package as3.components
{
	import as3.components.ui.InfoPanel;
	import as3.components.ui.ViewerMenu;
	import com.gestureworks.cml.components.AudioPlayer;
	import com.gestureworks.cml.elements.Audio;
	import com.gestureworks.cml.elements.Frame;
	import com.gestureworks.cml.utils.DisplayUtils;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class AudioMP3PlayerEx extends GestureWorks
	{
		public function AudioMP3PlayerEx():void
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("AudioPlayer");
			exTemp.createDesc("<p>Viewer and Player classes are used as larger containers which help to combine menu items and extra functionality with elements.</p><br /><p>In this case, the menu not only provides a helpful visual frame and an info panel, but buttons which allow access to the MP3's play and pause functions.</p><br /><p>This example loads an MP3, and flips it with an info-panel.</p><br /><p>Unlike .wav files, loading .mp3 files does not require an AIR project.</p><br /><p>See also:<br/>Audio</p>");
			addChild(exTemp);
			
			//MP3 Player Component
			var mp3Player:AudioPlayer = new AudioPlayer();
			mp3Player.x = 600;
			mp3Player.y = 150;
			mp3Player.gestureList = {"n-drag": true, "n-scale": true, "n-rotate": true};			
			addChild(mp3Player);			
			
			// FRONT: MP3
			var mp3:Audio = new Audio();
			mp3.src = "assets/RuthCalledShot_vbr.mp3";
			mp3.waveform = true; 
			mp3.width = 600;
			mp3.height = 400;
			mp3.autoplay = true;
			mp3.loop = true;
			mp3.waveColor = 0xF97D41;
			mp3.background = true; 
			mp3.backgroundColor = 0x353345;
			mp3.backgroundAlpha = 0.5;
			mp3.targetParent = true;
			mp3.mouseChildren = false;
			mp3Player.addChild(mp3);
			
			//BACK: info panel
			var infoPanel:InfoPanel = new InfoPanel();
			infoPanel.bkgColor = 0xF97D41;
			infoPanel.title = "Babe Ruth";
			infoPanel.descr = "Babe Ruths called shot was the home run hit by Babe Ruth of the New York Yankees in the fifth inning of Game 3 of the 1932 World Series, held on October 1, 1932, at Wrigley Field in Chicago.";
			mp3Player.addChild(infoPanel);
			mp3Player.back = infoPanel;			
			
			//Frame
			var frame:Frame = new Frame();
			frame.frameColor = 0x232223;
			frame.frameThickness = 20;
			frame.targetParent = true;
			frame.mouseChildren = false;
			mp3Player.addChild(frame);
			
			// Menu		
			var menu:ViewerMenu = new ViewerMenu(true, true, true, true);
			menu.margin = 5; 
			menu.y = -65;
			menu.paddingLeft = 400;
			mp3Player.addChild(menu);
			
			//Initialize component
			DisplayUtils.initAll(mp3Player);
		}
	}

}