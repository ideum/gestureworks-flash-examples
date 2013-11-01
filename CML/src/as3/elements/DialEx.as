package as3.elements
{
	import com.gestureworks.cml.element.Dial;
	import com.gestureworks.cml.element.Text;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class DialEx extends GestureWorks
	{
		public function DialEx():void
		{
			gml = "assets/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");
			
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("Dial");
			exTemp.createDesc("<p>This tag provides a list of text elements. The text can be moved from top to bottom or bottom to top through the drag event. The dial consists of two modes - Continous and Non-Continous.</p> <br /><p>In continous mode, the text elements move continously without stopping at the end or beginning through the drag event where as in Non-Continous mode, the motion stops when the first element or the last element reaches the center line.</p><br /><p>The text element closest to the center snaps to the center line and also changes its color. It allows the user to set the dial mode from continous to non-continous or non-continous to continous by setting the continous flag to true or false.</p>");
			
			/******Continous Dial******/
			var dial1:Dial = new Dial();
			
			//can add any text, increase or decrease the max items to the dial, can change the text color and selected color
			dial1.text = "Collection 1,Collection 2,Collection 3,Collection 4,Collection 5,Collection 6,Collection 7,Collection 8,Collection 9,Collection 10";
			dial1.maxItemsOnScreen = 5;
			dial1.continuous = true;
			dial1.textColor = 0xDDDDDD;
			dial1.selectedTextColor = 0x000000;
			dial1.x = 500;
			dial1.y = 250;
			
			//gradient matrix graphics 
			dial1.gradientType = "linear";
			dial1.gradientColors = "0x111111,0xDDDDDD,0x111111";
			dial1.gradientAlphas = "1,1,1";
			dial1.gradientRatios = "0,127.5,255";
			dial1.gradientWidth = 300;
			dial1.gradientHeight = 200;
			dial1.gradientX = 25;
			dial1.gradientY = 0;
			dial1.gradientRotation = 1.57;
			
			//background graphics
			dial1.backgroundLineStoke = 3;
			dial1.backgroundAlpha = 5;
			
			//triangles graphics
			dial1.leftTriangleColor = 0x303030;
			dial1.rightTriangleColor = 0x303030;
			
			//center line graphics
			dial1.centerLineLineStoke = 1;
			dial1.centerLineOutlineColor = 0xAAAAAAA;
			dial1.centerLineOutlineAlpha = 0.4;
			dial1.centerLineColor = 0x666666;
			dial1.centerLineAlpha = 0.2;
			
			//text
			var text:Text = new Text();
			text.x = 590;
			text.y = 200;
			text.text = "Dial-Continous";
			text.width = 3000;
			text.color = 0xCC0099;
			text.selectable = false;
			text.font = "OpenSansBold";
			addChild(text);
			
			//initialise method for dial
			dial1.init();
			
			addChild(dial1);
			
			/******Non-Continous Dial******/
			var dial2:Dial = new Dial();
			
			//can add any text, increase or decrease the max items to the dial, can change the text color and selected color
			dial2.text = "Collection 1,Collection 2,Collection 3,Collection 4,Collection 5,Collection 6,Collection 7,Collection 8,Collection 9,Collection 10";
			dial2.maxItemsOnScreen = 5;
			dial2.continuous = false;
			dial2.textColor = 0xDDDDDD;
			dial2.selectedTextColor = 0x000000;
			dial2.x = 900;
			dial2.y = 250;
			
			//gradient matrix graphics 
			dial2.gradientType = "linear";
			dial2.gradientColors = "0x111111,0xDDDDDD,0x111111";
			dial2.gradientAlphas = "1,1,1";
			dial2.gradientRatios = "0,127.5,255";
			dial2.gradientWidth = 300;
			dial2.gradientHeight = 200;
			dial2.gradientX = 25;
			dial2.gradientY = 0;
			dial2.gradientRotation = 1.57;
			
			//background graphics
			dial2.backgroundLineStoke = 3;
			dial2.backgroundAlpha = 5;
			
			//triangles graphics
			dial2.leftTriangleColor = 0x303030;
			dial2.rightTriangleColor = 0x303030;
			
			//center line graphics
			dial2.centerLineLineStoke = 1;
			dial2.centerLineOutlineColor = 0xAAAAAAA;
			dial2.centerLineOutlineAlpha = 0.4;
			dial2.centerLineColor = 0x666666;
			dial2.centerLineAlpha = 0.2;
			
			var text1:Text = new Text();
			text1.x = 980;
			text1.y = 200;
			text1.text = "Dial-NonContinous";
			text1.width = 3000;
			text1.color = 0xCC0099;
			text1.font = "OpenSansBold";
			text1.selectable = false;
			addChild(text1);
			
			dial2.init();
			addChild(dial2);
		}
	}
}