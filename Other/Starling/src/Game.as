package  
{
	import com.gestureworks.core.GestureWorks;
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import fr.kouma.starling.utils.Stats;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author 
	 */
	public class Game extends Sprite
	{		
		public function Game() 
		{
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function onAdded(e:Event):void
		{	
			loadBitmap();
		}
		
		private var loader:Loader = new Loader();
		private function loadBitmap():void 
		{
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			loader.load(new URLRequest("gw_logo.png")); 
		}
		
		private function onComplete(e:*):void 
		{			
			StarlingManager.init(stage);	
			
			createTouchImage();
			createTouchImage();
			
			addChild(new Stats());		
		}
		
		private function createTouchImage():void 
		{
			var buffer:BitmapData = Bitmap(loader.content).bitmapData; 

			var texture:Texture = Texture.fromBitmapData(buffer);
			var image:Image = new Image(texture);
			image.touchable = true;
			addChild(image);
						
			var st:StarlingTouchObject = new StarlingTouchObject(image);

			st.gestureList = { "n-drag":true, "n-rotate":true, "n-scale":true };
			st.nativeTransform = true;	
			st.releaseInertia = false;
		}
		
		
	}

}