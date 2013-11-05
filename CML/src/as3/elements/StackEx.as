package as3.elements
{
	import com.gestureworks.cml.element.Graphic;
	import com.gestureworks.cml.element.Image;
	import com.gestureworks.cml.element.Slideshow;
	import com.gestureworks.cml.element.Stack;
	import com.gestureworks.cml.element.Text;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class StackEx extends GestureWorks
	{
		public function StackEx():void
		{
			gml = "gml/gestures.gml";				
		}
		
		override protected function gestureworksInit():void
		{
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("Stack");
			exTemp.createDesc("<p>This tag is a container that gathers its children into a stack, and allows the user to shuffle through them using a specified user input.<br /><br />"
			+"This example will shuffle through the stack on each mouse/touch up event. The stack may optionally loop.</p><br /><p>See also:<br />Container<br /></p>");
			
			var complete:Boolean = false;
			var imageCount:Number = 0;
			
			var stack:Stack = new Stack();
			stack.toggle = "up";
			stack.x = 750;
			stack.y = 150;
			stack.loop = false;
			addChild(stack);
			
			var text1:Text = new Text();
			text1.width = 250;
			text1.height = 700;
			text1.multiline = true;
			text1.wordWrap = true;
			text1.selectable = false;
			text1.text = "This is the top of the stack. Click or touch here to advance to the next child.";
			text1.color = 0xffffff;
			text1.fontSize = 20;
			
			var img1:Image = new Image();
			img1.src = "assets/images/Helicopter.png";
			img1.height = 500;
			img1.open(img1.src);
			//Add Eventlisteners to your images to make sure their load is complete before trying to initialize a container class.
			img1.addEventListener(Event.COMPLETE, imgLoaded);
			
			var text2:Text = new Text();
			text2.width = 250;
			text2.height = 700;
			text2.multiline = true;
			text2.wordWrap = true;
			text2.selectable = false;
			text2.text = "The children can be any display object.";
			text2.color = 0xffffff;
			text2.fontSize = 20;
			
			var rect:Graphic = new Graphic();
			rect.shape = "rectangle";
			rect.width = 200;
			rect.height = 200;
			rect.color = 0xAA2222;
			
			var img2:Image = new Image();
			img2.src = "assets/images/500px-Bi-crystal.jpg";
			img2.height = 500;
			img2.open(img2.src);
			img2.addEventListener(Event.COMPLETE, imgLoaded);
			
			var text3:Text = new Text();
			text3.width = 250;
			text3.height = 700;
			text3.multiline = true;
			text3.wordWrap = true;
			text3.selectable = false;
			text3.text = "This is the bottom of the stack.";
			text3.color = 0xffffff;
			text3.fontSize = 20;
			
			complete = true;
			
			function imgLoaded(e:Event):void
			{
				imageCount++;
				
				e.target.removeEventListener(Event.COMPLETE, imgLoaded);
				
				if (complete && imageCount == 2)
				{
					//The load of all images is complete, so now it's safe to add things to the stack in the order we want.
					
					stack.addChild(text1);
					
					stack.addChild(img1);
					
					stack.addChild(text2);
					
					stack.addChild(rect);
					
					stack.addChild(img2);
					
					stack.addChild(text3);
					
					complete = false;
					stack.init();
				}
			}
			
			if (complete && imageCount == 2)
			{
				//If, somehow, the images load before everything else does, have a backup function to start the stack.
				trace("Secondary init called from stack example.");
				stack.init();
			}
		}
	
	}

}