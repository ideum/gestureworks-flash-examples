package as3.elements
{
	import com.gestureworks.cml.elements.Collection;
	import com.gestureworks.cml.elements.TouchContainer;
	import com.gestureworks.cml.utils.NumberUtils;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]

	public class CollectionEx extends GestureWorks 
	{
		
		public function CollectionEx():void 
		{
			gml = "gml/gestures.gml";				
		}
		
		override protected function gestureworksInit():void 
		{
			// entry point			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("Collection");
			exTemp.createDesc("<p>The Collection controls the display of its children based on a set number of allowable display objects. All objects not displayed are put into a queue to be invoked when the display count changes (either when an object becomes invisble or is moved offscreen) providing a cyclical browsing of the collection objects.</p>"+
			"<br /><p>This example demonstrates the cycling of display objects when the display count decreases below 3 by either disabling an object's visibility (with a tap gesture) or moving it off screen.</p>");
			
			//collection instance
			var collection:Collection = new Collection();
			collection.x = 460;
			collection.width = 820;
			collection.displayCount = 3;
			collection.animateIn = true; 
			addChild(collection);
			
			//add collection objects
			var ts:TouchContainer;
			for (var i:int = 0; i < 5; i++){
				ts = new TouchContainer();
				ts.topOnPoint = true; 
				ts.gestureList = { "n-drag-inertia":true, "n-rotate":true, "n-scale":true, "n-tap":true};
				ts.nativeTransform = true; 				
				ts.releaseInertia = true; 
				ts.graphics.beginFill(NumberUtils.randomNumber(0x000001, 0xFFFFFF));
				ts.graphics.drawRect(0, 0, 300, 300);
				ts.addEventListener(GWGestureEvent.TAP, function(e:GWGestureEvent):void {
					e.target.visible = false; 
				});
				ts.init();
				collection.addChild(ts);		
			}	
			
			//initialize collection
			collection.init();	
		}					
	}
		
}