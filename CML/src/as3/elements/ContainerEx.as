package as3.elements
{
	import com.gestureworks.cml.element.Container;
	import com.gestureworks.cml.element.Graphic;
	import com.gestureworks.cml.element.Image;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class ContainerEx extends GestureWorks
	{
		
		public function ContainerEx():void
		{
		
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");
			
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("Container");
			exTemp.createDesc("<p>This tag can be used to create display hierarchies. It keeps track of children through the childlist property.</p> <br /><p>The container gives a large amount of control in keeping track of objects and can hold a variety of items.</p>");
			
			var container1:Container = new Container();
			addChild(container1);
			
			var loopCounter:Number = 0;
			for (var i:Number = 0; i < 2; i++)
			{
				for (var h:Number = 0; h < 2; h++)
				{
					
					var redCircle:Graphic = new Graphic();
					redCircle.shape = "circle";
					redCircle.radius = 20;
					redCircle.lineStroke = 0;
					redCircle.color = 0xff0000;
					redCircle.id = "redCircle" + i;
					redCircle.x = h * redCircle.radius;
					redCircle.y = i * redCircle.radius;
					container1.addChild(redCircle);
				}
			}
			container1.x = 500;
			container1.scale = 5;
			container1.alpha = .5;
			
			var container2:Container = new Container();
			addChild(container2);
			
			var bulbs1:Image = new Image();
			bulbs1.open("assets/spectrum/bulbs_vis.jpg");
			bulbs1.width = 200;
			bulbs1.id = "image1";
			container2.addChild(bulbs1);
			
			var bulbs2:Image = new Image();
			bulbs2.open("assets/spectrum/bulbs_off_therm.jpg");
			bulbs2.width = 200;
			bulbs2.id = "image2";
			bulbs2.x = 200;
			container2.addChild(bulbs2);
			
			var bulbs4:Image = new Image();
			bulbs4.open("assets/spectrum/bulbs_therm.jpg");
			bulbs4.width = 200;
			bulbs4.id = "image4";
			bulbs4.x = 200;
			bulbs4.y = 200;
			container2.addChild(bulbs4);
			
			var bulbs3:Image = new Image();
			bulbs3.open("assets/spectrum/bulbs_off_uv.jpg");
			bulbs3.width = 200;
			bulbs3.id = "image3";
			bulbs3.y = 200;
			container2.addChild(bulbs3);
			container2.x = 500;
			container2.y = 300;
			
			for (var j:Number = 0; j < container1.childList.length; j++)
			{
				trace(container1.childList.getIndex(j).id);
			}
			
			for (var k:Number = 0; k < container2.childList.length; k++)
			{
				trace(container1.childList.getIndex(k).id);
			}
		}
	
	}

}