package as3.elements
{
	import com.gestureworks.cml.elements.Album;
	import com.gestureworks.cml.elements.Button;
	import com.gestureworks.cml.elements.Container;
	import com.gestureworks.cml.elements.Graphic;
	import com.gestureworks.cml.elements.Image;
	import com.gestureworks.cml.elements.Text;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.cml.utils.CloneUtils;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class ButtonEx extends GestureWorks
	{
		private var text:Text;
		
		public function ButtonEx():void
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			addEventListener(StateEvent.CHANGE, buttonState);
			
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("Button");
			exTemp.createDesc("<p>The Button hides or shows DisplayObjects on specified state events. The available button states are initial, down, up, over and out.<br /><br />" + "This example demonstrates the assignment of DisplayObjects to basic touch events and their visibility settings at each event. When a state event occurs, the associated object is displayed and all other objects are hidden. The two required attributes are \"hit\" (defines the object receiving the events) and \"initial\" (displays the initial object).</p>" + "<br/><p>See also:<br />Key<br /></p>");
			
			var button:Button = new Button();
			button.x = 750;
			button.y = 200;
			button.dispatch = "initial:initial:down:down:up:up:over:over:out:out";
			
			//assign a different color to each button state
			button.hit = getCircle(0x000000, 0);
			; //hit area
			button.initial = getCircle(0xFFFFFF); //white
			button.down = getCircle(0x0000FF); //blue
			button.up = getCircle(0xFF0000); //red
			button.over = getCircle(0x00FF00); //green
			button.out = getCircle(0xFF00FF); //purple
			
			button.init();
			addChild(button);
			
			//displays the current button state
			text = new Text();
			text.x = 810;
			text.y = 420;
			text.text = "initial";
			text.autoSize = "center";
			text.fontSize = 50;
			text.textColor = 0xFFFFFF;
			addChild(text);
		}
		
		/**
		 * Returns a circle graphic
		 * @param	color the color of the circle
		 * @param	alpha the alpha of the cirlce
		 * @return
		 */
		private function getCircle(color:uint, alpha:Number = 1):Graphic
		{
			var circle:Graphic = new Graphic();
			circle.shape = "circle";
			circle.radius = 100;
			circle.color = color;
			circle.alpha = alpha;
			circle.lineStroke = 0;
			return circle;
		}
		
		/**
		 * Update text with current button state
		 * @param	e
		 */
		private function buttonState(e:StateEvent):void
		{
			text.text = e.value;
		}
	
	}

}