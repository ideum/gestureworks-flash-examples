package cml.elements
{
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.elements.Text;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the Key tag.
	 */
	public class KeyEx extends GestureWorks
	{
		private var text:Text;
		
		public function KeyEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "elements/Key.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
			addEventListener(KeyboardEvent.KEY_DOWN, output);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
			text = CMLObjectList.instance.getId("text");
		}
		
		private function output(e:KeyboardEvent):void
		{
			text.text = String.fromCharCode(e.charCode);
		}
	}
}