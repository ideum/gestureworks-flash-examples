package 
{
	import com.gestureworks.cml.element.WAV;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import com.gestureworks.cml.core.CML_AIR; CML_AIR;
	import flash.display.Sprite;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
////////////////////////////////////////////////////////////////////////////////////////
////																				////
////	Please note that any project using a WAV MUST be an AIR project.		////
////																				////
////////////////////////////////////////////////////////////////////////////////////////

	public class Main extends GestureWorks 
	{
		
		public function Main():void 
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void 
		{
			// entry point
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("WAV");
			exTemp.createDesc("<p>This tag is used to load and play a .WAV file from a local storage device, and optionally provides a graphical visualizer.</p><br /><p>Due to certain constraints in Actionscript programming, this element requires your AS3 project to be an AIR project.</p><br /><p>The WAV also has public methods to stop, play, seek, and pause. It can be placed inside a viewer and paired with buttons similar to the YouTubeElement to control these functions.</p><br /><p>Like other elements, the WAV is a display object, and can be placed inside many other viewers and containers.</p><br /><p>This particular example will load a file of FDR's famous \"infamy\" speech inside a TouchContainer.</p>");
			
			var wav:WAV = new WAV();
			wav.src = "library/assets/FDR-Infamy.wav";
			wav.autoplay = true;
			wav.display = "waveform";
			wav.width = 500;
			wav.height = 500;
			wav.volume = 0.5;
			wav.scale = 0.75;
			wav.x = 500;
			wav.y = 100;
			
			addChild(wav);
			
			wav.init();
		}
		
	}
	
}