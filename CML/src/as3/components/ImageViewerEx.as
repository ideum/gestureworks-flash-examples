package as3.components
{
	import as3.components.ui.InfoPanel;
	import as3.components.ui.ViewerMenu;
	import com.gestureworks.cml.components.ImageViewer;
	import com.gestureworks.cml.elements.Frame;
	import com.gestureworks.cml.elements.Image;
	import com.gestureworks.cml.utils.DisplayUtils;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class ImageViewerEx extends GestureWorks
	{		
		public function ImageViewerEx():void
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			//Description
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("ImageViewer");
			exTemp.createDesc("<p>The ImageViewer is a component that is primarily meant to display an Image on the front side and meta-data on the back side. "
			+"It is composed of the following elements: image, front, back, menu, and frame. The width and height of the component are automatically set to the dimensions of the image unless it is previously specifed by the component.<br /><br />" 
			+ "This example demonstrates an image on the front of an ImageViewer and an info panel on the back. The viewer can be rotated, scaled, and dragged.</p>" 
			+ "<br /><p>See also:<br />Component<br />Image<br /></p>");
			addChild(exTemp);
			
			//Image Viewer Component
			var imageViewer:ImageViewer = new ImageViewer();
			imageViewer.x = 625;
			imageViewer.y = 150;
			imageViewer.rotation = 10;
			imageViewer.mouseChildren = true;
			imageViewer.gestureList = {"n-drag": true, "n-scale": true, "n-rotate": true};			
			addChild(imageViewer);			
			
			//FRONT: image element
			var image:Image = getImage("assets/images/train.jpg");
			image.targetParent = true;
			imageViewer.addChild(image);
			
			//BACK: info panel
			var infoPanel:InfoPanel = new InfoPanel();
			infoPanel.bkgColor = 0x6699FF;
			infoPanel.tFontSize = 25;
			infoPanel.title = "The Gare Montparnasse";
			infoPanel.descr = "The Gare Montparnasse became famous for the derailment on 22 October 1895 of the Granville–Paris Express, which overran the buffer stop.";
			imageViewer.addChild(infoPanel);
			imageViewer.back = infoPanel;
			
			//Frame
			var frame:Frame = new Frame();
			frame.targetParent = true;
			frame.mouseChildren = false;
			imageViewer.addChild(frame);			
			
			// Menu
			var menu:ViewerMenu = new ViewerMenu();
			menu.paddingLeft = 250;
			menu.paddingRight = 0;
			imageViewer.addChild(menu);
			
			//Initialize component
			DisplayUtils.initAll(imageViewer);
		}
		
		/**
		 * Returns an image element generated by the external source
		 * @param	source  the source file
		 * @return
		 */
		private function getImage(source:String):Image
		{
			var img:Image = new Image();
			img.open(source);
			img.width = 353;
			img.height = 420;
			return img;
		}
	}

}