package recorder
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.managers.TouchManager;
	import com.gestureworks.utils.FrameRate;
	import com.gestureworks.utils.Recorder;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Tristan
	 */
	
	/**
  		space, anim replay
				
		'e' stop replaying
				
		'l' load
				
		's' save
			
		'c' clear
			
		'p' pause 
		
		'x' stop recording
	 */
	
	[SWF(backgroundColor = "0x000000", frameRate = "30")]
	 
	 
	public class TouchRecorder extends GestureWorks
	{
		public static var rec:Recorder;

		
		public function TouchRecorder ():void {
			gml = "gml/drag.gml";
		}
		
		override protected function gestureworksInit():void {
			rec = new Recorder();
			addChild(rec);
			rec.listenToStage(stage);
		}
	}
}
