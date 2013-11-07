package as3.components
{
	import as3.components.ui.InfoPanel;
	import as3.components.ui.ViewerMenu;
	import com.gestureworks.cml.components.FlickrViewer;
	import com.gestureworks.cml.elements.Flickr;
	import com.gestureworks.cml.elements.Frame;
	import com.gestureworks.cml.utils.DisplayUtils;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class FlickrViewerEx extends GestureWorks
	{	
		public function FlickrViewerEx():void
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			//Description
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("Flickr Viewer");
			exTemp.createDesc("<p>This class is used to load images in from Flickr using the Flickr API. It can be placed inside a viewer, containers, and collection viewers.</p><br /><p>"
			+"You will need two things to load a picture from Flickr: a picture ID, and an API Key. Your API key is something you can sign up for free at <a href=\"http://www.flickr/com/service/api\"> "
			+"http://www.flickr/com/service/api</a> to allow you to submit queries to the Flickr database.</p><br /><p>This example will not actually load a picture until you set the API key property with your own key.</p><br /><p>"
			+"Pictures must be public and available to be accessed.</p>");
			addChild(exTemp);
			
			//Flickr Viewer Component
			var flickrViewer:FlickrViewer = new FlickrViewer();
			flickrViewer.x = 600;
			flickrViewer.y = 100;
			flickrViewer.mouseChildren = true;
			flickrViewer.gestureList = { "n-drag": true, "n-scale": true, "n-rotate": true };	
			addChild(flickrViewer);
						
			//FRONT: flickr element
			var flickr:Flickr = new Flickr();
			flickr.apikey = "5487a9cd58bb07a37700558d6362972f";
			flickr.src = "4385244497";			
			flickrViewer.addChild(flickr);
			
			//BACK: info panel
			var infoPanel:InfoPanel = new InfoPanel();
			infoPanel.bkgColor = 0x6699FF;
			infoPanel.tFontSize = 20;
			infoPanel.dFontSize = 16;
			infoPanel.title = "Chrome Alum Crystals";
			infoPanel.descr = "This is a photo of chrome alum crystals in a chrome alum solution, at 20x magnification. Taken with my Canon SX110 IS, through a Novex stereo microscope with lighting from underneath. The crystals are grown from a saturated solution and are no more than 1 mm in diameter. Created myself, Paul, from www.paulslab.com";
			flickrViewer.addChild(infoPanel);
			flickrViewer.back = infoPanel;
			flickrViewer.background = infoPanel.bkg;
			
			//Frame
			var frame:Frame = new Frame();
			frame.targetParent = true;
			frame.mouseChildren = false;
			flickrViewer.addChild(frame);			
			
			// Menu
			var menu:ViewerMenu = new ViewerMenu();
			menu.paddingLeft = 375;
			flickrViewer.addChild(menu);
			
			//Initialize component
			DisplayUtils.initAll(flickrViewer);				
		}
	}

}