package as3.elements
{
	import com.gestureworks.cml.element.Flickr;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class FlickrEx extends GestureWorks
	{
		public function FlickrEx():void
		{
			gml = "gml/gestures.gml";		
		}
		
		override protected function gestureworksInit():void
		{
			// entry point
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("Flickr Element");
			exTemp.createDesc("<p>This class is used to load images in from Flickr using the Flickr API. It can be placed inside a viewer, containers, and collection viewers.</p><br /><p>You will need two things to load a picture from Flickr: a picture ID, and an API Key. Your API key is something you can sign up for free at <a href=\"http://www.flickr/com/service/api\"> http://www.flickr/com/service/api</a> to allow you to submit queries to the Flickr database.</p><br /><p>This example will not actually load a picture until you set the API key property with your own key.</p><br /><p>Pictures must be public and available to be accessed.</p>");
			
			/**
			 * The Flickr ID is a numerical ID associated with the picture. To find a picture ID from a link, look at the digits following the slash after the contributor's name.
			 * For example, in: www.flickr.com/photos/paulslab/4385244497/, the number "438524497" is the ID you need to put in the "src" field of the class.
			 */
			var flickrImg:Flickr = new Flickr();
			flickrImg.apikey = "ENTER YOUR FLICKR API KEY";
			flickrImg.src = "5703998760";
			flickrImg.x = 500;
			flickrImg.y = 200;
			addChild(flickrImg);
			
			//Call init() once you're ready to display the class.
			flickrImg.init();
		}
	
	}

}