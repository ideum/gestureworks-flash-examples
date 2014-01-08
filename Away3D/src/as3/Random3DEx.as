﻿package as3 {
	import away3d.containers.ObjectContainer3D;
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
	import com.gestureworks.cml.away3d.layouts.RandomLayout3D;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.interfaces.ITouchObject3D;
	import flash.events.Event;
	import flash.geom.Vector3D;

	[SWF(width = "1920", height = "1080", frameRate = "60", backgroundColor = "0x000000")]
	
	/**
	 * This example demonstrates how to create a touch camera using the hover camer controller.
	 */
	public class Random3DEx extends GestureWorks  {
		
		private var view:View3D;
		private var material:ColorMaterial;
		private var lightPicker:StaticLightPicker;
		private var light:PointLight;
		private var tO:ITouchObject3D;	
		private var touchCamera:TouchSprite;
		private var cameraController:HoverController;
		private var container:ObjectContainer3D;
		private var cubeGeometry:CubeGeometry;
		private var r3D:RandomLayout3D;
		
		public function Random3DEx():void {
			super();
			fullscreen = true;
			
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

			container = new ObjectContainer3D;
			view.scene.addChild(container);
			
			cubeGeometry = new CubeGeometry;
			
						
			for (var i:int = 0; i < 100; i++) {
				var cube:Mesh = new Mesh( cubeGeometry, material );
				container.addChild(cube);	
			}
			
			r3D = new RandomLayout3D();
			r3D.posMin = new Vector3D(-100,-100,-100);
			r3D.posMax = new Vector3D(100,100,100);
			
			r3D.rotMin = new Vector3D(-45,-45,-45);
			r3D.rotMax = new Vector3D(45,45,45);			
			
			r3D.scaMin = new Vector3D(.5,.5,.5);
			r3D.scaMax = new Vector3D(1,1,1);
			
			// alternatively set a single value for scale
			//r3D.scaleMin = .5;
			//r3D.scaleMax = 1;
			
			r3D.autoplay = true;
			r3D.tween = true;
			r3D.onComplete = complete;
			r3D.layout(container);
			//r3D.layoutTween.play();
			
			// create an update event loop
			addEventListener(Event.ENTER_FRAME, update);				
		}
		
		
		private function complete():void {
			trace("complete");
			
			r3D = new RandomLayout3D();
			r3D.posMin = new Vector3D(-100,-100,-100);
			r3D.posMax = new Vector3D(100,100,100);
			
			r3D.rotMin = new Vector3D(-45,-45,-45);
			r3D.rotMax = new Vector3D(45,45,45);			
			
			r3D.scaMin = new Vector3D(.5,.5,.5);
			r3D.scaMax = new Vector3D(1,1,1);
			
			// alternatively set a single value for scale
			//r3D.scaleMin = .5;
			//r3D.scaleMax = 1;
			
			r3D.tween = true;
			r3D.autoplay = true;
			r3D.onComplete = complete;
			r3D.layout(container);
			//r3D.layoutTween.play();			
			
			//r3D.layout(container);
			//r3D.layoutTween.play();
		}
		
		
		/**
		 * Setup gestures
		 */
		private function setupGestures():void {
			
			// touch manager must be initialized, only need to do this once per application
			TouchManager3D.initialize(); 
			
			// create a touch camera using a 2d drag gesture on the view
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