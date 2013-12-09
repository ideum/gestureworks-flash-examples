package cml.elements
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.elements.ScrollPane;
	import com.gestureworks.cml.elements.Text;
	import com.gestureworks.cml.utils.document;
	import com.gestureworks.core.GestureWorks;
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the ScrollPane tag.
	 */
	public class ScrollPaneEx extends GestureWorks
	{
		public function ScrollPaneEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "elements/ScrollPane.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
			
			var sp:ScrollPane = document.getElementById("sp");
			
			
			// we'll replace the scroll pane's content with a textfield on any keyboard event
			
			var txt:Text = new Text;
			txt.str = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
			txt.color = "0xFFFFFF";
			txt.fontSize = 40;
			txt.multiline = true;
			txt.wordWrap = true;
			txt.width = 500;
			txt.autosize = true;
			txt.init();
			
			// store the original content for later
			var original:DisplayObject = sp.content;

			
			// add a keyboard event listener to dynamically switch content
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKey);
						
			// keyboard event handler
			function onKey(e:KeyboardEvent):void {
			
				if (sp.content == original) {				
					sp.updateContent(txt);
				}
				else {
					sp.updateContent(original);
				}
			}	
			
		}
	}
}