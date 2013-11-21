package as3 {
	import away3d.containers.View3D;
	import away3d.debug.AwayStats;
	import away3d.debug.Trident;
	import away3d.entities.Mesh;
	import away3d.lights.PointLight;
	import away3d.materials.ColorMaterial;
	import away3d.materials.lightpickers.StaticLightPicker;
	import away3d.primitives.CubeGeometry;
	import com.gestureworks.away3d.TouchManager3D;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.interfaces.ITouchObject3D;
	import flash.events.Event;
	import flash.geom.Vector3D;

	[SWF(width = "1280", height = "720", frameRate = "60", backgroundColor = "0x000000")]
	
	/**
	 * This example demonstrates the touch rotate 2d gesture.
	 */
	public class TouchRotate2D extends GestureWorks  {
		
		private var view:View3D;
		private var material:ColorMaterial;
		private var lightPicker:StaticLightPicker;
		private var light:PointLight;
		private var cube:Mesh;
		private var tO:ITouchObject3D;	
		
		public function TouchRotate2D():void {
			super();
			
			// GestureWorks now requires a gml file
			gml = "gml/gestures.gml";
		}
		
		/**
		 * The gestureworksInit callback is now triggered by setting the gml attribute.
		 * Here we set up the Away3D scene and gestures.
		 */		
		override protected function gestureworksInit():void {
			setupScene();
			setupGestures();
		}
		
		/**
		 * Setup 3d scene
		 */		
		private function setupScene():void {
			
			// create view
			view = new View3D();
			view.width = stage.stageWidth
			view.height = stage.stageHeight;
			view.backgroundColor = 0x000000;			
			view.antiAlias = 4;
			view.camera.lens.far = 15000;
			view.camera.position = new Vector3D(0, 0, -300);			
			addChild(view);
			
			// create stats panel
			addChild(new AwayStats(view));

			// create lights
			lightPicker = new StaticLightPicker( [] );
			light = new PointLight();
			lightPicker.lights = [ light ];
			view.scene.addChild( light );

			// create axis mesh
			var axis:Trident = new Trident(120);
			view.scene.addChild(axis);				
			
			// create material
			material = new ColorMaterial(0xCCCCCC);
			material.lightPicker = lightPicker;

			// create cube mesh
			cube = new Mesh( new CubeGeometry(), material );
			view.scene.addChild(cube);	
			
			// must set mouseEnabled=true for sucessful hit test
			cube.mouseEnabled = true; 

			// create an update event loop
			addEventListener(Event.ENTER_FRAME, update);				
		}
		
		
		/**
		 * Setup gestures
		 */
		private function setupGestures():void {
			
			// touch manager must be initialized, only need to do this once per application
			TouchManager3D.initialize(); 
			
			// register a mesh to the TouchManager3D and it will return a touch object that you can use to configure gesture properties
			// second argument set to false, will force 2D touch data and will return gesture values as stage coordinates like the old TouchSprite behaivor
			tO = TouchManager3D.registerTouchObject(cube, false) as ITouchObject3D;
			
			// turn native transforms off as we will use gesture events to apply the transformations
			tO.nativeTransform = false;			
			
			// provides tween intertia upon release
			tO.releaseInertia = true; 
			
			// add rotate 2D gesture	-> see loaded gml file
			tO.gestureList = { "n-rotate":true }; 	
			
			// add rotate event listener	
			tO.addEventListener(GWGestureEvent.ROTATE, onRotate); 		
		}
		
		/**
		 * Rotate event handler
		 */
		private function onRotate(e:GWGestureEvent):void {	
			
			// apply gesture rotate values to cube, pick an axis to rotate about
			
			cube.rotationX += e.value.rotate_dtheta;
			//cube.rotationY += e.value.rotate_dtheta;
			//cube.rotationZ += e.value.rotate_dtheta;
			
			trace("rotate values:", e.value.rotate_dtheta );	
		}

		/**
		 * Update loop
		 */
		private function update(event:Event):void {
			light.position = view.camera.position;
			view.render();	
		}		
		
	}
}