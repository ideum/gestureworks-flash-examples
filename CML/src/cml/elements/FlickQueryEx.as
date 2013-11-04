package cml.elements
{
	import com.gestureworks.cml.core.*;
	import com.gestureworks.cml.element.*;
	import com.gestureworks.cml.events.*;
	import com.gestureworks.core.*;
	import flash.events.*;
	import flash.net.*;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the FlickrQuery tag.
	 */
	public class FlickQueryEx extends GestureWorks
	{
		private var flickrQuery:FlickrQuery;
		
		public function FlickQueryEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "elements/FlickrQuery.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
			
			addEventListener(TextEvent.LINK, onAnchor);
			
			// Find the id of the FlickrQuery so we can reference it programatically.
			flickrQuery = CMLObjectList.instance.getId("flickr-query");
			
			// Add the event listener for a completed search.
			flickrQuery.addEventListener(StateEvent.CHANGE, onFlickrResult);
			flickrQuery.flickrSearch(); // Run the search.
		}
		
		private function onFlickrResult(e:StateEvent):void
		{
			// If this is not the flickrResult, leave this method.
			if (e.value != "flickrResult")
				return;
			
			// Variable for some positioning.
			var _x:Number = 500;
			
			for (var i:Number = 0; i < flickrQuery.resultPhotos.length; i++)
			{ // Lets loop through the resultPhotos.
				// Create a new flickr object.
				var flickrPic:Flickr = new Flickr();
				flickrPic.src = flickrQuery.resultPhotos[i].id; // Set the src of the new Flickr object to the id of the corresponding result photo in the array.
				
				flickrPic.apikey = flickrQuery.apikey; // Lets just borrow the API key from the FlickrQuery
				
				// Position and add child.
				flickrPic.x = _x;
				addChild(flickrPic);
				
				// Run init to make sure the Flickr element loads the picture now assigned to it.
				flickrPic.init();
				
				// Update positioning for the next photo.
				_x += 250;
			}
		}
		
		private function onAnchor(event:TextEvent)
		{
			var urlRequest:URLRequest = new URLRequest(event.text);
			navigateToURL(urlRequest);
			urlRequest = null;
		}
	}
}