package cml.elements
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	import flash.events.TextEvent;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the Flickr tag.
	 */
	public class FlickrEx extends GestureWorks
	{
		public function FlickrEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "elements/Flickr.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
			addEventListener(TextEvent.LINK, onAnchor);
		}
		
		private function onAnchor(event:TextEvent)
		{
			var urlRequest:URLRequest = new URLRequest(event.text);
			navigateToURL(urlRequest);
			urlRequest = null;
		}
	}
}