package as3.elements
{
	import com.gestureworks.cml.element.ColorPicker;
	import com.gestureworks.cml.element.Graphic;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.geom.ColorTransform;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class ColorPickerEx extends GestureWorks
	{
		private var bkg:Graphic;
		
		public function ColorPickerEx():void
		{
			addEventListener(StateEvent.CHANGE, changeBkg);
		}
		
		override protected function gestureworksInit():void
		{
			// entry point
			
			//add color changing background
			bkg = new Graphic();
			bkg.shape = "rectangle";
			bkg.width = stage.width;
			bkg.height = stage.height;
			bkg.color = 0x000000;
			addChild(bkg);
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("ColorPicker");
			exTemp.createDesc("<p>The ColorPicker element provides color selection capability by moving provided indicators or adjusting color properties to select hue and color variants.<br /><br />" + "This example will demonstrate how to change the selected color by dragging the color grid and hue bar indicators or manually entering values in the text fields.</p>" + "<br /><p>See also:<br />DatePicker<br /></p>");
			
			//create the color picker
			var colorPicker:ColorPicker = new ColorPicker();
			colorPicker.x = 625;
			colorPicker.y = 175;
			colorPicker.init();
			addChild(colorPicker);
		}
		
		/**
		 * Handle the color change state evetn by setting the background to the selected color
		 * @param	e
		 */
		private function changeBkg(e:StateEvent):void
		{
			if (bkg)
			{
				var ct:ColorTransform = new ColorTransform();
				ct.color = e.value;
				bkg.transform.colorTransform = ct;
			}
		}
	}

}