package as3.elements 
{
	import com.gestureworks.cml.element.LiveVideo;
	import com.gestureworks.cml.element.VideoCamera;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.media.Camera;
	import flash.media.Microphone;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class LiveVideoEx extends GestureWorks 
	{
		public function LiveVideoEx():void 
		{
			gml = "gml/gestures.gml";				
		}
		
		override protected function gestureworksInit():void 
		{			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("Live Video Element");
			exTemp.createDesc("<p>This class captures and displays video input from a user’s camera. Default has width and height defined for the video but also allows the user to specify their own width and height for the video. This example also captures audio from microphone.</p>");
						
			 var lvElement:LiveVideo = new LiveVideo();
			 lvElement.scale = 3;
			 lvElement.x = 625;
			 lvElement.y = 185;
			 lvElement.microphone = new com.gestureworks.cml.element.Microphone();
			 lvElement.camera = new VideoCamera;
			 lvElement.init();
		   
			addChild(lvElement);
		}
		
	}
	
}