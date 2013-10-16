package cml.components
{
	import com.gestureworks.cml.core.CMLObjectList;
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.cml.element.Album;
	import com.gestureworks.cml.element.Graphic;
	import com.gestureworks.cml.element.TouchContainer;
	import com.gestureworks.cml.element.Video;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.events.GWGestureEvent;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	/**
	 * This example demonstrates the CML AlbumViewer tag.
	 */
	public class AlbumViewerEx extends GestureWorks
	{
		private var players:Array;
		
		public function AlbumViewerEx():void
		{
			super();
			cml = "components/AlbumViewer.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
			
			var album:Album = CMLObjectList.instance.getId("front");
			album.addEventListener(StateEvent.CHANGE, pause);
			players = album.childList.getCSSClass("player").getValueArray();
			
			for each (var player:TouchContainer in players)
				player.addEventListener(GWGestureEvent.TAP, play);
			
			for each (var video:Video in album.searchChildren(Video, Array))
				video.addEventListener(StateEvent.CHANGE, reset);
		}
		
		private function play(e:GWGestureEvent):void
		{
			var video:Video = e.target.searchChildren(Video);
			var g:Graphic = e.target.searchChildren(Graphic);
			g.visible = false;
			video.resume();
		}
		
		private function pause(e:StateEvent):void
		{
			var video:Video;
			var g:Graphic;
			for each (var player:TouchContainer in players)
			{
				video = player.searchChildren(Video);
				g = player.searchChildren(Graphic);
				g.visible = true;
				video.pause();
			}
		}
		
		private function reset(e:StateEvent):void
		{
			if (e.property == "isPlaying" && !e.value)
			{
				var g:Graphic = e.target.parent.searchChildren(Graphic);
				g.visible = true;
			}
		}
	}
}