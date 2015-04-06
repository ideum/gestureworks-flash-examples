package as3.elements
{
	import com.gestureworks.cml.elements.Carousel;
	import com.gestureworks.cml.elements.Graphic;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.DisplayObject;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class CarouselEx extends GestureWorks
	{
		public function CarouselEx():void
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			// entry point
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("Carousel");
			exTemp.createDesc("<p>The Carousel provides a circular list of display objects that can be scrolled circularly or horizontally.<br/><br/>Top right: standard carousel with circular scroll.<br/><br/>Bottom right: fancy carousel with linear scroll and added scaling and rotation effects.<br/><br/>Bottom left: carousel with a rotation offset and a rotation type set to ROTATE_OUTWARD.</p>");
			
			addChild(standardCarousel());
			addChild(cornerCarousel());
			addChild(fancyCarousel());
		}
		
		/**
		 * Returns a box graphic
		 * @return
		 */
		private function box(width:int, height:int):Graphic {
			var g:Graphic = new Graphic();
			g.graphics.beginFill(0, 0.25);
			g.graphics.drawRect( -width / 2, -height / 2, width, height);
			g.graphics.beginFill(0xffffff * Math.random(), 1);
			g.graphics.drawRect( -width / 2 + 4, -height / 2 + 4, width - 8, height - 8);
			g.graphics.beginFill(0xffffff, 1);
			g.graphics.drawRect( -width / 2 + 8, -height / 2 + 8, width - 16, 8);
			return g;
		}
		
		/**
		 * Returns a carousel suited for the corner of a display
		 * @return
		 */
		private function cornerCarousel():Carousel
		{
			var c_carousel:Carousel = new Carousel();
			c_carousel.x = -300;
			c_carousel.y = 420;
			c_carousel.width  = 600;
			c_carousel.height = 600;
			c_carousel.rotationOffset = -3 * Math.PI / 4;
			c_carousel.rotationType = Carousel.ROTATE_OUTWARD;
			for (var i:int = 0; i < 20; ++i)
			{
				c_carousel.addChild(box(200, 200));
			}
			c_carousel.init();
			c_carousel.clone();
			c_carousel.clone();
			c_carousel.clone();
			return c_carousel;
		}
		
		/**
		 * Returns a standard carousel
		 * @return
		 */
		private function standardCarousel():Carousel
		{
			var s_carousel:Carousel = new Carousel();
			s_carousel.x = 700;
			s_carousel.y = 150;
			s_carousel.width  = 400;
			s_carousel.height = 100;
			for (var i:int = 0; i < 20; ++i)
			{
				s_carousel.addChild(box(100, 100));
			}
			s_carousel.init();
			return s_carousel;
		}
		
		/**
		 * Returns a fancy carousel
		 * @return
		 */
		private function fancyCarousel():Carousel
		{
			var f_carousel:Carousel = new Carousel();
			f_carousel.x = 700;
			f_carousel.y = 450;
			f_carousel.width  = 400;
			f_carousel.height = 50;
			f_carousel.dragType = Carousel.LINEAR_DRAG;
			f_carousel.onUpdate = function(child:DisplayObject, theta:Number):void
			{
				child.scaleX = child.scaleY = child.scaleZ = Math.pow(Math.sin(theta) * 0.25 + 0.75, 5);
				child.rotation = (Math.cos(theta) * 0.5 + 0.5) * 180 - 90;
			}
			for (var i:int = 0; i < 20; ++i)
			{
				f_carousel.addChild(box(200, 200));
			}
			f_carousel.init();
			return f_carousel;
		}
	}
}