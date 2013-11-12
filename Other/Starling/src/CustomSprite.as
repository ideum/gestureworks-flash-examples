package
{

	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;

	public class CustomSprite extends Sprite
	{
		private var quad:Quad;
		private var legend:TextField;

		starling.display.Quad;
		starling.display.Sprite;
		starling.events.Event;
		starling.text.TextField;

		private var quadWidth:uint;
		private var quadHeight:uint;

		private var r:Number = 0;
		private var g:Number = 0;
		private var b:Number = 0;

		private var rDest:Number;
		private var gDest:Number;
		private var bDest:Number;

		public function CustomSprite(width:Number, height:Number, color:uint=16777215)
		{

			// reset the destination color component
			resetColors();

			// set the width and height
			quadWidth = width;
			quadHeight = height;

			// when added to stage, activate it
			addEventListener(Event.ADDED_TO_STAGE, activate);

		}

		private function activate(e:Event):void
		{
			// create a quad of the specified width
			quad = new Quad(quadWidth, quadHeight);

			// add the legend
			legend = new TextField(100, 20, "Hello Starling!", "Arial", 14, 0xFFFFFF);

			// add the children
			addChild(quad);
			addChild(legend);

			// change the registration point
			pivotX = width >> 1;
			pivotY = height >> 1;
		}

		private function resetColors():void
		{
			// pick random color components
			rDest = Math.random()*255;
			gDest = Math.random()*255;
			bDest = Math.random()*255;
		}

		/**
		* Updates the internal behavior
		*
		*/

		public function update ():void
		{
			// easing on the components
			r -= (r - rDest) * .01;
			g -= (g - gDest) * .01;
			b -= (b - bDest) * .01;

			// assemble the color
			var color:uint = r << 16 | g << 8 | b;
			quad.color = color;

			// when reaching the color, pick another one
			if ( Math.abs( r - rDest) < 1 && Math.abs( g - gDest) < 1 && Math.abs( b- bDest) )
				resetColors();

			// rotate it!
			//rotation += .01;

		}

	}

}