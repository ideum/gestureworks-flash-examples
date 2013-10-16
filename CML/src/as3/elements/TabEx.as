package as3.elements
{
	import com.gestureworks.cml.element.Image;
	import com.gestureworks.cml.element.Tab;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class TabEx extends GestureWorks
	{
		public function TabEx():void
		{
		
		}
		
		override protected function gestureworksInit():void
		{
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("Tab");
			exTemp.createDesc("<p>The Tab is a container with a tab extension. The container's contents will be visible when the selected state is true and hidden othewise. Intended to be grouped and toggled between other Tab objects in a TabbedContainer.<br /><br />" + "This example displays a tab element and its contents.</p>" + "<br/ ><p>See also:<br />TabbedContainer<br /></p>");
			
			//create tab element
			var tab:Tab = new Tab();
			tab.title = "bee";
			tab.displayColor = 0x680000;
			tab.tabFontColor = 0xFFFF66;
			tab.x = 600;
			tab.y = 100;
			tab.tabHeight = 50;
			tab.tabWidth = 150;
			
			//tab content
			var image:Image = new Image();
			image.open("assets/images/bee.jpg");
			image.x = 75;
			image.y = 120;
			tab.addChild(image);
			
			//add tab element to stage
			tab.init();
			addChild(tab);
		}
	}

}