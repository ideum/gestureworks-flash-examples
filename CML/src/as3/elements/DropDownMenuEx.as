package as3.elements 
{
	import com.gestureworks.cml.element.DropDownMenu;
	import com.gestureworks.cml.element.Image;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class DropDownMenuEx extends GestureWorks 
	{
		private var imagesArray:Array;
		
		public function DropDownMenuEx():void 
		{
			gml = "gml/gestures.gml";			
		}
		
		override protected function gestureworksInit():void 
		{
			// entry point			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("DropDownMenu");
			exTemp.createDesc("<p>This tag is used to create a simple drop-down menu from a text string of items. It requires a menuTitle, and menuItems, which will be a comma separated list of items to populate the menu.</p><br /><p>Width and height are automatically set based on font size. To use the menu, you can listen for StateEvents and then extract the string of the menu item that called it from the event's value.</p><br /><p>A menuMarker attribute can be set to \"true\" or \"false\", this setting determines whether or not an arrow appears next to the title menu item to indicate that this does, in fact, function as a menu.</p>");
			
			var ddMenu:DropDownMenu = new DropDownMenu();
			ddMenu.x = 500;
			ddMenu.y = 150;
			ddMenu.fill = 0xf2d4c2;
			ddMenu.color = 0xA66874;
			ddMenu.fontSize = 36;
			ddMenu.menuTitle = "Images";
			ddMenu.menuItems = "Image1,Image2,Image3,Image4,Image5";
			addChild(ddMenu);
			
			ddMenu.init();
			
			imagesArray = new Array();
			openImages();
			
			// This is the event listener for when a menu item has been selected.
			ddMenu.addEventListener(StateEvent.CHANGE, onItemSelected);
		}
		
		private function onItemSelected(e:StateEvent):void {
			trace("OnItemSelected");
			//When an item is selected in the dropdownmenu, the value the event puts out is the item's string.
			//The images in the following method have id's set the same as their corresponding menu items.
			//This will just loop through to find the id matching the event value, then set that item visible, 
			//and everything else invisible.
			if (e.property == "itemSelected"){
				for (var i:Number = 0; i < imagesArray.length; i++) {
					if (imagesArray[i].id == e.value)
						imagesArray[i].visible = true;
					else
						imagesArray[i].visible = false;
				}
			}
		}
		
		private function openImages():void {
			
			var image1:Image = new Image();
			image1.id = "Image1";
			image1.open("assets/images/500px-Bi-crystal.jpg");
			image1.height = 500;
			image1.x = 700;
			image1.y = 150;
			image1.visible = false;
			addChild(image1);
			image1.init();			
			imagesArray[0] = image1;
			
			var image2:Image = new Image();
			image2.id = "Image2";
			image2.open("assets/images/500px-Silver_crystal.jpg");
			image2.x = 700;
			image2.y = 150;
			image2.visible = false;
			addChild(image2);
			image2.init();			
			imagesArray[1] = image2;
			
			var image3:Image = new Image();
			image3.id = "Image3";
			image3.open("assets/images/bee.jpg");
			image3.x = 700;
			image3.y = 150;
			image3.scale = .5;
			image3.visible = false;
			addChild(image3);
			image3.init();		
			imagesArray[2] = image3;
			
			var image4:Image = new Image();
			image4.id = "Image4";
			image4.open("assets/images/clockwork.png");
			image4.height = 500;
			image4.x = 700;
			image4.y = 150;
			image4.visible = false;
			addChild(image4);
			image4.init();
			imagesArray[3] = image4;
			
			var image5:Image = new Image();
			image5.id = "Image5";
			image5.open("assets/images/orchid.jpg");
			image5.x = 700;
			image5.y = 150;
			image5.visible = false;
			addChild(image5);
			image5.init();
			imagesArray[4] = image5;
		}
		
	}
	
}