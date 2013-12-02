package other
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.elements.Button;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.cml.utils.document;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.events.GWTouchEvent;
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
		private var playState:int;
		private	var pauseState:int;
		private var recordState:int;
		
		public function TouchRecorder ():void {
			gml = "gml/gestures.gml";
			cml = "other/TouchRecorder.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		override protected function gestureworksInit():void {
			rec = new Recorder();
			addChild(rec);
			rec.listenToStage(stage);
		}
		
		public function cmlInit(e:Event):void {
			var button:Array = document.getElementsByTagName(Button);
			for each(var b:Button in button){
				b.addEventListener(StateEvent.CHANGE, buttonHandler);
			}
		}
		
		public function buttonHandler(e:StateEvent):void 
		{
			var recButton:Button = document.getElementById("record");
			var playButton:Button = document.getElementById("play");
			var pauseButton:Button = document.getElementById("pause");

			switch (e.id) 
			{
				
				case "record":
					rec.isRecording = e.value;
					if (e.value == 1)
					{
						playButton.reset();
						pauseButton.reset();
					}
				break;
				
				case "play":
						e.value ? rec.startReplaying() : rec.stopReplaying();
						rec.stopRecording();
						recButton.reset();
						pauseButton.reset();
						playState = e.value;
				break;
				
			case "pause":
					if (!rec.isRecording){
						rec.togglePause();
						pauseState = e.value;
					}
					else {
						pauseButton.reset();
					}
				break;
				
			case "clear":
				if(e.value == "blue"){
					if (rec.isRecording) {
						rec.stopRecording();
						recButton.dispatchEvent(new GWTouchEvent(null));
					}
					recButton.reset();
					playButton.reset();
					pauseButton.reset();
					rec.clearAll();
				}
				break;
			case "erase":
				if(e.value == "blue"){
					if (rec.isRecording) {
							rec.stopRecording();
							recButton.dispatchEvent(new GWTouchEvent(null));
						}
						recButton.reset();
						playButton.reset();
						pauseButton.reset();
						rec.clearCanvas();
				}
				break;
				
			case "load":
				if(e.value == "blue"){
					rec.loadFile();
					recButton.reset();
					playButton.reset();
					pauseButton.reset();
					rec.clearAll();
				}
				break;
				
			case "save":
				if(e.value == "blue"){
					rec.saveToFile();
					recButton.reset();
					playButton.reset();
					pauseButton.reset();
					rec.clearCanvas();
				}
				break;
			default:
				}
		}
	}
}
