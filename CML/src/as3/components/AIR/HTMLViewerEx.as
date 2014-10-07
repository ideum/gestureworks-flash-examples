package as3.components.AIR
{
	import as3.components.ui.InfoPanel;
	import as3.components.ui.ViewerMenu;
	import com.gestureworks.cml.components.HTMLViewer;
	import com.gestureworks.cml.elements.Frame;
	import com.gestureworks.cml.elements.HTML;
	import com.gestureworks.cml.elements.Image;
	import com.gestureworks.cml.utils.DisplayUtils;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	// AIR-EXCLUSIVE 
	public class HTMLViewerEx extends GestureWorks
	{		
		public function HTMLViewerEx():void
		{
			gml = "gml/gestures.gml";
		}
		
		override protected function gestureworksInit():void
		{
			//Description
			var exTemp:ExampleTemplate = new ExampleTemplate();			
			exTemp.createTitle("HTML Viewer");
			exTemp.createDesc("<p>The HTML Viewer is an AIR-EXCLUSIVE component that is primarily meant to display an HTML website on the front side and meta-data on the back side." +
				"The width and height of the component are automatically set to the dimensions of the HTML element.<br /><br />" +
				"This example demonstrates an HTML element on the front and an info panel on the back. The viewer can be rotated, scaled, and dragged.</p><br />" +
				"<p>See also:<br />" +
				"Component<br />HTML<br />");
			addChild(exTemp);
			
			//Image Viewer Component
			var htmlViewer:HTMLViewer = new HTMLViewer();
			htmlViewer.x = 550;
			htmlViewer.y = 105;
			htmlViewer.scale = .5;
			htmlViewer.rotation = 0;
			htmlViewer.mouseChildren = true;
			htmlViewer.gestureList = {"n-drag": true, "n-scale": true, "n-rotate": true};			
			addChild(htmlViewer);			

			//FRONT: image element
			var html:HTML = new HTML;
			html.targetParent = true;
			html.src = "http://www.ideum.com/";
			html.width = 1280;
			html.height = 1000;
			html.smooth = true;
			htmlViewer.addChild(html);
			
			//BACK: info panel
			var infoPanel:InfoPanel = new InfoPanel();
			infoPanel.bkgColor = 0x6699FF;
			infoPanel.tFontSize = 25;
			infoPanel.title = "Ideum";
			infoPanel.descrHTML = "<p>Ideum is the parent company for both GestureWorks and Open Exhibits. Ideum is privately-held, creative company based in Corrales, New Mexico. The firm develops commercial software, multitouch hardware, and offers design and installation services to museums, nonprofits, and socially responsible companies.</p><br />" +

					"<p>Ideum has designed and developed a commercial multitouch and motion recognition software development kit (SDK) called GestureWorks. The GestureWorks suite consists of GestureWorks Core for development in C++, .NET(C#, VB), Java, Python, and JavaScript (HTML5), GestureWorks Flash for ActionScript, and the Windows-based utility GestureKey for mapping key commands and mouse events to gestures. The framework supports 300+ unique gestures, more than any other software development kit available. In 2009, Ideum introduced Gesture Markup Language (GML), the world’s first mark-up language for multitouch. In addition, the company has developed GestureWorks Gameplay, a software product that allows gamers to use and build virtual controllers for popular games.</p><br />" +

					"<p>In addition to offering these products, Ideum offers custom software and hardware development and is the principal organization in a number of grants focusing on educational outreach with the National Science Foundation (NSF), National Oceanic and Atmospheric Association (NOAA), and the National Aeronautics and Space Administration (NASA).</p><br />" +

					"<p>Since 1999, Ideum has worked on nearly 100 interactive media projects in the fields of art, culture, history, music, science, and technology. The company’s goal is to create visitor-centric exhibits that seamlessly integrate a balance of compelling design, intuitive user interfaces, and dynamic content. Ideum-developed exhibits adhere to the highest technical and accessibility standards.</p><br />" +

					"<p>While Ideum focuses on delivering technically flawless interactive exhibits and Web applications to our clients, the company has a history of experimenting with new and promising educational technologies. In 2008, Ideum developed its’ first multitouch table as a platform for multiuser and gesture-based exhibits. In 2009, Ideum released the GestureWorks framework. In 2010, Ideum was awarded funding from the National Science Foundation (NSF) for the Open Exhibits software and community initiative. In 2012, Ideum received NSF funding for the Human Computer Interaction in Informal Science Education (HCI+ISE) conference held in the summer of 2013.</p>"	
			
			htmlViewer.addChild(infoPanel);
			htmlViewer.back = infoPanel;
			
			//Frame
			var frame:Frame = new Frame();
			frame.targetParent = true;
			frame.mouseChildren = false;
			htmlViewer.addChild(frame);			
			
			// Menu
			var menu:ViewerMenu = new ViewerMenu();
			menu.paddingLeft = 0;
			menu.paddingRight = 0;
			htmlViewer.addChild(menu);
			
			//Initialize component
			DisplayUtils.initAll(htmlViewer);
		}

	}

}