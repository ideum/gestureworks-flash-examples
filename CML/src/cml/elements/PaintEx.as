package cml.elements
{
	import com.gestureworks.cml.elements.Paint;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.core.CMLParser;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
		
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class PaintEx extends GestureWorks
    {
        public function PaintEx():void
        {
            super();
			gml = "gml/gestures.gml";
			cml = "elements/Paint.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
        }
		
		private function cmlInit(event:Event):void
		{
			removeEventListener(CMLParser.COMPLETE, cmlInit);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, doAction);
		}	
		
		//these are just tests
		private function doAction(k:KeyboardEvent):void {
			var y:Paint = CMLObjectList.instance.getId("painter");
			trace(k.charCode);
			switch(k.charCode) {
				//Change color, 1-4
				case 49:
					y.color = 0xFF0000;
					break;
				case 50:
					y.color = 0x00FF00;
					break;
				case 51:
					y.color = 0x0000FF;
					break;
				case 52:
					y.color = 0x000000;
					break;
				//change brush size [ or ] 
				case 91:
					y.brushSize = y.brushSize-1;
					break;
				case 93:
					y.brushSize = y.brushSize+1;
					break;
				// Reset canvas with `
				case 96:
					y.resetImage();
					break;
				case 101: //e
					y.toggleEraser();
					break;
				case 69: // E
					y.exportPNG();
					break;
				case 83: // S
					y.exportSVG();
					break; 
				case 105: // i
					y.importSVG();
					break; 
				default:
					break;
			}
		}
    }
}