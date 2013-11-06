package as3.elements 
{
	import com.gestureworks.cml.elements.Media;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.events.Event;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class MediaEx extends GestureWorks 
	{	
		public function MediaEx():void 
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void 
		{
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("Media");
			exTemp.createDesc("<p>The Media is a wrapper for media elements including the Image, Video, and the MP3. It auto-selects the correct media element based on the input file extension. It suppports the following file extensions: png, gif, jpg, mpeg-4, mp4, m4v, 3gpp, mov, flv, f4v, and mp3.<br /><br />"+
					"This example demonstrates the loading of two different types of media files(.jpg and .mov). </p>"+
					"<br /><p>See also:<br />MediaViewer<br />Image<br />Video<br />MP3<br /></p>");
						
			
			//image media
			var me1:Media = new Media();
			me1.x = 500;
			me1.y = 160;
			me1.src = "assets/images/plane.jpg";
			me1.open("assets/images/plane.jpg");
			me1.scale = .46;
			addChild(me1);
			
			//video media
			var me2:Media = new Media();
			me2.x = 910;
			me2.y = 335;
			me2.src = "assets/market-street.mov";
			me2.open("assets/market-street.mov");
			me2.autoplay = true;
			me2.loop = true;
			addChild(me2);			
		}			
	}	
}