package cml.elements
{
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.elements.DropDownMenu;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;

	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]

	/**
	 * This example demonstrates the DropDownMenu tag.
	 */
	public class DropDownMenuEx extends GestureWorks
	{
		private var imagesArray:Array;
		public function DropDownMenuEx():void 
		{
			super();
			gml = "gml/gestures.gml";
			cml = "elements/DropDownMenu.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
	
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);			
			trace("cmlInit()");
			
			var menu:DropDownMenu = CMLObjectList.instance.getId("ddMenu");
			
			imagesArray = new Array();
			
			imagesArray[0] = CMLObjectList.instance.getId("Image1");
			imagesArray[1] = CMLObjectList.instance.getId("Image2");
			imagesArray[2] = CMLObjectList.instance.getId("Image3");
			imagesArray[3] = CMLObjectList.instance.getId("Image4");
			imagesArray[4] = CMLObjectList.instance.getId("Image5");
			
			function onItemSelected(e:StateEvent):void {
				// When an item is selected in the dropdownmenu, the value the event puts out is the item's string.
				// The images in the CML have id's set the same as their corresponding menu items.
				// This will just loop through to find the id matching the event value, then set that item visible, 
				// and everything else invisible.
				if (e.property == "itemSelected"){
					for (var i:Number = 0; i < imagesArray.length; i++) {
						if (imagesArray[i].id == e.value)
							imagesArray[i].visible = true;
						else
							imagesArray[i].visible = false;
					}
				}
			}
			
			menu.addEventListener(StateEvent.CHANGE, onItemSelected);	
		}
	}
}