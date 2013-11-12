package 
{
	import com.worlize.websocket.*;
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	/**
	 * SAPI STT Examples
	 * Loads TTS and SST through the Microsoft API
	 *  1. Start sapi_websocket.exe
	 *  2. Compile AS3 application
	 *  3. Press any key to trigger text to speech
	 */
	public class TextToSpeech extends Sprite {
		private var websocket:WebSocket;		
		private var timer:Timer;
		private var mSwap:Boolean = false;
			
		public function TextToSpeech():void {
			
			stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE
			
			// setup websocket
			websocket = new WebSocket("ws://localhost:81", "*");
			websocket.debug = true;
			websocket.addEventListener(WebSocketEvent.CLOSED, handleWebSocketClosed);
			websocket.addEventListener(WebSocketEvent.OPEN, handleWebSocketOpen);
			websocket.addEventListener(WebSocketEvent.MESSAGE, handleWebSocketMessage);
			websocket.addEventListener(IOErrorEvent.IO_ERROR, handleIOError); 
			websocket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, handleSecurityError);
			websocket.addEventListener(WebSocketErrorEvent.CONNECTION_FAIL, handleConnectionFail);	
			
			// auto-connect timer
			timer = new Timer(500);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
		}
		
		// on timer, try to connect
		private function onTimer(e:TimerEvent):void {
			websocket.connect();
		}
		
		// press key to send test message
		private function handleWebSocketOpen(event:WebSocketEvent):void {
			trace(event);
			timer.stop();
			timer.removeEventListener(TimerEvent.TIMER, onTimer);					
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onDown);			
		}		
		
		// keyboard event handler
		private function onDown(e:KeyboardEvent):void {
			// normal string
			var str:String = "The emerald-eyed tree frog, Hypsiboas crepitans, is a species of frog in the Hylidae family found in Brazil, Colombia, French Guiana, Guyana, Panama, Suriname, Trinidad and Tobago, and Venezuela. Its natural habitats are subtropical or tropical dry forests, subtropical or tropical moist lowland forests, dry savanna, moist savanna, rivers, intermittent rivers, freshwater lakes, intermittent freshwater lakes, freshwater marshes, intermittent freshwater marshes, freshwater springs, inland deltas, arable land, pastureland, plantations, rural gardens, urban areas, heavily degraded former forests, water storage areas, ponds, aquaculture ponds, irrigated land, and seasonally flooded agricultural land.";
			
			// SSML string
			var ssml:String = "<speak version=\"1.0\"";
            ssml += " xmlns=\"http://www.w3.org/2001/10/synthesis\"";
            ssml += " xml:lang=\"en-US\">";
            ssml += "<say-as type=\"date:mdy\"> 1/29/2009 </say-as>";
            ssml += "</speak>";
									
			if (mSwap) {
				websocket.sendUTF(str);	
			}
			else {
				websocket.sendUTF(ssml);	
			}
			
			mSwap = !mSwap;			
		}		
		
		// socket io error handler
		private function handleIOError(event:IOErrorEvent):void {
			trace(event);
		}
		
		// socket security error handler
		
		private function handleSecurityError(event:SecurityErrorEvent):void {
			trace(event);
		}
		
		// socket handle fail error handler
		private function handleConnectionFail(event:WebSocketErrorEvent):void {
			trace(event);
		}
		
		// socket closed handler
		private function handleWebSocketClosed(event:WebSocketEvent):void {
			trace(event);
			
			// restart auto-connect timer
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();			
		}
		
		// socket message handler
		private function handleWebSocketMessage(event:WebSocketEvent):void {
			trace(event);
			if (event.message.type === WebSocketMessage.TYPE_UTF8) {
				trace("Got message: " + event.message.utf8Data);
			}
			else if (event.message.type === WebSocketMessage.TYPE_BINARY) {
				trace("Got binary message of length " + event.message.binaryData.length);
			}			
		}		
		
	}
}