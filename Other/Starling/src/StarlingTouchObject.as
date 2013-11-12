package  
{
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWTouchEvent;
	import com.gestureworks.events.GWTransformEvent;
	import starling.events.TouchEvent;
	import flash.events.Event;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	
	public class StarlingTouchObject extends TouchSprite
	{		
		public function StarlingTouchObject(target:*) 
		{
			super(target);
			vto = target;
			transform.matrix = target.transformationMatrix;	
		}
		
		override public function updateVTO():void
		{
			vto.transformationMatrix = transform.matrix;

		}
		
	}

}