package as3 {
	import away3d.containers.View3D;
	import away3d.controllers.HoverController;
	import away3d.debug.AwayStats;
	import away3d.debug.Trident;
	import away3d.entities.Mesh;
	import away3d.lights.PointLight;
	import away3d.materials.ColorMaterial;
	import away3d.materials.lightpickers.StaticLightPicker;
	import away3d.primitives.CubeGeometry;
	import com.gestureworks.away3d.TouchManager3D;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.interfaces.ITouchObject3D;
	import flash.events.Event;
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;

	[SWF(width = "1280", height = "720", frameRate = "60", backgroundColor = "0x000000")]
	
	/**
	 * This example demonstrates how to create a touch camera using the hover camer controller.
	 */
	public class TouchCamera extends GestureWorks  {
		
		private var view:View3D;
		private var material:ColorMaterial;
		private var lightPicker:StaticLightPicker;
		private var light:PointLight;
		private var cube:Mesh;
		private var tO:ITouchObject3D;	
		private var touchCamera:TouchSprite;
		private var cameraController:HoverController;
		
		public function TouchCamera():void {
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
			addChild(view);
			
			// create stats panel
			addChild(new AwayStats(view));

			// camera controller
			cameraController = new HoverController( view.camera, null, 0, 0, -300);
			cameraController.yFactor = 2;
			cameraController.wrapPanAngle = true;			
			
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
			tO = TouchManager3D.registerTouchObject(cube) as ITouchObject3D;
			
			// turn native transforms off as we will use gesture events to apply the transformations
			tO.nativeTransform = false;
			
			// provides tween intertia upon release
			tO.releaseInertia = true; 
			
			// add scale 3D gesture	-> see loaded gml file
			tO.gestureList = { "n-drag-3d":true, "n-rotate-3d":true, "n-scale-3d":true }; 	
			
			// add scale event listener	
			tO.addEventListener(GWGestureEvent.DRAG, onDrag); 		
			tO.addEventListener(GWGestureEvent.ROTATE, onRotate);
			tO.addEventListener(GWGestureEvent.SCALE, onScale); 
			
			
			// create a touch camera using 2d drag gesture on the view
			touchCamera = new TouchSprite(view);
			touchCamera.gestureList = { "n-drag":true };
			touchCamera.addEventListener(GWGestureEvent.DRAG, onCameraDrag);
		}
		
		/**
		 * Camera drag event handler
		 */
		private function onCameraDrag(e:GWGestureEvent):void {		
		
			// apply gesture drag values to cameraController with arbituary scale factor (.25);
			cameraController.panAngle += e.value.drag_dx * .25;
			cameraController.tiltAngle += e.value.drag_dy * .25;
			
			trace("camera drag values:", e.value.drag_dx, e.value.drag_dy);
		}		
		
		/**
		 * Scale event handler
		 */
		private function onDrag(e:GWGestureEvent):void {	
			
			var m:Matrix3D = cube.parent.inverseSceneTransform; 
			var v:Vector3D = new Vector3D(e.value.value.drag_dx, e.value.value.drag_dy, e.value.value.drag_dz) ; 
			v = m.deltaTransformVector(v); 					
			
			// apply gesture drag values to cube
			cube.x += v.x;
			cube.y += v.y;
			cube.z += v.z;
			
			trace("drag values:", e.value.drag_dx, e.value.drag_dy, e.value.drag_dz);			
		}		
		
		/**
		 * Rotate event handler
		 */
		private function onRotate(e:GWGestureEvent):void {	
			
			// apply gesture rotate values to cube
			cube.rotationX += e.value.rotate_dthetaX;
			cube.rotationY += e.value.rotate_dthetaY;
			cube.rotationZ += e.value.rotate_dthetaZ;
			
			trace("rotate values:", e.value.rotate_dthetaX, e.value.rotate_dthetaY, e.value.rotate_dthetaZ);	
		}

		/**
		 * Scale event handler
		 */
		private function onScale(e:GWGestureEvent):void {	
			
			// apply gesture scale values to cube
			cube.scaleX += e.value.scale_dsx;
			cube.scaleY += e.value.scale_dsy;
			cube.scaleZ += e.value.scale_dsz;
			
			trace("scale values:", e.value.scale_dsx, e.value.scale_dsy, e.value.scale_dsz);			
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