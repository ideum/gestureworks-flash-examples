package cml.elements
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	import flash.text.Font;
	
	[SWF(width="1280",height="720",backgroundColor="0xFFFFFF",frameRate="30")]
	
	/**
	 * This example demonstrates the TLF tag.
	 */
	public class TLFEx extends GestureWorks
	{
		public function TLFEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "elements/TLF.cml"	
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
		}
		
		[Embed(source = "../../../bin/assets/fonts/Locator-Regular.otf",
			fontName = 'LocatorTLF',
			fontStyle = 'true',
			mimeType = 'application/x-font-truetype',
			advancedAntiAliasing = 'true',
			embedAsCFF = 'true')]
        public static var LocatorRegular:Class;
        Font.registerFont(LocatorRegular);

		[Embed(source = "../../../bin/assets/fonts/Locator-RegularItalic.otf",
			fontName = 'LocatorTLF',
			fontStyle = 'italic',
			mimeType = 'application/x-font-truetype',
			advancedAntiAliasing = 'true',
			embedAsCFF = 'true')]
        public static var LocatorItalic:Class;
        Font.registerFont(LocatorItalic);		
		
		[Embed(source = "../../../bin/assets/fonts/Locator-Medium.otf",
			fontName = 'LocatorTLF',
			fontWeight = 'bold',
			mimeType = 'application/x-font-truetype',
			advancedAntiAliasing = 'true',
			embedAsCFF = 'true')]			
        public static var LocatorBold:Class;
        Font.registerFont(LocatorBold);			
	}
}