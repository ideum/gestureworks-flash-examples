package cml.elements
{
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.element.DatePicker;
	import com.gestureworks.cml.element.Text;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the DatePicker tag
	 */
	public class DatePickerEx extends GestureWorks
	{
		private var date:Text;
		
		public function DatePickerEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "elements/DatePicker.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
			var dp:DatePicker = DatePicker(CMLObjectList.instance.getId("date_picker"));
			dp.addEventListener(StateEvent.CHANGE, update);
			date = CMLObjectList.instance.getId("date");
			date.text = dp.selectedDate;
		}
		
		private function update(e:StateEvent):void
		{
			if (date)
				date.text = e.value;
		}
	}
}