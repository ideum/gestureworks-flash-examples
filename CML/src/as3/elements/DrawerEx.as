package as3.elements
{
	import com.gestureworks.cml.elements.Dial;
	import com.gestureworks.cml.elements.Drawer;
	import com.gestureworks.cml.elements.Graphic;
	import com.gestureworks.cml.elements.Image;
	import com.gestureworks.cml.elements.Text;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.events.Event;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class DrawerEx extends GestureWorks 
	{
		
		public function DrawerEx():void 
		{
			gml = "gml/gestures.gml";
		}

		override protected function gestureworksInit():void 
		{
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("Drawer");
			exTemp.createDesc("<p>The Drawer is a container that animates in to conceal its contents (closed state) and animates out to reveal its contents (opent state). The open and closed states"+
				" can be toggled by applying one of the three default gestures (tap, flick, or drag) to the drawer's handle. The default gestures can be overridden to disable or customize the gestures"+ 
				" by assigning a custom gesture list to the handleGestureList attribute. Overriding gestures must share the same gesture type as the default.<br /><br />"+
				"This example demonstrates a Drawer that can be opened and closed by dragging or tapping (flick is disabled) the handle. This Drawer contains a simple graphic object and a nested Drawer with"+
				" a left side handle orientation. Notice changing the handle orientation also changes the in and out direction of the Drawer.</p><br />");
			
			
			var drawer:Drawer = new Drawer();
			drawer.title = "drawer";
			drawer.width = 750;
			drawer.height = 500;
			drawer.x = 500;
			drawer.y = 200;
			drawer.labelFont = "OpenSansBold";
			drawer.handleColor = 0x787F44;
			drawer.bkgColor = 0x44789F;
			drawer.handleGestureList = { "n-tap":true, "n-drag":true };
			drawer.init();
			addChild(drawer);
			
			var g:Graphic = new Graphic();
			g.shape = "circle";
			g.radius = 200;
			drawer.addChild(g);
			
			var nested:Drawer = new Drawer();
			nested.title = "nested";
			nested.width = 300;
			nested.height = 300;
			nested.x = 450;
			nested.y = 100;
			nested.handleColor = 0xFF0000;
			nested.bkgColor = 0xCCCCCC;
			nested.handleOrientation = "left";
			nested.init();
			drawer.addChild(nested);
			
			var img:Image = new Image();
			img.open("assets/images/lake-vuoksa.jpg");
			nested.addChild(img);
	    }
	}
}