package as3.elements
{
	import com.gestureworks.cml.element.MP3;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class MP3Ex extends GestureWorks
	{
		public function MP3Ex():void
		{
		
		}
		
		override protected function gestureworksInit():void
		{
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("MP3");
			exTemp.createDesc("<p>This tag is used to load an MP3 element that plays back and can be displayed with a graphical wave form.</p> <p>Automatic play and looping can be set in the CML tag, as well as the wave form color and background. If now wave form is desired, set display=\"none\".</p> <p>Unlike the WavElement, an MP3 does not have to be compiled as part of an air project.</p> <p>See also: <br/><br/>WavElement <br/>WavPlayer</p>");
			
			var mp3:MP3 = new MP3();
			mp3.src = "assets/RuthCalledShot_vbr.mp3";
			mp3.display = "waveform";
			mp3.backgroundAlpha = 0.5;
			mp3.backgroundColor = 0x333333;
			mp3.waveColor = 0x558855;
			mp3.volume = 1.0;
			mp3.pan = 0;
			mp3.loop = true;
			mp3.preload = true;
			mp3.autoplay = true;
			mp3.width = 600;
			mp3.height = 400;
			mp3.x = 550;
			mp3.y = 125;
			addChild(mp3);
			mp3.init();
		}
	
	}

}