package as3.elements 
{
	import com.gestureworks.cml.element.Stepper;
	import com.gestureworks.cml.element.Text;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.events.Event;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class StepperEx extends GestureWorks 
	{
		public function StepperEx():void 
		{
			gml = "gml/gestures.gml";				
		}
		
		override protected function gestureworksInit():void 
		{
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("Stepper");
			exTemp.createDesc("<p>This class provides increment and decrement of text and allows the user to enter the text through text input field. This example also provide an option to change the text from float to integer and integer to float by setting the float flag to true or false.The text can be incremented or decremented based on the touch and drag events.</p>");
			
			
			/****Stepper-Float****/
			var st:Stepper = new Stepper();
			
			//change the stepper from float to integer, text color, text value
			st.textColor = 0x0000FF;
			st.text = 0.1;
			st.float = true;
			st.x = 600;
			st.y = 300;
					
			//background graphics
			st.backgroundLineColor = 0x000000;
			st.backgroundLineStroke = 2;
			st.backgroundColor = 0xCCCCCC;
			
			//triangles graphics
			st.topTriangleColor = 0x000000;
			st.topTriangleAlpha = 2;
			st.bottomTriangleColor = 0x000000;
			st.bottomTriangleAlpha = 2;
			
			//text
			var text:Text = new Text();
			text.x = 600;
			text.y = 260;
			text.text = "Stepper-Float";
			text.width = 2000;
			text.color = 0x00FF00;
			text.selectable = false;
			text.font = "OpenSansBold";
			addChild(text);
			
			st.init();
			addChild(st);
			
			
			/****Stepper-Integer****/
			var st1:Stepper = new Stepper();
			
			//change the stepper from integer to float, text color, text value
			st1.textColor = 0x0000FF;
			st1.text = 1;
			st1.float = false;
			st1.x = 1000;
			st1.y = 300;
			
			//background graphics
			st1.backgroundLineColor = 0x000000;
			st1.backgroundLineStroke = 2;
			st1.backgroundColor = 0xCCCCCC;
			
			//triangles graphics
			st1.topTriangleColor = 0x000000;
			st1.topTriangleAlpha = 2;
			st1.bottomTriangleColor = 0x000000;
			st1.bottomTriangleAlpha = 2;

			//text
		    var text1:Text = new Text();
			text1.x = 1000;
			text1.y = 260;
			text1.text = "Stepper-Integer";
			text1.multiline = true;
			text1.wordWrap = true;
			text1.width = 2000;
			text1.color = 0x00FF00;
			text1.selectable = false;
			text1.font = "OpenSansBold";
			addChild(text1);
			
			st1.init();
			addChild(st1);
			
		}
	}
}