package as3.elements
{
	import com.gestureworks.cml.elements.Container;
	import com.gestureworks.cml.elements.Graphic;
	import com.gestureworks.cml.elements.TabbedContainer;
	import com.gestureworks.cml.elements.Tab;
	import com.gestureworks.cml.layouts.RandomLayout;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class TabbedContainerEx extends GestureWorks
	{
		private var shapes:Array = ["rectangle", "circle", "triangle"];
		
		public function TabbedContainerEx():void
		{
			gml = "gml/gestures.gml";		
		}
		
		override protected function gestureworksInit():void
		{
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("TabbedContainer");
			exTemp.createDesc("<p>The TabbedContainer allows switching between a group of Tabs by selecting their associated tabs. <br /><br />" 
			+ "This example will demonstrate the change in content each time a different tab is touched.</p>" + "<br/ ><br /><p>See also:<br />Container<br />Tab<br /></p>");
			
			//create tabbed container
			var tc:TabbedContainer = new TabbedContainer();
			tc.x = 625;
			tc.y = 150;
			tc.addChild(getTab("tab1"));
			tc.addChild(getTab("tab2"));
			tc.addChild(getTab("tab3"));
			tc.addChild(getTab("tab4"));
			tc.init();
			
			addChild(tc);
		}
		
		/**
		 * Generate tab element
		 * @param	title
		 * @return
		 */
		private function getTab(title:String):Tab
		{
			var tab:Tab = new Tab();
			tab.title = title;
			tab.tabHeight = 40;
			tab.addChild(getRandomShapes()); //add tab element content
			return tab;
		}
		
		/**
		 * Generate content of random shapes
		 * @return
		 */
		private function getRandomShapes():Container
		{
			var shapesC:Container = new Container();
			
			for (var i:int = 0; i < 10; i++)
			{
				var shape:Graphic = new Graphic();
				shape.shape = shapes[randomInt(0, 3)];
				shape.color = randomNumber(0x000001, 0xFFFFFF);
				shape.width = randomNumber(10, 200);
				shape.height = randomNumber(10, 200);
				shape.radius = randomNumber(10, 200);
				shape.alpha = randomNumber(.1, 1);
				shapesC.addChild(shape);
			}
			
			shapesC.applyLayout(new RandomLayout());
			return shapesC;
		}
		
		/**
		 * Generates a reandom int between min and max
		 * @param	min  the bottom limit
		 * @param	max  the top limit
		 * @return  a random int
		 */
		protected static function randomInt(min:int, max:int):int
		{
			return min + Math.random() * (max - min);
		}
		
		/**
		 * Generates a reandom number between min and max
		 * @param	min  the bottom limit
		 * @param	max  the top limit
		 * @return  a random number
		 */
		protected static function randomNumber(min:Number, max:Number):Number
		{
			return min + Math.random() * (max - min);
		}
	
	}

}