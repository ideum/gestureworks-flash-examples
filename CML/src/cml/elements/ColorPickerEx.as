package cml.elements
{
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.element.Graphic;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	import flash.geom.ColorTransform;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the ColorPicker tag
	 */
	public class ColorPickerEx extends GestureWorks
	{
		private var bkg:Graphic;
		
		public function ColorPickerEx():void
		{
			super();
			cml = "elements/ColorPicker.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
			addEventListener(StateEvent.CHANGE, changeBkg); //ColorPicker dispatches a state event at each color change
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
			bkg = CMLObjectList.instance.getCSSClass("background", 0);
		}
		
		/**
		 * Handle the color change state event by setting the background to the selected color
		 * @param	e
		 */
		private function changeBkg(e:StateEvent):void
		{
			if (bkg)
			{
				var ct:ColorTransform = new ColorTransform();
				ct.color = e.value;
				bkg.transform.colorTransform = ct;
			}
		}
	}
}