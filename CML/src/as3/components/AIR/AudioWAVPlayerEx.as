package as3.components.AIR 
{
	import as3.components.ui.InfoPanel;
	import as3.components.ui.ViewerMenu;
	import com.gestureworks.cml.components.AudioPlayer;
	import com.gestureworks.cml.elements.Audio;
	import com.gestureworks.cml.elements.Frame;
	import com.gestureworks.cml.utils.DisplayUtils;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	//load AIR classes
	import com.gestureworks.cml.core.CMLAir; CMLAir;

	 [SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	 
	public class AudioWAVPlayerEx extends GestureWorks 
	{	
		public function AudioWAVPlayerEx():void 
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void 
		{
			//Description			
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("AudioPlayer");
			exTemp.createDesc("<p>Viewer and Player classes are used as larger containers which help to combine menu items and extra functionality with elements.</p><br /><p>"
			+"Due to certain constraints in Actionscript programming, WAV support for this element requires your AS3 project to be an AIR project.</p><br /><p>"
			+"In this case, the menu not only provides a helpful visual frame and an info panel, but buttons which allow access to the WAV's play and pause functions.</p><br /><p>"
			+"It has also been styled differently to give it a more unique border and theme.</p><br /><p>This example loads a WAV, and flips it with an info-panel.</p>");
			addChild(exTemp);
			
			//WAV Player Component
			var wavplayer:AudioPlayer = new AudioPlayer();
			wavplayer.x = 600;
			wavplayer.y = 250;
			wavplayer.width = 500;
			wavplayer.height = 250;
			wavplayer.mouseChildren = true;			
			wavplayer.gestureList = { "n-drag":true, "n-scale":true, "n-rotate":true };			
			addChild(wavplayer);
			
			//FRONT: WAV element			
			var wav:Audio = new Audio();
			wav.src = "assets/FDR-Infamy.wav";
			wav.autoplay = true;
			wav.waveform = true; 
			wav.waveColor = 0xD9B26A;
			wav.background = true; 
			wav.backgroundColor = 0x574A59;
			wav.volume = 0.5;			
			wavplayer.addChild(wav);	
			
			//BACK: info panel
			var infoPanel:InfoPanel = new InfoPanel();
			infoPanel.bkgColor = 0x665533;
			infoPanel.tFontSize = 20;
			infoPanel.dFontSize = 16;
			infoPanel.title = "FDR's Infamy Speech";
			infoPanel.descr = "Franklin Deleanor Roosevelt's address to a Joint Session of Congress after the attack on the Pearl Harbor Naval Base by the Empire of Japan.";
			wavplayer.addChild(infoPanel);
			wavplayer.back = infoPanel;			
			
			//Frame
			var frame:Frame = new Frame();
			frame.frameColor = 0x591202;
			frame.targetParent = true;
			frame.mouseChildren = false;
			wavplayer.addChild(frame);
			
			// Menu
			var menu:ViewerMenu = new ViewerMenu(true, true, true, true);
			menu.btnColor = 0xD9B26A;
			menu.btnLineColor = 0xD9B26A;
			menu.paddingLeft = 300;
			menu.margin = 5; 
			wavplayer.addChild(menu);
			
			//Initialize component
			DisplayUtils.initAll(wavplayer);			
		}		
	}
	
}