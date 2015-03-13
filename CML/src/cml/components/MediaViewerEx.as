package cml.components
{
	import com.gestureworks.cml.components.MediaViewer;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.elements.Media;
	import com.gestureworks.cml.elements.Text;
	import com.gestureworks.cml.utils.document;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the CML MediaViewer tag.
	 */
	public class MediaViewerEx extends GestureWorks
	{
		private var media:Media; 
		private var title:Text;
		private var descr:Text; 
		
		private var files:Array = ["assets/market-street.mov", "assets/images/plane.jpg", "assets/RuthCalledShot_vbr.mp3"];
		private var titles:Array = ["Market Street", "Wright Brothers", "Babe Ruth"];
		private var descrs:Array = ["A Trip Down Market Street is a 13-minute actuality film recorded by placing a movie camera on the front of a cable car as it travels down San Franciscos Market Street.", "Orville Wright's famous first airplane flight.", "Babe Ruths called shot was the home run hit by Babe Ruth of the New York Yankees in the fifth inning of Game 3 of the 1932 World Series, held on October 1, 1932, at Wrigley Field in Chicago."];
		private var index:int = 0;
		
		public function MediaViewerEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "components/MediaViewer.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
			
			media = document.getElementById("media");
			title = document.getElementById("title");
			descr = document.getElementById("descr");
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, updateMedia);
			
			var mv:MediaViewer = document.getElementsByTagName(MediaViewer)[0];
			var c:MediaViewer = mv.clone();
		}
		
		private function updateMedia(e:KeyboardEvent):void {
			if (e.keyCode == 13) {
				index = index == files.length - 1 ? 0 : index + 1;
				title.str = titles[index];
				descr.str = descrs[index];
				media.src = files[index];
			}
		}
	}
}