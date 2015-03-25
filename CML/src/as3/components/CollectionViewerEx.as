package as3.components
{
	import as3.components.ui.InfoPanel;
	import as3.components.ui.ViewerMenu;
	import com.gestureworks.cml.components.CollectionViewer;
	import com.gestureworks.cml.elements.Collection;
	import com.gestureworks.cml.elements.Frame;
	import com.gestureworks.cml.elements.TouchContainer;
	import com.gestureworks.cml.utils.DisplayUtils;
	import com.gestureworks.cml.utils.NumberUtils;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class CollectionViewerEx extends GestureWorks
	{		
		public function CollectionViewerEx():void{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void{
			//Description
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("CollectionViewer");
			exTemp.createDesc("<p>The CollectionViewer component displays a Collection on the front side and meta-data on the back side. The viewer can be rotated, scaled, and dragged.</p>" 
			+ "<br /><p>See also:<br />Component<br />Collection<br /></p>");
			addChild(exTemp);		
			
			
			//Collection Viewer Component
			var collectionViewer:CollectionViewer = new CollectionViewer();
			collectionViewer.x = 625;
			collectionViewer.y = 150;
			collectionViewer.width = 500;
			collectionViewer.height = 350;
			collectionViewer.rotation = 10;
			collectionViewer.mouseChildren = true;
			collectionViewer.gestureList = { "n-drag": true, "n-scale": true, "n-rotate": true };		
			addChild(collectionViewer);		
						
			
			//FRONT: collection element
			var collection:Collection = new Collection();
			collection.displayCount = 3;
			collection.animateIn = true; 
			collection.background = true; 
			addChild(collection);
			collectionViewer.addChild(collection);			
			
			//add collection objects
			var ts:TouchContainer;
			for (var i:int = 0; i < 5; i++){
				ts = new TouchContainer();
				ts.topOnPoint = true; 
				ts.gestureList = { "n-drag-inertia":true, "n-tap":true};
				ts.nativeTransform = true; 				
				ts.releaseInertia = true; 
				ts.graphics.beginFill(NumberUtils.randomNumber(0x000001, 0xFFFFFF));
				ts.graphics.drawRect(0, 0, 200, 200);
				ts.addEventListener(GWGestureEvent.TAP, function(e:GWGestureEvent):void {
					e.target.visible = false; 
				});
				collection.addChild(ts);		
			}				
			
			
			//BACK: info panel
			var infoPanel:InfoPanel = new InfoPanel();
			infoPanel.bkgColor = 0x6699FF;
			infoPanel.tFontSize = 25;
			infoPanel.title = "Collection Viewer";
			infoPanel.descr = "This example demonstrates the cycling of display objects when the display count decreases below 3 by either disabling an object's visibility (with a tap gesture) or moving it off screen.";
			collectionViewer.addChild(infoPanel);
			collectionViewer.back = infoPanel;
			
			
			//Frame
			var frame:Frame = new Frame();
			frame.targetParent = true;
			frame.mouseChildren = false;
			collectionViewer.addChild(frame);		
			
			
			// Menu
			var menu:ViewerMenu = new ViewerMenu();
			menu.paddingLeft = 250;
			menu.paddingRight = 0;
			collectionViewer.addChild(menu);
			
			
			//Initialize component
			DisplayUtils.initAll(collectionViewer);
		}
	}

}