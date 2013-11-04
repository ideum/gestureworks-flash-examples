package as3.elements
{
	import com.gestureworks.cml.element.RadioButtons;
	import com.gestureworks.cml.element.Text;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class RadioButtonsEx extends GestureWorks
	{
		private var text:Text;
		
		public function RadioButtonsEx():void
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("RadioButtons");
			exTemp.createDesc("<p>The RadioButtons element represents a group of radio buttons generated from a user defined list of labels. Other configurable properties include the primary font characteristics (style, size, and color), placement direction (right to left or top to bottom), and the spacing between the buttons.<br /><br />" + "This example demonstrates the selection of a value from a defined set of choices by selecting a corresponding button.</p>" + "<br /><p>See also:<br />Toggle<br /></p>");
			
			//create radio buttons
			var rbs:RadioButtons = new RadioButtons();
			rbs.x = 650;
			rbs.y = 100;
			rbs.labels = "Male,Female,Dragon,Turtle,Monkey,Horse";
			rbs.fontSize = 25;
			rbs.fontColor = 0x00FF00;
			rbs.fontStyle = "OpenSansBold";
			rbs.verticalOffset = 90;
			rbs.init();
			rbs.addEventListener(StateEvent.CHANGE, update);
			addChild(rbs);
			
			//display the selected date
			text = new Text();
			text.x = 900;
			text.y = 100;
			text.autoSize = "left";
			text.fontSize = 50;
			text.textColor = 0xFFFFFF;
			text.selectable = false;
			addChild(text);
		}
		
		/**
		 * Set the display to the selected date
		 * @param	e
		 */
		private function update(e:StateEvent):void
		{
			if (text)
				text.text = e.value;
		}
	}

}