package cml.elements
{
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.element.ScrollBar;
	import com.gestureworks.cml.element.Text;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the ScrollBar tag.
	 */
	public class ScrollBarEx extends GestureWorks
	{
		private var vScroll:ScrollBar;
		private var hScroll:ScrollBar;
		private var hText:Text;
		private var vText:Text;
		
		public function ScrollBarEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "elements/ScrollBar.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
			vScroll = CMLObjectList.instance.getId("sb-vert");
			hScroll = CMLObjectList.instance.getId("sb-horiz");
			vScroll.addEventListener(StateEvent.CHANGE, onScrollEvent);
			hScroll.addEventListener(StateEvent.CHANGE, onScrollEvent);
			vText = CMLObjectList.instance.getId("vert-text");
			hText = CMLObjectList.instance.getId("horiz-text");
		}
		
		private function onScrollEvent(e:StateEvent):void
		{
			var num:int = e.value * 100; // The event returns a decimal value between 0 and 1. 
			// So we'll just multiply it by 100 and round it to an integer for easy reading.
			if (e.target == vScroll)
				vText.text = num.toString();
			else if (e.target == hScroll)
				hText.text = num.toString();
		}
	}
}