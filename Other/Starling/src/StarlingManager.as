package  
{
	import com.gestureworks.core.*;
	import com.gestureworks.events.*;
	import com.gestureworks.managers.*;
	import flash.events.*;
	import starling.display.*;
	import starling.events.*;
	
	public class StarlingManager
	{		
		public static function init(starlingStage:starling.display.Stage):void
		{			
			starlingStage.addEventListener(starling.events.TouchEvent.TOUCH, onTouch);
		}
		
		private static function onTouch(e:starling.events.TouchEvent):void
		{
			for each (var touch:Touch in e.touches) {
				switch (touch.phase) {
					case TouchPhase.BEGAN :
						for each (var ts:TouchSprite in TouchManager.touchObjects) {
							if (touch.isTouching(starling.display.DisplayObject(ts.vto))) {
								var event:GWTouchEvent = new GWTouchEvent(null, GWTouchEvent.TOUCH_BEGIN, true, false, touch.id, false);
								event.stageX = touch.globalX;
								event.stageY = touch.globalY;
								event.target = ts.vto;
								TouchManager.onTouchDown(event);
							}							
						}
					break;					
					case TouchPhase.MOVED :
							var event:GWTouchEvent = new GWTouchEvent(null, GWTouchEvent.TOUCH_MOVE, true, false, touch.id, false);
							event.stageX = touch.globalX;
							event.stageY = touch.globalY;
							TouchManager.onTouchMove(event);
					break;
					case TouchPhase.ENDED :
						var event:GWTouchEvent = new GWTouchEvent(null, GWTouchEvent.TOUCH_END, true, false, touch.id, false);
						event.stageX = touch.globalX;
						event.stageY = touch.globalY
						TouchManager.onTouchUp(event);						
					break;	
				}
			}	
		}	
		
	}
}