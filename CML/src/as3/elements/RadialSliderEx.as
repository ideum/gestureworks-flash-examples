package as3.elements
{
	import com.gestureworks.cml.element.Graphic;
	import com.gestureworks.cml.element.RadialSlider;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.DisplayObject;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class RadialSliderEx extends GestureWorks 
	{
		
		public function RadialSliderEx():void 
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void 
		{
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("Radial Slider");
			exTemp.createDesc("<p>This tag creates a slider element. The slider can be used through touch and mouse input devices." +
							  "It also allows for the input value to be fed through a function call, allowing  the slider to be updated by another process.</p><br />" +
							  "<p>The slider can rotate clockwise or counter clockwise. It can act as a continuous slider or one that snaps to x-number of discrete steps.</p>");
							  
			var slider1:RadialSlider = createBasicSlider("Snapped Slider", 500.0, 0.0, 100.0, 50.0, 0.0, false);
			slider1.discrete = true;
			slider1.init();
			addChild(slider1);
			createText("Snapping Enabled Slider", 490.0, 200.0);
			
			var slider2:RadialSlider = createBasicSlider("Clockwise Slider", 800.0, 100.0, 200.0, 50.0, 270.0, true);
			slider2.init();
			addChild(slider2);
			createText("Clockwise Slider", 920.0, 500.0);
			
			createTimerSlider();
		}
		

		private function createTimerSlider():void
		{
			var slider:RadialSlider = createBasicSlider("Input Slider", 500.0, 400.0, 100.0, 50.0, 0.0, false);
			slider.init();
			addChild(slider);
			
			createText("Custom Input Slider", 500.0, 600.0);
			
			slider.addEventListener(StateEvent.CHANGE , onStateEvent);
			
			//event listener	
			function onStateEvent(event:StateEvent):void
			{
				trace(event.id, event.property, event.value);
			}
			
			//timer	for continous slider
			var timer:Timer = new Timer(10);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
			var cnt:Number = 0;
			
			//timer event set for horintal or vertical slider
			function onTimer(event:TimerEvent):void
			{	
				if (cnt <= 100.0)
				{
					slider.input(cnt);
					cnt += 0.5;
				}
			}
		}
		
		
		private function createBasicSlider(id:String, x:Number, y:Number, radius:Number, innerRadius:Number, startAngle:Number, clockwise:Boolean):RadialSlider
		{
			var slider:RadialSlider = new RadialSlider();
			slider.id = id;
			slider.x = x;
			slider.y = y;
			slider.min = 0;
			slider.max = 100;
			
			//rail(rectangle) graphics
			var railGraphic:Graphic = new Graphic();
			var railOffset:Number = radius * 0.1;
			railGraphic.shape = "circleSegment";
			railGraphic.x = railOffset;
			railGraphic.y = railOffset;
			railGraphic.radius = radius - railOffset;
			railGraphic.innerRadius = innerRadius + railOffset;
			railGraphic.startAngle = startAngle;
			railGraphic.angleLength = 0;
			railGraphic.lineStroke = 1;
			railGraphic.color = 0xFF2222;
			railGraphic.lineColor = 0xFF3333;
			railGraphic.alpha = 1;
			railGraphic.clockwise = clockwise;
			slider.addChild(railGraphic);
			slider.rail = DisplayObject(railGraphic);
			
			//hit graphics
			var hitGraphic:Graphic = new Graphic();
			hitGraphic.shape = "circleSegment";
			hitGraphic.x = 0;
			hitGraphic.y = 0;
			hitGraphic.radius = radius;
			hitGraphic.innerRadius = innerRadius;
			hitGraphic.lineStroke = 1;
			hitGraphic.startAngle = startAngle;
			hitGraphic.angleLength = 360;
			hitGraphic.color = 0x222222;
			hitGraphic.lineColor = 0x333333;
			hitGraphic.alpha = 0.75;
			slider.addChild(hitGraphic);
			slider.hit = DisplayObject(hitGraphic);
			
			//knob graphics
			var knobGraphic:Graphic = new Graphic();
			var knobScale = radius * 0.01;
			knobGraphic.shape = "circle";
			knobGraphic.x = 0;
			knobGraphic.y = 0;
			knobGraphic.radius = 18 * knobScale;
			knobGraphic.lineStroke = 2 * knobScale;
			knobGraphic.color = 0xDDDDDD;
			knobGraphic.lineColor = 0x666666;
			knobGraphic.alpha = 1;
			
			slider.knobRadius = 20 * knobScale;
			slider.addChild(knobGraphic);
			slider.knob = DisplayObject(knobGraphic);
			slider.startAngle = startAngle;
			slider.radius = radius;
			slider.innerRadius = innerRadius;
			slider.clockwise = clockwise;
			slider.centerX = radius;
			slider.centerY = radius;
	        
			return slider;
		}
		
		
		private function createText(value:String, x:Number, y:Number):void
		{
			var title:TextField = new TextField();
			
			title.text = value;
			title.embedFonts = true;
			
			var titleFmt:TextFormat = new TextFormat();
			titleFmt.font = "OpenSansBold";
			titleFmt.bold = true;
			titleFmt.size = 20;
			titleFmt.color = 0xffffff;
			
			title.setTextFormat(titleFmt);
			
			title.x = x;
			title.y = y;
			title.width = 400;
			title.selectable = false;
			
			addChild(title);
		}

	}
}