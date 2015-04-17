package cml.elements
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.elements.Button;
	import com.gestureworks.cml.elements.Text;
	import com.gestureworks.cml.elements.TouchKeyboard;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.cml.utils.document;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.events.GWTouchEvent;
	import flash.events.Event;
	import flash.events.GestureEvent;
	import flash.events.KeyboardEvent;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the TouchKeyboard tag
	 */
	public class TouchKeyboardEmailEx extends GestureWorks
	{
		private const ENTER_EMAIL:String = "Enter Email...";
		private const SUCCESS:String = "Success!";
		private const INVALID:String = "INVALID EMAIL";
		
		private var text:Text;
		private var submit:Button;
		private var keyboard:TouchKeyboard;
		private var pattern:RegExp = /^[A-Z0-9._%+-]+@(?:[A-Z0-9-]+\.)+[A-Z]{2,4}$/i;		
		
		public function TouchKeyboardEmailEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "elements/TouchKeyboardEmail.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		/**
		 * Register event handlers
		 * @param	event
		 */
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
			
			text = document.getElementById("notepad");
			text.str = ENTER_EMAIL;
			
			submit = document.getElementById("submit_button");
			submit.addEventListener(StateEvent.CHANGE, submitEmail);
			
			keyboard = document.getElementById("tk");
			keyboard.addEventListener(GWTouchEvent.TOUCH_BEGIN, clearText);
		}
		
		/**
		 * Validate email
		 * @param	event
		 */
		private function submitEmail(event:StateEvent):void {
			if (text.str.match(pattern) != null) {
				text.str = SUCCESS;
			}
			else {
				text.str = INVALID;
			}
			keyboard.addEventListener(GWTouchEvent.TOUCH_BEGIN, clearText);
		}
		
		/**
		 * Clear feedback text
		 * @param	e
		 */
		private function clearText(e:GWTouchEvent):void {
			keyboard.clearOutput();
			keyboard.removeEventListener(GWTouchEvent.TOUCH_BEGIN, clearText);
		}
	}
}