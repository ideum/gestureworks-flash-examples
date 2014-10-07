package as3.elements
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class MP3Ex extends GestureWorks
	{
		public function MP3Ex():void
		{
			gml = "gml/gestures.gml";		
		}
		
		override protected function gestureworksInit():void
		{
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("MP3");
			exTemp.createDesc("<p>This class is used to load an MP3 element that plays back and can be displayed with a graphical wave form.</p> <p>"
			+"It also contains settings for automatic play and looping as well as the wave form color and background. If no wave form is desired, set display=\"none\".</p><p>"
			+"Unlike the WAV element, an MP3 does not have to be compiled as part of an air project.</p> <p>See also: <br/><br/>WAV <br/>WavPlayer</p>");
			
			var mp3:MP3 = new MP3();
			mp3.src = "assets/RuthCalledShot_vbr.mp3";
			mp3.display = "waveform";
			mp3.backgroundAlpha = 0.5;
			mp3.backgroundColor = 0x333333;
			mp3.waveColor = 0x558855;
			mp3.volume = 1.0;
			mp3.pan = 0;
			mp3.loop = true;
			mp3.autoplay = true;
			mp3.width = 600;
			mp3.height = 300;
			mp3.x = 550;
			mp3.y = 100;
			addChild(mp3);
			mp3.init();
		}
	
	}

}