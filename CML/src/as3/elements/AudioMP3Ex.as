package as3.elements
{
	import cml.elements.StateEx;
	import com.gestureworks.cml.elements.Audio;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.cml.base.media.MediaStatus;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;	
	import flash.events.KeyboardEvent;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]

	public class AudioMP3Ex extends GestureWorks 
	{
		
		public function AudioMP3Ex():void 
		{
			gml = "gml/gestures.gml";				
		}
		
		override protected function gestureworksInit():void 
		{
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("Audio MP3");
			exTemp.createDesc("<p>This class is used to load and play a .MP3 file from a local storage device, and optionally provides a graphical visualizer.</p><br /><p>"
			+"Unlike WAV support, loading a MP3 file does not require an AIR project.</p>");
			
			var mp3:Audio = new Audio();
			mp3.src = "assets/RuthCalledShot_vbr.mp3";
			mp3.autoplay = true; 
			mp3.waveform = true; 
			mp3.width = 500;
			mp3.height = 500;
			mp3.volume = 0.5;
			mp3.scale = 0.75;
			mp3.x = 650;
			mp3.y = 150;
			mp3.init();
			
			addChild(mp3);
		}
		
	}
	
}