package as3.components
{
	import as3.components.ui.InfoPanel;
	import as3.components.ui.ViewerMenu;
	import com.gestureworks.cml.components.GigapixelViewer;
	import com.gestureworks.cml.elements.Frame;
	import com.gestureworks.cml.elements.Gigapixel;
	import com.gestureworks.cml.utils.DisplayUtils;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class GigapixelViewerEx extends GestureWorks
	{	
		public function GigapixelViewerEx():void
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			//Description
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("Gigapixel Viewer");
			exTemp.createDesc("<p>Viewer classes are used as larger containers which help to combine menu items and extra functionality with elements.</p><br /><p>"
			+"The GigapixelViewer class loads a gigapixel image from an XML index and folder branch, and allows for an info panel or other buttons to be attached to provide more information.</p>");
			addChild(exTemp);
			
			//Gigapixel Viewer Component
			var gigapixelViewer:GigapixelViewer = new GigapixelViewer();
			gigapixelViewer.x = 550;
			gigapixelViewer.y = 150;
			gigapixelViewer.mouseChildren = true;
			gigapixelViewer.gestureList = { "n-drag": true, "n-scale": true, "n-rotate": true };			
			addChild(gigapixelViewer);						
				
			//FRONT: gigapixel element
			var gigapixel:Gigapixel = new Gigapixel();
			gigapixel.src = "assets/deepzoom/space.xml";
			gigapixel.width = 600;
			gigapixel.height = 400;
			gigapixel.mouseChildren = true;			
			gigapixelViewer.addChild(gigapixel);
			
			//BACK: info panel
			var infoPanel:InfoPanel = new InfoPanel();
			infoPanel.bkgColor = 0xFFAE1F;
			infoPanel.title = "Cygnus X";
			infoPanel.tFontSize = 20;
			infoPanel.descr = "This is a compiled mosaic image captured by the NASA Spitzer Space Telescope.";
			infoPanel.dFontSize = 14;
			gigapixelViewer.addChild(infoPanel);
			gigapixelViewer.back = infoPanel;
			
			//Frame
			var frame:Frame = new Frame();
			frame.targetParent = true;
			frame.mouseChildren = false;
			gigapixelViewer.addChild(frame);
			
			// Menu
			var menu:ViewerMenu = new ViewerMenu();
			gigapixelViewer.addChild(menu);			
			
			//Initialize component
			DisplayUtils.initAll(gigapixelViewer);			
		}
	}

}