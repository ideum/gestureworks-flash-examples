package 
{
	import com.gestureworks.core.*;
	import flash.events.*;
	import starling.core.*;
	
	/**
	 * ...
	 * @author 
	 */
	[SWF(width="1920", height="1080", frameRate="60", backgroundColor="0x000000")]
	public class Main extends GestureWorks 
	{
		
		private var mStarling:Starling;
		
		public function Main():void 
		{
			init();
			gml = "my_gestures.gml";
		}
		
		private function init(e:Event = null):void 
		{
			Starling.multitouchEnabled = true;	
			mStarling = new Starling(Game, stage);// , null, null, Context3DRenderMode.SOFTWARE);
			mStarling.antiAliasing = 1;		
			mStarling.start();			
		}
		
		
	}
	
}