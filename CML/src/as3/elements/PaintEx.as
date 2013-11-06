package as3.elements
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.elements.Paint;
	import com.gestureworks.core.GestureWorks;
	import flash.events.KeyboardEvent;
		
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class PaintEx extends GestureWorks
    {		
        public function PaintEx():void
        {
            super();
			gml = "gml/gestures.gml";
        }
		
		override protected function gestureworksInit():void
		{				
			var paint:Paint = new Paint(500, 500, 0xFFFFFF, 1);
			paint.x = 650;
			paint.y = 700;
			paint.init();
			stage.addEventListener(KeyboardEvent.KEY_DOWN, doAction);
			
			function doAction(k:KeyboardEvent):void {
				var y:Paint = paint;
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
}