package as3.elements.AIR
{
	import com.gestureworks.cml.elements.Audio;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	//load AIR classes
	import com.gestureworks.cml.core.CMLAir; CMLAir;	
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
////////////////////////////////////////////////////////////////////////////////////////
////																				////
////	Please note that any project using a WAV MUST be an AIR project.		////
////																				////
////////////////////////////////////////////////////////////////////////////////////////

	public class AudioWAVEx extends GestureWorks 
	{
		
		public function AudioWAVEx():void 
		{
			gml = "gml/gestures.gml";				
		}
		
		override protected function gestureworksInit():void 
		{
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("Audio WAV");
			exTemp.createDesc("<p>This class is used to load and play a .WAV file from a local storage device, and optionally provides a graphical visualizer.</p><br /><p>"
			+"Due to certain constraints in Actionscript programming, this element requires your AS3 project to be an AIR project.</p><br /><p>"
			+"<br /><p>This particular example will load a file of FDR's famous \"infamy\" speech inside a WAV element.</p>");
			
			var wav:Audio = new Audio();
			wav.src = "assets/FDR-Infamy.wav";
			wav.autoplay = true; 
			wav.waveform = true; 
			wav.width = 500;
			wav.height = 500;
			wav.volume = 0.5;
			wav.scale = 0.75;
			wav.x = 650;
			wav.y = 150;
			wav.init();
			
			addChild(wav);
		}
		
	}
	
}