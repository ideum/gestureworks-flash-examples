package as3.elements 
{
	import com.gestureworks.cml.element.Container;
	import com.gestureworks.cml.element.Graphic;
	import com.gestureworks.cml.element.Text;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]
	
	public class GraphicEx extends GestureWorks 
	{
		public function GraphicEx():void 
		{
			gml = "gml/gestures.gml";						
		}
		
		override protected function gestureworksInit():void 
		{
			// entry point
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("Graphic Element");
			exTemp.createDesc("<p>Graphic is a class that creates vector objects with a wide variety of custom displays.</p>");
			
			var container:Container = new Container();
			container.scale = 0.7;
			container.x = 200;
			addChild(container);
			
			var hLineText:Text = createText("Horizontal Line", 500, 50);
			container.addChild(hLineText);

			//Horizontal line
			var hLine:Graphic = new Graphic();
			hLine.shape = "line";
			hLine.width = 200;
			hLine.lineStroke = 5;
			hLine.lineColor = 0xff0000;
			hLine.lineAlpha = 0.5;
			hLine.x = 500;
			hLine.y = 120;
			container.addChild(hLine);
			
			var vLineText:Text = createText("Vertical Line", 750, 50);
			container.addChild(vLineText);
			
			//Vertical Line
			var vLine:Graphic = new Graphic();
			vLine.shape = "line";
			vLine.height = 200;
			vLine.lineStroke = 10;
			vLine.lineColor = 0x00ff00;
			vLine.lineAlpha = 0.5;
			vLine.x = 800;
			vLine.y = 100;
			container.addChild(vLine);
			
			var vectorText:Text = createText("Vector", 950, 50);
			container.addChild(vectorText);
			
			//Vector
			var vector:Graphic = new Graphic();
			vector.shape = "vector";
			vector.width = 100;
			vector.height = 200;
			vector.lineStroke = 15;
			vector.lineColor = 0x0000ff;
			vector.lineAlpha = 1;
			vector.x = 1000;
			vector.y = 100;
			container.addChild(vector);
			
			var rectText:Text = createText("Rectangle", 1150, 50);
			container.addChild(rectText);
			
			//Rectangle
			var rectShape:Graphic = new Graphic();
			rectShape.shape = "rectangle";
			rectShape.width = 100;
			rectShape.height = 100;
			rectShape.color = 0x448866;
			rectShape.lineStroke = 10;
			rectShape.lineColor = 0x448899;
			rectShape.x = 1150;
			rectShape.y = 120;
			container.addChild(rectShape);
			
			var roundRectText:Text = createText("Round Rectangle", 500, 350);
			container.addChild(roundRectText);
			
			//Round Rectangle
			var roundRect:Graphic = new Graphic();
			roundRect.shape = "roundRectangle";
			roundRect.width = 100;
			roundRect.height = 200;
			roundRect.cornerWidth = 20;
			roundRect.cornerHeight = 20;
			roundRect.color = 0xDDAA99;
			roundRect.lineStroke = 10;
			roundRect.lineColor = 0xAA7777;
			roundRect.x = 530;
			roundRect.y = 400;
			container.addChild(roundRect);
			
			var circleText:Text = createText("Circle", 820, 350);
			container.addChild(circleText);
			
			//Circle
			var circle:Graphic = new Graphic();
			circle.shape = "circle";
			circle.radius = 100;
			circle.color = 0x44ccaa;
			circle.lineStroke = 10;
			circle.lineColor = 0x449933;
			circle.x = 750;
			circle.y = 400;
			container.addChild(circle);
			
			var ellipseText:Text = createText("Ellipse", 1000, 350);
			container.addChild(ellipseText);
			
			//Ellipse
			var ellipse:Graphic = new Graphic();
			ellipse.shape = "ellipse";
			ellipse.width = 100;
			ellipse.height = 200;
			ellipse.color = 0x44ccaa;
			ellipse.lineStroke = 0;
			ellipse.x = 1000;
			ellipse.y = 400;
			container.addChild(ellipse);
			
			var gradientRectText:Text = createText("Gradient", 1200, 350);
			container.addChild(gradientRectText);
			
			//Gradient Rectangle
			var gradientRect:Graphic = new Graphic();
			gradientRect.shape = "rectangle";
			gradientRect.width = 200;
			gradientRect.height = 100;
			gradientRect.lineStroke = 2;
			
			gradientRect.fill = "gradient";
			gradientRect.gradientAlphas = "0.5, 1, 0.5";
			gradientRect.gradientColors = "0x229944, 0xFF5544, 0x3366aa";
			gradientRect.gradientRatios = "0, 65, 255";
			gradientRect.gradientRotation = 45;
			
			gradientRect.x = 1200;
			gradientRect.y = 400;
			container.addChild(gradientRect);
			
			var triangleText:Text = createText("Triangle", 500, 740);
			container.addChild(triangleText);
			
			//Triangle
			var triangle:Graphic = new Graphic();
			triangle.shape = "triangle";
			triangle.color = 0x00ff00;
			triangle.height = 100;
			triangle.x = 500;
			triangle.y = 780;
			container.addChild(triangle);
			
			var curveText:Text = createText("Curve", 750, 740);
			container.addChild(curveText);
			
			//Curve
			var curve:Graphic = new Graphic();
			curve.shape = "curve";
			curve.startX = 150;
			curve.startY = 100;
			curve.anchorX = 400;
			curve.anchorY = 100;
			curve.controlX = 275;
			curve.controlY = 0;
			curve.color = 0xff0000;
			curve.x = 530;
			curve.y = 760;
			container.addChild(curve);
			
			var pathText:Text = createText("Path", 1000, 740);
			container.addChild(pathText);
			
			//Path
			var path:Graphic = new Graphic();
			path.shape = "path";
			path.pathCommands = "1,2,1,2";
			path.pathCoordinates = "200,10, 300,110, 300,10, 200,110";
			path.color = 0x000000;
			path.x = 800;
			path.y = 780;
			container.addChild(path);
		}
		
		private function createText(value:String, xLoc:Number, yLoc:Number):Text {
			var t:Text = new Text();
			t.text = value;
			t.x = xLoc;
			t.y = yLoc;
			t.color = 0xffffff;
			t.fontSize = 25;
			t.width = 200;
			
			return t;
		}
	}
	
}