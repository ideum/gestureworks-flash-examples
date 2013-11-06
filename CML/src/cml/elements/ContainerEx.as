package cml.elements
{
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.elements.Container;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the use of the Container class within CML.
	 */
	public class ContainerEx extends GestureWorks
	{
		public function ContainerEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "elements/Container.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
			
			// you can grab any object created in CML using the CMLObjectList
			// right now, we're searching for the matching ids we put in the CML.
			var redCircles:Container = CMLObjectList.instance.getId("red-circles");
			var images:Container = CMLObjectList.instance.getId("images");
			
			// also check out the DOM selectors:
			// document.getElementById()
			// etc..
			
			trace("redCircles");
			// you can loop through the cml list of children of any CML container using the childlist:
			for (var i:int = 0; i < redCircles.childList.length; i++)
			{
				trace(redCircles.childList[i].id);
					//You could do logic on the object here by simply using redCircles.childList.getIndex(i)
					//and setting a property, like ".visible = false;"
			}
			// try switching out "redCircles" for "images" and see what happens.
			// it's possible and easy to access any and all of your children in a container this way,
			// without having to set any extra variables.
		}
	
	}
}