package as3.elements
{
	import com.gestureworks.cml.elements.Graphic;
	import com.gestureworks.cml.elements.Slider;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.DisplayObject;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class SliderEx extends GestureWorks
	{
		public function SliderEx():void
		{
			gml = "gml/gestures.gml";		
		}
		
		override protected function gestureworksInit():void
		{			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("Slider");
			exTemp.createDesc("<p>The slider can be used through touch and mouse input devices. It also allows for the input value to be fed through a function call, allowing the slider to updated by another process. The slider can be orientation horizontally or vertically and can act as a continuous slider or one that snaps to x-number of discrete steps.</p>");
			
			var slider:Slider = new Slider();
			slider.x = 700;
			slider.y = 100;
			
			// slider graphics- can change the position of slider through orientation
			slider.orientation = "vertical";
			slider.releaseInertia = true;
			slider.min = 0;
			slider.max = 100;
			
			//rail(rectangle) graphics
			var railGraphic:Graphic = new Graphic();
			railGraphic.shape = "rectangle";
			railGraphic.x = 0;
			railGraphic.y = 0;
			railGraphic.width = 20;
			railGraphic.height = 500;
			railGraphic.lineStroke = 1;
			railGraphic.color = 0x222222;
			railGraphic.lineColor = 0x333333;
			railGraphic.alpha = 1;
			slider.addChild(railGraphic);
			slider.rail = DisplayObject(railGraphic);
			
			//hit graphics
			var hitGraphic:Graphic = new Graphic();
			hitGraphic.shape = "rectangle";
			hitGraphic.x = 0;
			hitGraphic.y = 0;
			hitGraphic.width = 20;
			hitGraphic.height = 500;
			hitGraphic.lineStroke = 1;
			hitGraphic.color = 0x222222;
			hitGraphic.lineColor = 0x333333;
			hitGraphic.alpha = 1;
			slider.addChild(hitGraphic);
			slider.hit = DisplayObject(hitGraphic);
			
			//knob graphics
			var knobGraphic:Graphic = new Graphic();
			knobGraphic.shape = "circle";
			knobGraphic.x = -15;
			knobGraphic.y = 0;
			knobGraphic.radius = 25;
			knobGraphic.lineStroke = 2;
			knobGraphic.color = 0xDDDDDD;
			knobGraphic.lineColor = 0x666666;
			knobGraphic.alpha = 1;
			slider.addChild(knobGraphic);
			slider.knob = DisplayObject(knobGraphic);
			
			slider.init();
			addChild(slider);
			
			var slider1:Slider = new Slider();
			slider1.x = 800;
			slider1.y = 100;
			slider1.mouseEnabled = false;
			slider1.discrete = true;
			slider1.orientation = "vertical";
			slider1.gestureReleaseInertia = false;
			slider1.min = 0;
			slider1.max = 100;
			
			var railGraphic1:Graphic = new Graphic();
			railGraphic1.shape = "rectangle";
			railGraphic1.x = 0;
			railGraphic1.y = 0;
			railGraphic1.width = 20;
			railGraphic1.height = 500;
			railGraphic1.lineStroke = 1;
			railGraphic1.color = 0x222222;
			railGraphic1.lineColor = 0x333333;
			railGraphic1.alpha = 1;
			slider1.addChild(railGraphic1);
			slider1.rail = DisplayObject(railGraphic1);
			
			var hitGraphic1:Graphic = new Graphic();
			hitGraphic1.shape = "rectangle";
			hitGraphic1.x = -40;
			hitGraphic1.y = 0;
			hitGraphic1.width = 100;
			hitGraphic1.height = 500;
			hitGraphic1.lineStroke = 1;
			hitGraphic1.color = 0x222222;
			hitGraphic1.lineColor = 0x333333;
			hitGraphic1.alpha = 0;
			slider1.addChild(hitGraphic1);
			slider1.hit = DisplayObject(hitGraphic1);
			
			var knobGraphic1:Graphic = new Graphic();
			knobGraphic1.shape = "circle";
			knobGraphic1.x = -15;
			knobGraphic1.y = 0;
			knobGraphic1.radius = 25;
			knobGraphic1.lineStroke = 2;
			knobGraphic1.color = 0xDDDDDD;
			knobGraphic1.lineColor = 0x666666;
			knobGraphic1.alpha = 1;
			slider1.addChild(knobGraphic1);
			slider1.knob = DisplayObject(knobGraphic1);
			
			slider1.init();
			addChild(slider1);
			
			//state event can be added to horizontal slider or vertical slider
			slider.addEventListener(StateEvent.CHANGE, onStateEvent);
			
			//event listener	
			function onStateEvent(event:StateEvent):void
			{
			//	trace(event.id, event.property, event.value);
			}
			
			//timer	for continous slider
			var timer:Timer = new Timer(10);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
			var cnt:Number = 0;
			
			//timer event set for horintal or vertical slider
			function onTimer(event:TimerEvent):void
			{
				slider1.input(cnt);
				cnt += .1;
			}
		
		}
	
	}
}