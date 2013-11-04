package as3.elements
{
	import com.gestureworks.cml.element.YouTube;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class YouTubeEx extends GestureWorks
	{
		public function YouTubeEx():void
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("YouTube Element");
			exTemp.createDesc("<p>This tag is used to load in YouTube videos from their ID labels using the YouTube API. It can be placed inside a viewer, containers, and collection viewers, and has the methods \"Play\", \"Pause\", \"Stop\", \"Resume\", \"Seek\", and \"Close\" available.</p><br /><p>This example will automatically load and play a video from the web.</p><br /><p>This example uses YouTube's \"chromed\" player, which automatically has buttons to control playback, volume, etc. When a YouTube is placed inside a touchContainer, it is recommended to set chrome=\"false\" and to use custom buttons, since touch events will not reach the \"chromed\" player.</p>");
			
			/* The Video ID is the 10-digit ID associated with the video link. For example, a direct URL to the video used in this example is:
			   http://www.youtube.com/watch?v=h0MZX-D8xzA Notice the "h0MZX-D8xzA" is the video's id. A video must be set to allow embedding from its owner
			   to be used by the YouTube API. If you receive "Error 100" or "Error 101", or "150", the video either no longer exists, or its embedding has
			 been disabled. */
			
			var ytElement:YouTube = new YouTube();
			ytElement.x = 600;
			ytElement.y = 150;
			ytElement.src = "h0MZX-D8xzA";
			ytElement.autoplay = true;
			ytElement.chrome = true;
			addChild(ytElement);
			ytElement.init();
		}
	
	}

}