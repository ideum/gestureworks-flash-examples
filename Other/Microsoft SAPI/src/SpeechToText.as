package 
{
	import com.worlize.websocket.*;
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	/**
	 * SAPI STT Examples
	 */
	public class SpeechToText extends Sprite {
		private var websocket:WebSocket;		
		private var timer:Timer;
		private var mSwap:Boolean = false;
			
		public function SpeechToText():void {
			
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