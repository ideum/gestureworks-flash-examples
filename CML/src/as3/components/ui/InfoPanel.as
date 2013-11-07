package as3.components.ui
{
	import com.gestureworks.cml.elements.Container;
	import com.gestureworks.cml.elements.Graphic;
	import com.gestureworks.cml.elements.Text;
	
	public class InfoPanel extends Container
	{		
		public var bkgColor:uint = 0x5F68ED;
		public var bkgAlpha:Number = 0.8;
		
		public var title:String;
		public var tFontColor:uint = 0xFFFFFF;
		public var tFontSize:Number = 30;
		
		public var descr:String;
		public var dFontColor:uint = 0xFFFFFF;
		public var dFontSize:Number = 20;		
		
		override public function init():void {
			visible = false;
			targetParent = true;
			setupUI();
			super.init();
		}
		
		private function setupUI():void {
			addBkg();
			addInfo();
		}
		
		private function addBkg():void {
			var bkg:Graphic = new Graphic();
			bkg.color = bkgColor;
			bkg.alpha = bkgAlpha;
			bkg.shape = "rectangle";
			bkg.widthPercent = 100;
			bkg.heightPercent = 100;
			addChild(bkg);			
		}
		
		private function addInfo():void {
			var info:Container = new Container();
			info.paddingTop = 30;
			info.paddingLeft = 30;
			info.paddingRight = 30;
			info.widthPercent = 100;
			info.heightPercent = 100;
			info.relativeY = true;
			addChild(info);			
			
			if (title) {
				var t:Text = new Text();
				t.str = title;
				t.fontSize = tFontSize;
				t.color = tFontColor;
				t.font = "OpenSansBold";
				t.autosize = true;
				t.widthPercent = 100;
				info.addChild(t);				
			}
			
			if (descr) {
				var d:Text = new Text();
				d.fontSize = dFontSize;
				d.wordWrap = true;
				d.color = dFontColor;
				d.widthPercent = 100;
				d.autosize = true;
				d.multiline = true;
				d.str = descr;
				info.addChild(d);				
			}
		}
		
	}

}