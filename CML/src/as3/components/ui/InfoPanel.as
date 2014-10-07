package as3.components.ui
{
	import com.gestureworks.cml.elements.Container;
	import com.gestureworks.cml.elements.Graphic;
	import com.gestureworks.cml.elements.Text;
	
	public class InfoPanel extends Container
	{		
		public var bkg:Graphic;
		public var bkgColor:uint = 0x665533;
		public var bkgAlpha:Number = 0.8;
		
		private var t:Text;
		private var _title:String;
		public var tFontColor:uint = 0xFFFFFF;
		public var tFontSize:Number = 30;
		
		private var d:Text;
		private var _descr:String;
		public var descrHTML:String;
		public var dFontColor:uint = 0xFFFFFF;
		public var dFontSize:Number = 20;
		
		public function InfoPanel() {
			visible = false;
			targetParent = true;			
		}
		
		override public function init():void {
			setupUI();
			super.init();
		}
		
		public function get title():String { return _title; }
		public function set title(value:String):void {
			_title = value; 
			if (t) {
				t.str = _title;
			}
		}
		
		public function get descr():String { return _descr; }
		public function set descr(value:String):void {
			_descr = value; 
			if (d) {
				d.str = _descr;
			}
		}
		
		private function setupUI():void {
			addBkg();
			addInfo();
		}
		
		private function addBkg():void {
			bkg = new Graphic();
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
				t = new Text();
				t.str = title;
				t.fontSize = tFontSize;
				t.color = tFontColor;
				t.font = "OpenSansBold";
				t.autosize = true;
				t.widthPercent = 100;
				info.addChild(t);				
			}
			
			if (descr || descrHTML) {
				d = new Text();
				d.fontSize = dFontSize;
				d.wordWrap = true;
				d.color = dFontColor;
				d.widthPercent = 100;
				d.autosize = true;
				d.multiline = true;
				if (descr) {
					d.str = descr;
				}
				else {
					d.htmlText = descrHTML;
				}
				info.addChild(d);				
			}
		}
		
	}

}