package as3.elements
{
	import com.gestureworks.cml.element.DatePicker;
	import com.gestureworks.cml.element.Text;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class DatePickerEx extends GestureWorks
	{
		private var text:Text;
		
		public function DatePickerEx():void
		{
			gml = "assets/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			// entry point			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("DatePicker");
			exTemp.createDesc("<p>The DatePicker element provides date selection capability.<br /><br />" + "This example will display the date corresponding with the selection. The initial month will be the current month and current day will be highlighted. Previous and future months can be navigated via left and right arrows. The color scheme can be changed from dark to light by setting the \"colorSchemeDark\" property to false.</p>" + "<br/><p>See also:<br />ColorPicker<br /></p>");
			
			//generate the date picker
			var datePicker:DatePicker = new DatePicker();
			datePicker.x = 575;
			datePicker.y = 100;
			datePicker.scale = 2.5;
			datePicker.colorSchemeDark = false;
			datePicker.init();
			datePicker.addEventListener(StateEvent.CHANGE, update);
			addChild(datePicker);
			
			//display the selected date
			text = new Text();
			text.x = 750;
			text.y = 550;
			text.text = datePicker.selectedDate;
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