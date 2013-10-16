package as3.elements
{
	import com.gestureworks.cml.element.Button;
	import com.gestureworks.cml.element.Container;
	import com.gestureworks.cml.element.Graphic;
	import com.gestureworks.cml.element.OrbMenu;
	import com.gestureworks.cml.element.Text;
	import com.gestureworks.cml.events.StateEvent;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class OrbMenuEx extends GestureWorks
	{
		private var bkg:Graphic;
		private var buttons:Array;
		private var background:Graphic;
		
		public function OrbMenuEx():void
		{

		}
		
		override protected function gestureworksInit():void
		{			
			bkg = new Graphic();
			bkg.shape = "rectangle";
			bkg.width = 1280;
			bkg.height = 720;
			bkg.color = 0x000000;
			bkg.fill = "color"
			bkg.visible = true;
			addChild(bkg);
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("OrbMenu");
			exTemp.createDesc("<p>This tag has a list of menu items and allows the user to insert any number of items in the menu. The list of menu items can be viewed through the drag event. The user can change the location of curve text through the attributes.<br/><br/>" + "This example has two modes-floating and stable. These modes can be changed by setting the attractMode attribute to true or false. With the repeatTimer attribute the user can set the timer before floating starts.</p>");
			
			var orb:OrbMenu = new OrbMenu();
			orb.x = 600;
			orb.y = 200;
			
			// listen to orb menu's state event for button presses
			addEventListener(StateEvent.CHANGE, changeBkg);
			
			//can set the timer and attract mode of orbmenu
			orb.repeatTimer = 1;
			orb.attractMode = true;
			
			//curve text location of orbmenu
			orb.textX = 90;
			orb.textY = 80;
			orb.textRadius = 100;
			orb.curveText = "MENU";
			orb.coverage = 0.4;
			orb.startAngle = 100;
			orb.stopAngle = 100;
			
			//circle radius
			orb.orbRadius = 100;
			
			//gradient matrix graphics
			orb.gradientType = "linear";
			orb.gradientColors = "0x404040, 0x404040";
			orb.gradientAlphas = "1,1";
			orb.gradientRatios = "0,255";
			orb.gradientHeight = 100;
			orb.gradientWidth = 50;
			orb.gradientRotation = 0;
			orb.gradientX = 25;
			orb.gradientY = 0;
			
			//outer circle graphics
			orb.shape1LineStoke = 3;
			orb.shape1OutlineColor = 0x000000;
			
			//inner circle graphics
			orb.shape2LineStoke = 3;
			orb.shape2OutlineColor = 0x000000;
			
			//background(rectangle) graphics
			orb.backgroundColor = 0x808080;
			orb.backgroundOutlineColor = 0x000000;
			orb.backgroundLineStoke = 3;
			
			//background(rectangle) graphics				
			background = new Graphic();
			background.visible = false;
			orb.addChild(background);
			
			var numberOfButtons:int = 3;
			var width:Number = 100;
			var height:Number = 135;
			var orbRadius:Number = 100;
			
			buttons = new Array(numberOfButtons);
			
			// position of buttons,lines,background
			for (var i:int = 0; i < numberOfButtons; i++)
			{
				var line:Sprite = new Sprite();
				line.graphics.lineStyle(0, 0x000000, 1);
				line.graphics.moveTo((width * i + orbRadius), 0);
				line.graphics.lineTo((width * i + orbRadius), height);
				
				buttons[i] = new Button();
				
				if (i == 0)
					buttons[i] = createButton(buttons[i], "btn0", "grey");
				else if (i == 1)
					buttons[i] = createButton(buttons[i], "btn1", "purple");
				else if (i == 2)
					buttons[i] = createButton(buttons[i], "btn2", "pink");
				
				buttons[i].x = 100 + width * i;
				buttons[i].y = 0;
				
				background.addChild(buttons[i]);
				buttons[i].init();
				
				background.addChild(line);
			}
			
			if (numberOfButtons > 1)
			{
				background.graphics.beginFill(0x808080);
				background.graphics.drawRoundRect(0 - width, 0, (orbRadius + width) + (width * numberOfButtons), 135, 25, 25);
			}
			else
			{
				background.graphics.drawRoundRect(0, 0, (orbRadius + width), 135, 25, 25);
			}
			
			orb.buttons = buttons;
			orb.init();
			addChild(orb);
		}
		
		//dispatches different event states up, down,hit
		private function createButton(b:Button, type:String, value:String):Button
		{
			var btnUp:Container = new Container();
			btnUp.id = type + "-up";
			
			var text:Text = new Text();
			text.text = value;
			text.x = 17;
			text.y = 45;
			text.selectable = false;
			text.color = 0x151B54;
			text.fontSize = 20;
			text.visible = true;
			text.multiline = true;
			text.font = "OpenSansRegular";
			btnUp.addChild(text);
			
			var btnDown:Container = new Container();
			btnDown.id = "btn-down";
			
			var btnHit:Container = new Container();
			btnHit.id = type + "-hit";
			
			var hitBg:Graphic = new Graphic();
			hitBg.shape = "rectangle";
			hitBg.id = type + "HitBg";
			hitBg.alpha = 0;
			hitBg.width = 100;
			hitBg.height = 100;
			hitBg.lineStroke = 1.5;
			hitBg.color = 0xCCCCCC;
			
			btnHit.addChild(hitBg);
			btnHit.childToList(type + "HitBg", hitBg);
			
			b.addChild(btnUp);
			b.childToList(type + "-up", btnUp);
			
			b.addChild(btnDown);
			b.childToList(type + "-down", btnDown);
			
			b.addChild(btnHit);
			b.childToList(type + "-hit", btnHit);
			
			b.initial = type + "-up";
			
			b.up = type + "-up";
			b.out = type + "-up";
			b.down = type + "-down";
			b.hit = type + "-hit";
			
			b.dispatch = "down:" + type;
			
			return b;
		}
		
		//background color changes on state event.
		private function changeBkg(event:StateEvent):void
		{
			if (event.value == "btn0")
			{
				bkg.visible = true;
				bkg.color = 0x817679;
			}
			else if (event.value == "btn1")
			{
				bkg.visible = true;
				bkg.color = 0x5E5A80;
			}
			else if (event.value == "btn2")
			{
				bkg.visible = true;
				bkg.color = 0xC48189;
			}
		}
	
	}

}