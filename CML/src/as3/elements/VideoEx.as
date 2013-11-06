package as3.elements
{
	import com.gestureworks.cml.elements.Video;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class VideoEx extends GestureWorks
	{
		public function VideoEx():void
		{
			gml = "gml/gestures.gml";			
		}
		
		override protected function gestureworksInit():void
		{			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("Video");
			exTemp.createDesc("<p>This class is used to load a video element and play back your selected video from your hard drive. " + "Supported file types are:</p><br /><p><ul><li>.mp4</li><li>.FLV</li><li>.MPEG-4</li><li>.m4v</li><li>3GPP</li><li>.MOV</li><li>.F4V</li></ul></p><br /><p>It also has settings for automatic play and looping.</p><br /><p>See also: <br/><br/>VideoViewer <br/>YouTubeElement <br/>YouTubeViewer</p>");
			
			var video:Video = new Video();
			video.src = "assets/market-street.mov";
			video.autoplay = true;
			video.scale = 1;
			video.x = 500;
			video.y = 100;
			addChild(video);
			
			video.init();
			video.play();
		}
	
	}

}