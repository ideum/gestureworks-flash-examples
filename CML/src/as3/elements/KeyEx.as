package as3.elements 
{
	import com.gestureworks.cml.element.Graphic;
	import com.gestureworks.cml.element.Key;
	import com.gestureworks.cml.element.Text;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.events.KeyboardEvent;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class KeyEx extends GestureWorks 
	{
		private var text:Text;
		
		public function KeyEx():void 
		{
			addEventListener(KeyboardEvent.KEY_DOWN, output);			
		}
		
		override protected function gestureworksInit():void 
		{	
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("Key");
			exTemp.createDesc("<p>The Key simulates a keyboard key by dispatching a keyboard event containing the assigned character and key unicode values, when touched. Keys are intended to be contained in a TouchKeyboard for layout and output management.<br /><br />"+
					"This example displays a default Key next to a custom Key to demonstrate the possible key state(initial, down, up, over, out) configurations. Corresponding key actions are output to the text field.</p>"+
					"<br /><p>See also:<br />TouchKeyboard<br />TouchKeyboardCustom<br />Button<br /></p>");
						
			
			//Default button states are, by default, exact copies of the initial state with decreased alphas for both down and over states.																   
			//Default actions are automatically resolved by analyzing the character code(ascii), if the text is a single character, or the key code(unicode).
		    var defaultKey:Key = new Key();
			defaultKey.x = 650;
			defaultKey.y = 255;
			defaultKey.scale = 4;
			defaultKey.text = "D";
			defaultKey.init();
			addChild(defaultKey);
			
			//The Key inherits the button states from the Button providing user control of the key's background at each state. In addition the Key also provides text
			//customization at each state. Refer to the TouchKeyboardCustom example for Key examples of overriding text with ASCII character codes and key action specification using
			//Unicode key codes.
		    var customKey:Key = new Key();
			customKey.x = 900;
			customKey.y = 255;
			customKey.scale = 4;
			customKey.text = getCustomText();
			customKey.initial = getKeyGraphic(0xFF0000);
			customKey.down = getKeyGraphic(0xFFFFFF);
			customKey.downTextColor = 0xFF0000;
			customKey.overTextColor = 0x00FF00;
			customKey.init();
			addChild(customKey);						
						
			//displays the key action
			text = new Text();
			text.x = 850;
			text.y = 480;
			text.autoSize = "left";
			text.fontSize = 40;
			text.textColor = 0xFFFFFF;
			addChild(text);
		}	
		
		/**
		 * Generate a graphic for the key
		 * @param	color the color of the graphic
		 * @return
		 */
		private function getKeyGraphic(color:uint):Graphic
		{
			var kg:Graphic = new Graphic();
			kg.width = 45;
			kg.height = 45;
			kg.shape = "rectangle";
			kg.color = color;
			return kg;
		}
		
		/**
		 * Generate a key Text
		 * @return
		 */
		private function getCustomText():Text
		{
			var text:Text = new Text();
			text.text = "C";
			text.fontSize = 40;
			text.textColor = 0xFFFFFF;
			text.autoSize = "center";
			text.selectable = false;
			text.x = 3;
			text.y = -10;
			return text;
		}
		
		/**
		 * Update text with key action
		 * @param	e
		 */
		private function output(e:KeyboardEvent):void
		{
			text.text = String.fromCharCode(e.charCode);
		}		
		
	}
	
}