package as3.components.ui
{
	import com.gestureworks.cml.elements.Button;
	import com.gestureworks.cml.elements.Container;
	import com.gestureworks.cml.elements.Graphic;
	import com.gestureworks.cml.elements.Text;
	import flash.display.Sprite;
	
	public class MenuButton extends Button
	{							
		private var btnUpBg:Graphic;
		private var btnDownBg:Graphic
		
		public var lineStroke:Number;
		public var lineColor:uint;
		public var color:uint;
		
		public function MenuButton(type:String, offX:Number, offY:Number, btnClass:Class) {
			var btnUp:Container = new Container();
			
			btnUpBg = new Graphic();
			btnUpBg.shape = "circle";
			btnUpBg.alpha = 1;
			btnUpBg.radius = 20;
			btnUpBg.lineStroke = 1.5;		
			btnUp.addChild(btnUpBg);
			
			var btnUpIcon:Sprite = new btnClass();
			btnUpIcon.alpha = 1;
			btnUpIcon.x = offX;
			btnUpIcon.y = offY;
			btnUpIcon.scaleX = 1.6;
			btnUpIcon.scaleY = 1.6;			
			btnUp.addChild(btnUpIcon);
			
			var btnDown:Container = new Container();
			
			btnDownBg = new Graphic();
			btnDownBg.shape = "circle";
			btnDownBg.alpha = 1;
			btnDownBg.radius = 20;
			btnDownBg.lineStroke = 1.5;		
			btnDown.addChild(btnDownBg);
			
			var btnDownIcon:Sprite = new btnClass();
			btnDownIcon.alpha = 1;
			btnDownIcon.x = offX;
			btnDownIcon.y = offY;
			btnDownIcon.scaleX = 1.6;
			btnDownIcon.scaleY = 1.6;		
			btnDown.addChild(btnDownIcon);
			
			var btnHit:Container = new Container();
			
			var hitShp:Graphic = new Graphic();
			hitShp.shape = "circle";
			hitShp.alpha = 0;
			hitShp.radius = 20;
			hitShp.lineStroke = 1.5;
			hitShp.color = 0xCCCCCC;			
			btnHit.addChild(hitShp);
			
			addChild(btnUp);
			childToList(type + "-up", btnUp);
			
			addChild(btnDown);
			childToList(type + "-down", btnDown);
			
			addChild(btnHit);
			childToList(type + "-hit", btnHit);
			
			initial = type + "-up";
			
			up = type + "-up";
			out = type + "-up";
			down = type + "-down";
			hit = type + "-hit";
			
			dispatch = "down:" + type;					
		}	
		
		override public function init():void {
			if (lineStroke) {
				btnDownBg.lineStroke = lineStroke;
				btnUpBg.lineStroke = lineStroke;
			}
			if (lineColor) {
				btnDownBg.lineColor = lineColor;
				btnUpBg.lineColor = lineColor;
			}
			if (color) {
				btnDownBg.color= color;
				btnUpBg.color= color;
			}			
			super.init();
		}
		
	}

}