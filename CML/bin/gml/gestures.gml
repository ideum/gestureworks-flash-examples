<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage xmlns:gml="http://gestureworks.com/gml/version/1.0">
	
	<Gesture_set gesture_set_name="basic-core-gestures">
				
					<comment>The 'basic-core-gestures' are the simple form of the classic roate scale and drag gestures commonly used to manipulate touch objects.</comment>
		
					<Gesture id="n-drag" type="drag">
						<comment>The 'n-drag' gesture can be activated by any number of touch points between 1 and 10. When a touch down is recognized on a touch object the position
						of the touch point is tracked. This change in the position of the touch point is mapped directly to the position of the touch object.</comment>
						<match>
							<action>
								<initial>
									<cluster point_number="0" point_number_min="1" point_number_max="10"/>
								</initial>
							</action>
						</match>	
						<analysis>
							<algorithm class="kinemetric" type="continuous">
								<library module="drag"/>
								<returns>
									<property id="drag_dx" result="dx"/>
									<property id="drag_dy" result="dy"/>
								</returns>
							</algorithm>
						</analysis>	
						<mapping>
							<update dispatch_type="continuous">
								<gesture_event  type="drag">
									<property ref="drag_dx" target="x"/>
									<property ref="drag_dy" target="y"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
			
					<Gesture id="n-rotate" type="rotate">
					<comment>The 'n-rotate' gesture can be activated by any number of touch points between 2 and 10. When two or more touch points are recognized on a touch object the relative orientation
						of the touch points are tracked and grouped into a cluster. This change in the orientation of the cluster is mapped directly to the rotation of the touch object.</comment>
					
						<match>
							<action>
								<initial>
									<cluster point_number="0" point_number_min="2" point_number_max="10"/>
								</initial>
							</action>
						</match>
						<analysis>
							<algorithm class="kinemetric" type="continuous">
								<library module="rotate"/>
								<returns>
									<property id="rotate_dtheta" result="dtheta"/>
								</returns>
							</algorithm>
						</analysis>	
						<mapping>
							<update dispatch_type="continuous">
								<gesture_event type="rotate">
									<property ref="rotate_dtheta" target="rotate"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="n-scale" type="scale">
					
						<comment>The 'n-scale' gesture can be activated by any number of touch points between 2 and 10. When two or more touch points are recognized on a touch object the relative separation
						of the touch points are tracked and grouped into a cluster. Changes in the separation of the cluster are mapped directly to the scale of the touch object.</comment>
						
						<match>
							<action>
								<initial>
									<cluster point_number="0" point_number_min="2" point_number_max="10"/>
								</initial>
							</action>
						</match>
						<analysis>
							<algorithm class="kinemetric" type="continuous">
								<library module="scale"/>
								<returns>
									<property id="scale_dsx" result="ds"/>
									<property id="scale_dsy" result="ds"/>
								</returns>
							</algorithm>
						</analysis>	
						<mapping>
							<update dispatch_type="continuous">
								<gesture_event  type="scale">
									<property ref="scale_dsx" target="scaleX"/>
									<property ref="scale_dsy" target="scaleY"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>

		</Gesture_set>	
			
			
			
			
			
			
			
			
			
			
			
		<Gesture_set gesture_set_name="inertial-core-gestures">
		
				<Gesture id="n-drag-inertia" type="drag">
						<comment>The 'n-drag' gesture can be activated by any number of touch points. When a touch down is recognized on a touch object the position
						of the touch point is tracked. This change in the position of the touch point is mapped directly to the position of the touch object.</comment>
						<match>
							<action>
								<initial>
									<cluster point_number="0" point_number_min="1" point_number_max="10"/>
								</initial>
							</action>
						</match>	
						<analysis>
							<algorithm class="kinemetric" type="continuous">
								<library module="drag"/>
								<returns>
									<property id="drag_dx" result="dx"/>
									<property id="drag_dy" result="dy"/>
								</returns>
							</algorithm>
						</analysis>	
						<processing>
							<inertial_filter>
								<property ref="drag_dx" active="true" friction="0.9"/>
								<property ref="drag_dy" active="true" friction="0.9"/>
							</inertial_filter>
							<delta_filter>
								<property ref="drag_dx" active="true" delta_min="0.05" delta_max="500"/>
								<property ref="drag_dy" active="true" delta_min="0.05" delta_max="500"/>
							</delta_filter>
						</processing>
						<mapping>
							<update dispatch_type="continuous">
								<gesture_event type="drag">
									<property ref="drag_dx" target="x"/>
									<property ref="drag_dy" target="y"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="n-rotate-inertia" type="rotate">
						<match>
							<action>
								<initial>
									<cluster point_number="0" point_number_min="2" point_number_max="10"/>
								</initial>
							</action>
						</match>
						<analysis>
							<algorithm class="kinemetric" type="continuous">
								<library module="rotate"/>
								<returns>
									<property id="rotate_dtheta" result="dtheta"/>
								</returns>
							</algorithm>
						</analysis>	
						<processing>
							<inertial_filter>
								<property ref="rotate_dtheta" active="true" friction="0.9"/>
							</inertial_filter>
							<delta_filter>
								<property ref="rotate_dtheta" active="true" delta_min="0.01" delta_max="20"/>
							</delta_filter>
						</processing>
						<mapping>
							<update dispatch_type="continuous">
								<gesture_event type="rotate">
									<property ref="rotate_dtheta" target="rotate"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="n-scale-inertia" type="scale">
						<match>
							<action>
								<initial>
									<cluster point_number="0" point_number_min="2" point_number_max="10"/>
								</initial>
							</action>
						</match>
						<analysis>
							<algorithm class="kinemetric" type="continuous">
								<library module="scale"/>
								<returns>
									<property id="scale_dsx" result="ds"/>
									<property id="scale_dsy" result="ds"/>
								</returns>
							</algorithm>
						</analysis>	
						<processing>
							<inertial_filter>
								<property ref="scale_dsx" active="true" friction="0.9"/>
								<property ref="scale_dsy" active="true" friction="0.9"/>
							</inertial_filter>
							<delta_filter>
								<property ref="scale_dsx" active="true" delta_min="0.0005" delta_max="0.5"/>
								<property ref="scale_dsy" active="true" delta_min="0.0005" delta_max="0.5"/>
							</delta_filter>
						</processing>
						<mapping>
							<update dispatch_type="continuous">
								<gesture_event type="scale">
									<property ref="scale_dsx" target="scaleX"/>
									<property ref="scale_dsy" target="scaleY"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					
			</Gesture_set>		
					
					
					
					
					
					
			<Gesture_set gesture_set_name="custom-core-gestures">		
					
			
						<Gesture id="n_what" type="drag">
							<comment>The 'n-what' gesture can be activated by any number of touch points. When a touch down is recognized on a touch object the position
							of the touch point is tracked. This change in the position of the touch point is mapped directly to the position of the touch object.</comment>
							<match>
								<action>
									<initial>
										<cluster point_number="0" point_number_min="1" point_number_max="10" translation_min="0"/>
									</initial>
								</action>
							</match>	
							<analysis>
								<algorithm class="kinemetric" type="continuous">
									<library module="drag"/>
									<returns>
										<property id="dx" result="dx"/>
										<property id="dy" result="dy"/>
									</returns>
								</algorithm>
							</analysis>	
							<mapping>
								<update dispatch_type="continuous">
									<gesture_event type="custom">
										<property ref="dx" target=""/>
										<property ref="dy" target=""/>
									</gesture_event>
								</update>
							</mapping>
						</Gesture>
						
						
						<Gesture id="n-drag-x" type="drag">
							<match>
								<action>
									<initial>
										<cluster point_number="0" point_number_min="1" point_number_max="5"/>
									</initial>
								</action>
							</match>	
							<analysis>
								<algorithm class="kinemetric" type="continuous">
									<library module="drag"/>
									<returns>
										<property id="drag_dx" result="dx"/>
									</returns>
								</algorithm>
							</analysis>	
							<mapping>
								<update dispatch_type="continuous">
									<gesture_event type="drag">
										<property ref="drag_dx" target="x"/>
									</gesture_event>
								</update>
							</mapping>
						</Gesture>
							
						
						<Gesture id="2-finger-drag" type="drag">
							<match>
								<action>
									<initial>
										<cluster point_number="2"/>
									</initial>
								</action>
							</match>	
							<analysis>
								<algorithm>
									<library module="translate"/>
									<returns>
										<property id="drag_dx" result="dx"/>
										<property id="drag_dy" result="dy"/>
									</returns>
								</algorithm>
							</analysis>	
							<mapping>
								<update dispatch_type="continuous">
									<gesture_event type="drag">
										<property ref="drag_dx" target="x"/>
										<property ref="drag_dy" target="y"/>
									</gesture_event>
								</update>
							</mapping>
						</Gesture>
						
						<Gesture id="1-finger-drag" type="drag">
							<match>
								<action>
									<initial>
										<cluster point_number="1"/>
									</initial>
								</action>
							</match>	
							<analysis>
								<algorithm>
									<library module="translate"/>
									<returns>
										<property id="drag_dx" result="dx"/>
										<property id="drag_dy" result="dy"/>
									</returns>
								</algorithm>
							</analysis>	
							<mapping>
								<update dispatch_type="continuous">
									<gesture_event type="drag">
										<property ref="drag_dx" target="x"/>
										<property ref="drag_dy" target="y" />
									</gesture_event>
								</update>
							</mapping>
						</Gesture>
						
						<Gesture id="4-finger-drag" type="drag">
							<match>
								<action>
									<initial>
										<cluster point_number="4" point_number_min="2" point_number_max="5"/>
									</initial>
								</action>
							</match>	
							<analysis>
								<algorithm>
									<library module="translate"/>
									<returns>
										<property id="drag_dx" result="dx"/>
										<property id="drag_dy" result="dy"/>
									</returns>
								</algorithm>
							</analysis>	
							<mapping>
								<update dispatch_type="continuous">
									<gesture_event type="drag">
										<property ref="drag_dx" target="x"/>
										<property ref="drag_dy" target="y"/>
									</gesture_event>
								</update>
							</mapping>
						</Gesture>
						
						
						<Gesture id="n-rotate-noise-filter" type="rotate">
							<match>
								<action>
									<initial>
										<cluster point_number="0" point_number_min="2" point_number_max="10"/>
									</initial>
								</action>
							</match>
							<analysis>
								<algorithm class="kinemetric" type="continuous">
									<library module="rotate"/>
									<returns>
										<property id="rotate_dtheta" result="dtheta"/>
									</returns>
								</algorithm>
							</analysis>	
							<processing>
								<mean_filter>
									<property ref="rotate_dtheta" active="true" frames="6"/>
								</mean_filter>
								<delta_filter>
									<property ref="rotate_dtheta" active="true" delta_min="0.01" delta_max="20"/>
								</delta_filter>
							</processing>
							<mapping>
								<update dispatch_type="continuous">
									<gesture_event  type="rotate">
										<property ref="rotate_dtheta" target="rotate"/>
									</gesture_event>
								</update>
							</mapping>
						</Gesture>
						
						<Gesture id="2-finger-rotate" type="rotate">
							<match>
								<action>
									<initial>
										<cluster point_number="2"/>
									</initial>
								</action>
							</match>
							<analysis>
								<algorithm>
									<library module="rotate"/>
									<returns>
										<property id="rotate_dtheta" result="dtheta"/>
									</returns>
								</algorithm>
							</analysis>	
							<mapping>
								<update dispatch_type="continuous">
									<gesture_event  type="rotate">
										<property ref="rotate_dtheta" target="rotate"/>
									</gesture_event>
								</update>
							</mapping>
						</Gesture>
						
						<Gesture id="3-finger-rotate" type="rotate">
							<match>
								<action>
									<initial>
										<cluster point_number="3"/>
									</initial>
								</action>
							</match>
							<analysis>
								<algorithm>
									<library module="rotate"/>
									<returns>
										<property id="rotate_dtheta" result="dtheta"/>
									</returns>
								</algorithm>
							</analysis>	
							<mapping>
								<update>
									<gesture_event  type="rotate">
										<property ref="rotate_dtheta" target="rotate"/>
									</gesture_event>
								</update>
							</mapping>
						</Gesture>
						
						
						<Gesture id="4-finger-rotate" type="rotate">
							<match>
								<action>
									<initial>
										<cluster point_number="4"/>
									</initial>
								</action>
							</match>
							<analysis>
								<algorithm>
									<library module="rotate"/>
									<returns>
										<property id="rotate_dtheta" result="dtheta"/>
									</returns>
								</algorithm>
							</analysis>	
							<mapping>
								<update dispatch_type="continuous">
									<gesture_event  type="rotate">
										<property ref="rotate_dtheta" target="rotate"/>
									</gesture_event>
								</update>
							</mapping>
						</Gesture>
			

			
								<Gesture id="2-finger-scale" type="scale">
									<match>
										<action>
											<initial>
												<cluster point_number="2"/>
											</initial>
										</action>
									</match>
									<analysis>
										<algorithm>
											<library module="scale"/>
											<returns>
												<property ref="scale_dsx" result="ds"/>
												<property ref="scale_dsy" result="ds"/>
											</returns>
										</algorithm>
									</analysis>	
									<mapping>
										<update>
											<gesture_event  type="scale">
												<property ref="scale_dsx" target="scaleX"/>
												<property ref="scale_dsy" target="scaleY"/>
											</gesture_event>
										</update>
									</mapping>
								</Gesture>
								
								<Gesture id="5-finger-scale" type="scale">
									<match>
										<action>
											<initial>
												<cluster point_number="5"/>
											</initial>
										</action>
									</match>
									<analysis>
										<algorithm>
											<library module="scale"/>
											<returns>
												<property ref="scale_dsx" result="ds"/>
												<property ref="scale_dsy" result="ds"/>
											</returns>
										</algorithm>
									</analysis>	
									<mapping>
										<update>
											<gesture_event  type="scale">
												<property ref="scale_dsx" target="scaleX"/>
												<property ref="scale_dsy" target="scaleY"/>
											</gesture_event>
										</update>
									</mapping>
								</Gesture>
	
	</Gesture_set>
	
	
	
	
	
	
		
			
		
	<Gesture_set gesture_set_name="optimized-manipulations">
			
						<Gesture id="n-manipulate" type="manipulate">
							<match>
								<action>
									<initial>
										<cluster point_number="0" point_number_min="1" point_number_max="10"/>
									</initial>
								</action>
							</match>	
							<analysis>
								<algorithm class="kinemetric" type="continuous">
									<library module="manipulate"/>
									<returns>
										<property id="dx" result="dx"/>
										<property id="dy" result="dy"/>
										<property id="dsx" result="ds"/>
										<property id="dsy" result="ds"/>
										<property id="dtheta" result="dtheta"/>
									</returns>
								</algorithm>
							</analysis>	
							<processing>
								<multiply_filter>
									<property ref="dx" active="false"/>
									<property ref="dy" active="false"/>
									<property ref="dsx" active="false" func="linear" factor="0.0044"/>
									<property ref="dsy" active="false" func="linear" factor="0.0044"/>
									<property ref="dtheta" active="false"/>
								</multiply_filter>
							</processing>
							<mapping>
								<update dispatch_type="continuous">
									<gesture_event  type="manipulate">
										<property ref="dx" target="x"/>
										<property ref="dy" target="y"/>
										<property ref="dsx" target="scaleX"/>
										<property ref="dsy" target="scaleY"/>
										<property ref="dtheta" target="rotation"/>
									</gesture_event>
								</update>
							</mapping>
						</Gesture>
						
						
						
						<Gesture id="n-manipulate-inertia" type="manipulate">
							<match>
								<action>
									<initial>
										<cluster point_number="0" point_number_min="1" point_number_max="10"/>
									</initial>
								</action>
							</match>	
							<analysis>
								<algorithm class="kinemetric" type="continuous">
									<library module="manipulate"/>
									<returns>
										<property id="dx" result="dx"/>
										<property id="dy" result="dy"/>
										<property id="dsx" result="ds"/>
										<property id="dsy" result="ds"/>
										<property id="dtheta" result="dtheta"/>
									</returns>
								</algorithm>
							</analysis>	
							<processing>
								<inertial_filter>
									<property ref="dx" active="true" friction="0.9"/>
									<property ref="dy" active="true" friction="0.9"/>
									<property ref="dsx" active="true" friction="0.9"/>
									<property ref="dsy" active="true" friction="0.9"/>
									<property ref="dtheta" active="true" friction="0.9"/>
								</inertial_filter>
								<delta_filter>
									<property ref="dx" delta_filter="false" delta_min="0.01" delta_max="100"/>
									<property ref="dy" delta_filter="false" delta_min="0.01" delta_max="100"/>
									<property ref="dsx" delta_filter="false" delta_min="0.0001" delta_max="1"/>
									<property ref="dsy" delta_filter="false" delta_min="0.0001" delta_max="1"/>
									<property ref="dtheta" delta_filter="false" delta_min="0.01" delta_max="20"/>
								</delta_filter>
							</processing>
							<mapping>
								<update dispatch_type="continuous">
									<gesture_event  type="manipulate">
										<property ref="dx" target="x"/>
										<property ref="dy" target="y"/>
										<property ref="dsx" target="scaleX"/>
										<property ref="dsy" target="scaleY"/>
										<property ref="dtheta" target="rotation"/>
									</gesture_event>
								</update>
							</mapping>
						</Gesture>
						
						
						
						<Gesture id="n-manipulate-inertia-boundary" type="manipulate">
							<match>
								<action>
									<initial>
										<cluster point_number="0" point_number_min="1" point_number_max="10"/>
									</initial>
								</action>
							</match>	
							<analysis>
								<algorithm class="kinemetric" type="continuous">
									<library module="manipulate"/>
									<returns>
										<property id="dx" result="dx"/>
										<property id="dy" result="dy"/>
										<property id="dsx" result="ds"/>
										<property id="dsy" result="ds"/>
										<property id="dtheta" result="dtheta"/>
									</returns>
								</algorithm>
							</analysis>	
							<processing>
								<inertial_filter>
									<property ref="dx" active="true" friction="0.9"/>
									<property ref="dy" active="true" friction="0.9"/>
									<property ref="dsx" active="true" friction="0.9"/>
									<property ref="dsy" active="true" friction="0.9"/>
									<property ref="dtheta" active="true" friction="0.9"/>
								</inertial_filter>
								<delta_filter>
									<property ref="dx" active="true" delta_min="0.05" delta_max="50"/>
									<property ref="dy" active="true" delta_min="0.05" delta_max="50"/>
									<property ref="dsx" active="true" delta_min="0.0001" delta_max="0.5"/>
									<property ref="dsy" active="true" delta_min="0.0001" delta_max="0.5"/>
									<property ref="dtheta" active="false" delta_min="0.01" delta_max="20"/>
								</delta_filter>
								<boundary_filter>
									<property ref="dx" active="true" boundary_min="200" boundary_max="1000"/>
									<property ref="dy" active="true" boundary_min="200" boundary_max="600"/>
									<property ref="dsx" active="true" boundary_min="0.8" boundary_max="2.5"/>
									<property ref="dsy" active="true" boundary_min="0.8" boundary_max="2.5"/>
									<property ref="dtheta" active="false"/>
								</boundary_filter>
							</processing>
							<mapping>
								<update dispatch_type="continuous">
									<gesture_event  type="manipulate">
										<property ref="dx" target="x"/>
										<property ref="dy" target="y"/>
										<property ref="dsx" target="scaleX"/>
										<property ref="dsy" target="scaleY"/>
										<property ref="dtheta" target="rotation"/>
									</gesture_event>
								</update>
							</mapping>
						</Gesture>
			
		</Gesture_set>
			
		
		
		
		
		
		
		
		
		
		
		
		
		
		
			
		<Gesture_set gesture_set_name="conditonal-manipulations">
			
		
									<Gesture id="n-flick" type="flick">
										<comment>The 'n-flick' gesture can be activated by any number of touch points. When a touch down is recognized on a touch object, the velocity and 
										acceleration of the touch points are tracked. If acceleration of the cluster is above the acceleration threshold a flick event is dispatched.</comment>
										<match>
											<action>
												<initial>
													<cluster point_number="0" point_number_min="1" point_number_max="5" acceleration_min="0.5"/>
													<event touch_event="touchEnd"/>
												</initial>
											</action>
										</match>
										<analysis>
											<algorithm class="kinemetric" type="continuous">
												<library module="flick"/>
												<variables>
													<property id="flick_dx" var="etm_ddx" return="etm_dx" var_min="2"/>
													<property id="flick_dy" var="etm_ddy" return="etm_dy" var_min="2"/>
												</variables>
												<returns>
													<property id="flick_dx" result="etm_dx"/>
													<property id="flick_dy" result="etm_dy"/>
												</returns>
											</algorithm>
										</analysis>	
										<mapping>
											<update dispatch_type="discrete" dispatch_mode="cluster_remove" dispatch_reset="cluster_remove">
												<gesture_event  type="flick">
													<property ref="flick_dx" target=""/>
													<property ref="flick_dy" target=""/>
												</gesture_event>
											</update>
										</mapping>
									</Gesture>
									
									
									<Gesture id="n-swipe" type="swipe">
										<comment>The 'n-swipe' gesture can be activated by any number of touch points. When a touch down is recognized on a touch object, the velocity and 
										acceleration of the touch points are tracked. If acceleration of the cluster is below the acceleration threshold a swipe event is dispatched.</comment>
										<match>
											<action>
												<initial>
													<cluster point_number="0" point_number_min="1" point_number_max="5" acceleration_max="0.5"/>
													<event touch_event="touchEnd"/>
												</initial>
											</action>
										</match>
										<analysis>
											<algorithm class="kinemetric" type="continuous">
												<library module="swipe" />
												
												<variables>
													<property id="swipe_dx" var="etm_ddx" return="etm_dx" var_max="1"/>
													<property id="swipe_dy" var="etm_ddy" return="etm_dy" var_max="1"/>
												</variables>
												<returns>
													<property id="swipe_dx" result="etm_dx"/>
													<property id="swipe_dy" result="etm_dy"/>
												</returns>
											</algorithm>
										</analysis>	
										<mapping>
											<update dispatch_type="discrete" dispatch_mode="cluster_remove" dispatch_reset="cluster_remove">
												<gesture_event  type="swipe">
													<property ref="swipe_dx" target=""/>
													<property ref="swipe_dy" target=""/>
												</gesture_event>
											</update>
										</mapping>
									</Gesture>
									
									
									<Gesture id="n-scroll" type="scroll">
									<comment>The 'n-scroll' gesture can be activated by any number of touch points. When a touch down is recognized on a touch object, 
									the average velocity of the touch points are tracked. If velocity of the cluster is above the translation threshold a scroll event 
									is continuously dispatched with inertia.</comment>
										<match>
											<action>
												<initial>
													<cluster point_number="0" point_number_min="0" point_number_max="5" translation_min="1"/>
												</initial>
											</action>
										</match>
										<analysis>
											<algorithm class="kinemetric" type="continuous">
												<library module="scroll"/>
												<variables>
													<property id="scroll_dx" return="etm_dx" var="etm_dx" var_min="1"/>
													<property id="scroll_dy" return="etm_dy" var="etm_dy" var_min="1"/>
												</variables>
												<returns>
													<property id="scroll_dx" result="etm_dx"/>
													<property id="scroll_dy" result="etm_dy"/>
												</returns>
											</algorithm>
										</analysis>	
										<processing>
											<inertial_filter>
												<property ref="scroll_dx" active="true" friction="0.94"/>
												<property ref="scroll_dy" active="true" friction="0.94"/>
											</inertial_filter>
											<delta_filter>
												<property ref="scroll_dx" active="true" delta_min="0.5" delta_max="30"/>
												<property ref="scroll_dy" active="true" delta_min="0.5" delta_max="30"/>
											</delta_filter>
										</processing>
										<mapping>
											<update dispatch_type="continuous">
												<gesture_event  type="scroll">
													<property ref="scroll_dx" target=""/>
													<property ref="scroll_dy" target=""/>
												</gesture_event>
											</update>
										</mapping>
									</Gesture>
	</Gesture_set>
	
	
	
	
	
	
	
	
	
	
	
									
	<Gesture_set gesture_set_name="special-manipulations">		
									
									<Gesture id="3-finger-tilt" type="tilt">
										<match>
											<action>
												<initial>
													<cluster point_number="3" point_number_min="" point_number_max=""/>
												</initial>
											</action>
										</match>
										<analysis>
											<algorithm class="kinemetric" type="continuous">
												<library module="tilt"/>
												<variables>
													<property id="tilt_dx" return="dsx" var="dsx" var_min="0.01"/>
													<property id="tilt_dy" return="dsy" var="dsy" var_min="0.01"/>
												</variables>
												<returns>
													<property id="tilt_dx" result="dsx"/>
													<property id="tilt_dy" result="dsy"/>
												</returns>
											</algorithm>
										</analysis>	
										<mapping>
											<update dispatch_type="continuous">
												<gesture_event  type="tilt">
													<property ref="tilt_dx" target=""/>
													<property ref="tilt_dy" target=""/>
												</gesture_event>
											</update>
										</mapping>
									</Gesture>
									
									
									
									<Gesture id="1-finger-pivot" type="pivot">
										<match>
											<action>
												<initial>
													<cluster point_number="1" point_number_min="1" point_number_max="1"/>
												</initial>
											</action>
										</match>
										<analysis>
											<algorithm class="kinemetric" type="continuous">
												<library module="pivot"/>
												<returns>
													<property id="pivot_dtheta" result="pivot_dtheta"/>
												</returns>
											</algorithm>
										</analysis>	
										<processing>
											<delta_filter>
												<property ref="pivot_dtheta" active="false" delta_min="0.0001" delta_max="1"/>
											</delta_filter>
										</processing>
										<mapping>
											<update dispatch_type="continuous">
												<gesture_event  type="pivot">
													<property ref="pivot_dtheta" target="rotate"/>
												</gesture_event>
											</update>
										</mapping>
									</Gesture>
									
									<Gesture id="1-finger-pivot-inertia" type="pivot">
										<match>
											<action>
												<initial>
													<cluster point_number="1" point_number_min="1" point_number_max="1"/>
												</initial>
											</action>
										</match>
										<analysis>
											<algorithm class="kinemetric" type="continuous">
												<library module="pivot"/>
												<returns>
													<property id="pivot_dtheta" result="pivot_dtheta"/>
												</returns>
											</algorithm>
										</analysis>	
										<processing>
											<inertial_filter>
												<property ref="pivot_dtheta" active="true" friction="0.9"/>
											</inertial_filter>
											<delta_filter>
												<property ref="pivot_dtheta" active="false" delta_min="0.0001" delta_max="1"/>
											</delta_filter>
										</processing>
										<mapping>
											<update dispatch_type="continuous">
												<gesture_event  type="pivot">
													<property ref="pivot_dtheta" target="rotate"/>
												</gesture_event>
											</update>
										</mapping>
									</Gesture>
									
									
									
									<Gesture id="5-finger-orient" type="orient">
										<match>
											<action>
												<initial>
													<cluster point_number="5" point_number_min="" point_number_max=""/>
												</initial>
											</action>
										</match>
										<analysis>
											<algorithm class="kinemetric" type="continuous">
												<library module="orient"/>
												<returns>
													<property id="dx" result="orient_dx"/>
													<property id="dy" result="orient_dy"/>
													<property id="orient_hand" result="hand"/>
													<property id="orient_thumbID" result="thumbID"/>
												</returns>
											</algorithm>
										</analysis>	
										<mapping>
											<update dispatch_type="continuous">
												<gesture_event type="orient">
													<property ref="orient_dx"/>
													<property ref="orient_dy"/>
													<property ref="orient_hand"/>
													<property ref="orient_thumbID"/>
												</gesture_event>
											</update>
										</mapping>
									</Gesture>
			
	</Gesture_set>	
			
	
	
	
	
	
	

	
	<Gesture_set gesture_set_name="n-timeline">
						
						<Gesture id="n-hold" type="hold">
							<match>
								<action>
									<initial>
										<point event_duration_min="500" translation_max="2"/>
										<cluster point_number="0" point_number_min="1" point_number_max="5"/>
									</initial>
								</action>
							</match>	
							<analysis>
								<algorithm>
									<library module="hold"/>
									<returns>
										<property id="hold_x" result="x"/>
										<property id="hold_y" result="y"/>
										<property id="hold_n" result="n"/>
									</returns>
								</algorithm>
							</analysis>	
							<mapping>
								<update dispatch_type="discrete" dispatch_reset="cluster_remove">
									<gesture_event  type="hold">
										<property ref="hold_x"/>
										<property ref="hold_y"/>
										<property ref="hold_n"/>
									</gesture_event>
								</update>
							</mapping>
						</Gesture>
						
						<Gesture id="n-tap" type="tap">
							<match>
								<action>
									<initial>
										<point event_duration_max="200" translation_max="10"/>
										<cluster point_number="0"/>
										<event touch_event="touchEnd"/>
									</initial>
								</action>
							</match>	
							<analysis>
								<algorithm class="temporalmetric" type="discrete">
									<library module="tap"/>
									<returns>
										<property id="tap_x" result="x"/>
										<property id="tap_y" result="y"/>
										<property id="tap_n" result="n"/>
									</returns>
								</algorithm>
							</analysis>	
							<mapping>
								<update dispatch_type="discrete" dispatch_mode="batch" dispatch_interval="200">
									<gesture_event  type="tap">
										<property ref="tap_x"/>
										<property ref="tap_y"/>
										<property ref="tap_n"/>
									</gesture_event>
								</update>
							</mapping>
						</Gesture>
						
						<Gesture id="n-double_tap" type="double_tap">
							<match>
								<action>
									<initial>
										<point event_duration_max="300" interevent_duration_max="300" translation_max="20"/>
										<cluster point_number="0"/>
										<event gesture_event="tap"/>
									</initial>
								</action>
							</match>	
							<analysis>
								<algorithm class="temporalmetric" type="discrete">
									<library module="double_tap"/>
									<returns>
										<property id="double_tap_x" result="x"/>
										<property id="double_tap_y" result="y"/>
										<property id="double_tap_n" result="n"/>
									</returns>
								</algorithm>
							</analysis>	
							<mapping>
								<update dispatch_type="discrete" dispatch_mode="batch" dispatch_interval="200">
									<gesture_event  type="double_tap">
										<property ref="double_tap_x"/>
										<property ref="double_tap_y"/>
										<property ref="double_tap_n"/>
									</gesture_event>
								</update>
							</mapping>
						</Gesture>
						
						<Gesture id="n-triple_tap" type="triple_tap">
							<match>
								<action>
									<initial>
										<point event_duration_max="300" interevent_duration_max="300" translation_max="20"/>
										<cluster point_number="0"/>
										<event gesture_event="tap" />
									</initial>
								</action>
							</match>	
							<analysis>
								<algorithm class="temporalmetric" type="discrete">
									<library module="triple_tap"/>
									<returns>
										<property id="triple_tap_x" result="x"/>
										<property id="triple_tap_y" result="y"/>
										<property id="triple_tap_n" result="n"/>
									</returns>
								</algorithm>
							</analysis>
							<mapping>
								<update dispatch_type="discrete" dispatch_mode="batch" dispatch_interval="200">
									<gesture_event  type="tripple_tap">
										<property ref="triple_tap_x"/>
										<property ref="triple_tap_y"/>
										<property ref="triple_tap_n"/>
									</gesture_event>
								</update>
							</mapping>
						</Gesture>

		</Gesture_set>
			
		
		
		
		
		
		
		<Gesture_set gesture_set_name="custom-timeline">
						
						<Gesture id="3-finger-hold" type="hold">
							<match>
								<action>
									<initial>
										<point event_duration_min="500" translation_max="2"/>
										<cluster point_number="3"/>
									</initial>
								</action>
							</match>	
							<analysis>
								<algorithm>
									<library module="hold"/>
									<returns>
										<property id="hold_x" result="x"/>
										<property id="hold_y" result="y"/>
										<property id="hold_n" result="n"/>
									</returns>
								</algorithm>
							</analysis>	
							<mapping>
								<update dispatch_type="discrete" dispatch_reset="cluster_remove">
									<gesture_event type="hold">
										<property ref="hold_x"/>
										<property ref="hold_y"/>
										<property ref="hold_n"/>
									</gesture_event>
								</update>
							</mapping>
						</Gesture>
						
						<Gesture id="3-finger-tap" type="tap">
							<match>
								<action>
									<initial>
										<point event_duration_max="200" translation_max="10"/>
										<cluster point_number="3"/>
										<event touch_event="touchEnd"/>
									</initial>
								</action>
							</match>	
							<analysis>
								<algorithm class="temporalmetric" type="discrete">
									<library module="tap"/>
									<returns>
										<property id="tap_x" result="x"/>
										<property id="tap_y" result="y"/>
										<property id="tap_n" result="n"/>
									</returns>
								</algorithm>
							</analysis>	
							<mapping>
								<update dispatch_type="discrete">
									<gesture_event type="tap">
										<property ref="tap_x"/>
										<property ref="tap_y"/>
										<property ref="tap_n"/>
									</gesture_event>
								</update>
							</mapping>
						</Gesture>
						
						<Gesture id="1-finger-double_tap" type="double_tap">
							<match>
								<action>
									<initial>
										<point event_duration_max="300" interevent_duration_max="300" translation_max="20"/>
										<cluster point_number="1"/>
										<event gesture_event="tap"/>
									</initial>
								</action>
							</match>	
							<analysis>
								<algorithm class="temporalmetric" type="discrete">
									<library module="double_tap"/>
									<returns>
										<property id="double_tap_x" result="x"/>
										<property id="double_tap_y" result="y"/>
										<property id="double_tap_n" result="n"/>
									</returns>
								</algorithm>
							</analysis>	
							<mapping>
								<update dispatch_type="discrete" dispatch_mode="batch" dispatch_interval="200">
									<gesture_event type="double_tap">
										<property ref="double_tap_x"/>
										<property ref="double_tap_y"/>
										<property ref="double_tap_n"/>
									</gesture_event>
								</update>
							</mapping>
						</Gesture>
						
						<Gesture id="triple_tap" type="triple_tap">
							<match>
								<action>
									<initial>
										<point event_duration_max="300" interevent_duration_max="300" translation_max="20"/>
										<event gesture_event="tap"/>
									</initial>
								</action>
							</match>	
							<analysis>
								<algorithm class="temporalmetric" type="discrete">
									<library module="triple_tap"/>
									<returns>
										<property id="triple_tap_x" result="x"/>
										<property id="triple_tap_y" result="y"/>
										<property id="triple_tap_n" result="n"/>
									</returns>
								</algorithm>
							</analysis>
							<mapping>
								<update dispatch_type="discrete" dispatch_mode="batch" dispatch_interval="200">
									<gesture_event type="triple_tap">
										<property ref="triple_tap_x"/>
										<property ref="triple_tap_y"/>
										<property ref="triple_tap_n"/>
									</gesture_event>
								</update>
							</mapping>
						</Gesture>
						
						<Gesture id="1-finger-triple_tap" type="triple_tap">
							<match>
								<action>
									<initial>
										<point event_duration_max="300" interevent_duration_max="300" translation_max="20"/>
										<cluster point_number="1"/>
										<event gesture_event="tap"/>
									</initial>
								</action>
							</match>	
							<analysis>
								<algorithm class="temporalmetric" type="discrete">
									<library module="triple_tap"/>
									<returns>
										<property id="triple_tap_x" result="x"/>
										<property id="triple_tap_y" result="y"/>
										<property id="triple_tap_n" result="n"/>
									</returns>
								</algorithm>
							</analysis>
							<mapping>
								<update dispatch_type="discrete" dispatch_mode="batch" dispatch_interval="200">
									<gesture_event type="triple_tap">
										<property ref="triple_tap_x"/>
										<property ref="triple_tap_y"/>
										<property ref="triple_tap_n"/>
									</gesture_event>
								</update>
							</mapping>
						</Gesture>
			
		</Gesture_set>
		
		
		
		
		
		<Gesture_set id="stroke_lib_test">	
			
					<Gesture id="spiral_right" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.5233415233415233, y=0.40786240786240785),(x=0.4619164619164619, y=0.4103194103194103),(x=0.4054054054054054, y=0.43734643734643736),(x=0.3587223587223587, y=0.48157248157248156),(x=0.343980343980344, y=0.542997542997543),(x=0.36363636363636365, y=0.601965601965602),(x=0.4054054054054054, y=0.6461916461916462),(x=0.45945945945945943, y=0.6756756756756757),(x=0.5208845208845209, y=0.683046683046683),(x=0.5823095823095823, y=0.6756756756756757),(x=0.6388206388206388, y=0.6486486486486487),(x=0.687960687960688, y=0.6093366093366093),(x=0.7199017199017199, y=0.5528255528255528),(x=0.742014742014742, y=0.49385749385749383),(x=0.7469287469287469, y=0.4324324324324324),(x=0.7444717444717445, y=0.371007371007371),(x=0.7321867321867321, y=0.3095823095823096),(x=0.7125307125307125, y=0.24815724815724816),(x=0.6855036855036855, y=0.19164619164619165),(x=0.6486486486486487, y=0.14004914004914004),(x=0.6044226044226044, y=0.09090909090909091),(x=0.5528255528255528, y=0.051597051597051594),(x=0.4963144963144963, y=0.02457002457002457),(x=0.4348894348894349, y=0.007371007371007371),(x=0.37346437346437344, y=0),(x=0.312039312039312, y=0.004914004914004914),(x=0.25061425061425063, y=0.02457002457002457),(x=0.19656019656019655, y=0.05651105651105651),(x=0.14987714987714987, y=0.09828009828009827),(x=0.11056511056511056, y=0.14742014742014742),(x=0.07616707616707616, y=0.19901719901719903),(x=0.04668304668304668, y=0.25307125307125306),(x=0.02457002457002457, y=0.312039312039312),(x=0.009828009828009828, y=0.37346437346437344),(x=0.002457002457002457, y=0.4348894348894349),(x=0, y=0.4963144963144963),(x=0.002457002457002457, y=0.5577395577395577),(x=0.014742014742014743, y=0.6191646191646192),(x=0.036855036855036855, y=0.6781326781326781),(x=0.06388206388206388, y=0.7346437346437347),(x=0.09582309582309582, y=0.7862407862407862),(x=0.13513513513513514, y=0.8304668304668305),(x=0.18181818181818182, y=0.8722358722358722),(x=0.23095823095823095, y=0.9066339066339066),(x=0.28255528255528256, y=0.941031941031941),(x=0.33906633906633904, y=0.9656019656019655),(x=0.39803439803439805, y=0.9852579852579852),(x=0.45945945945945943, y=0.995085995085995),(x=0.5208845208845209, y=1),(x=0.5823095823095823, y=0.995085995085995)"/>
									<cluster point_number="1"/>
									<event touchEvent="TouchEnd"/>
								</initial>
							</action>
						</match>	
						<analysis>
							<algorithm class="vectormetric" type="continuous">
								<library module="stroke"/>
								<returns>
									<property id="stroke_x" result="x"/>
									<property id="stroke_y" result="y"/>
									<property id="stroke_prob" result="prob"/>
								</returns>
							</algorithm>
						</analysis>	
						<mapping>
							<update dispatch_type="discrete" dispatch_mode="cluster_remove">
								<gesture_event type="stroke_shape">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
			<Gesture id="spiral_left" type="stroke">
				<match>
					<action>
						<initial>	
							<point path_pts="(x=0.30000000000000004, y=0.37380952380952387),(x=0.3595238095238096, y=0.36904761904761907),(x=0.41190476190476194, y=0.39761904761904765),(x=0.44523809523809527, y=0.44761904761904764),(x=0.45000000000000007, y=0.5071428571428572),(x=0.43333333333333335, y=0.5666666666666668),(x=0.39047619047619053, y=0.6095238095238096),(x=0.33571428571428574, y=0.6380952380952382),(x=0.2761904761904762, y=0.6571428571428573),(x=0.21666666666666667, y=0.6642857142857144),(x=0.15714285714285717, y=0.6476190476190476),(x=0.10238095238095239, y=0.6166666666666667),(x=0.0642857142857143, y=0.5690476190476191),(x=0.03333333333333334, y=0.5166666666666667),(x=0.014285714285714287, y=0.45952380952380956),(x=0.002380952380952381, y=0.4),(x=0, y=0.3404761904761905),(x=0.004761904761904762, y=0.28095238095238095),(x=0.02142857142857143, y=0.22142857142857145),(x=0.045238095238095244, y=0.1642857142857143),(x=0.08333333333333334, y=0.11666666666666668),(x=0.1285714285714286, y=0.0761904761904762),(x=0.18095238095238098, y=0.045238095238095244),(x=0.2380952380952381, y=0.02142857142857143),(x=0.29761904761904767, y=0.0071428571428571435),(x=0.35714285714285715, y=0),(x=0.4166666666666667, y=0),(x=0.4761904761904762, y=0.0071428571428571435),(x=0.5333333333333334, y=0.02380952380952381),(x=0.5880952380952381, y=0.04761904761904762),(x=0.6357142857142858, y=0.08095238095238096),(x=0.680952380952381, y=0.12142857142857144),(x=0.7190476190476192, y=0.16904761904761906),(x=0.7476190476190477, y=0.22142857142857145),(x=0.7690476190476191, y=0.2761904761904762),(x=0.7880952380952382, y=0.33333333333333337),(x=0.7976190476190477, y=0.3928571428571429),(x=0.8023809523809524, y=0.45238095238095244),(x=0.7976190476190477, y=0.511904761904762),(x=0.7880952380952382, y=0.5714285714285715),(x=0.7738095238095238, y=0.630952380952381),(x=0.7523809523809525, y=0.6880952380952382),(x=0.7285714285714286, y=0.7428571428571429),(x=0.692857142857143, y=0.7904761904761906),(x=0.6523809523809524, y=0.8357142857142857),(x=0.6095238095238096, y=0.8785714285714287),(x=0.5619047619047619, y=0.9142857142857144),(x=0.5095238095238096, y=0.9476190476190477),(x=0.4571428571428572, y=0.9761904761904763),(x=0.39761904761904765, y=0.992857142857143),(x=0.3380952380952381, y=1),(x=0.2785714285714286, y=1),(x=0.21904761904761907, y=1),(x=0.15952380952380954, y=0.992857142857143)"/>						<cluster point_number="1"/>
							<event touchEvent="TouchEnd"/>
						</initial>
					</action>
				</match>
				<analysis>
					<algorithm class="vectormetric" type="continuous">
						<library module="stroke"/>
						<returns>
							<property id="stroke_x" result=""/>
							<property id="stroke_y" result=""/>
							<property id="stroke_prob" result=""/>
						</returns>
					</algorithm>
				</analysis>
				<mapping>
					<update dispatch_type="discrete" dispatch_mode="cluster_remove">
						<gesture_event type="stroke_shape">
							<property ref="stroke_x"/>
							<property ref="stroke_y"/>
							<property ref="stroke_prob"/>
						</gesture_event>
					</update>
				</mapping>
			</Gesture>
			
			<Gesture id="letter_alpha" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=1, y=0.008571428571428572),(x=0.9285714285714286, y=0),(x=0.8628571428571429, y=0.03428571428571429),(x=0.8085714285714286, y=0.08571428571428572),(x=0.7657142857142857, y=0.14285714285714285),(x=0.7228571428571429, y=0.20285714285714285),(x=0.68, y=0.26),(x=0.6371428571428571, y=0.32),(x=0.5914285714285714, y=0.3742857142857143),(x=0.5428571428571428, y=0.42857142857142855),(x=0.48857142857142855, y=0.48),(x=0.4342857142857143, y=0.5257142857142857),(x=0.37142857142857144, y=0.5628571428571428),(x=0.3057142857142857, y=0.5971428571428572),(x=0.23714285714285716, y=0.6171428571428571),(x=0.1657142857142857, y=0.6057142857142858),(x=0.10285714285714286, y=0.5685714285714286),(x=0.054285714285714284, y=0.5114285714285715),(x=0.022857142857142857, y=0.44285714285714284),(x=0.005714285714285714, y=0.37142857142857144),(x=0, y=0.3),(x=0.008571428571428572, y=0.22857142857142856),(x=0.03428571428571429, y=0.16),(x=0.07714285714285714, y=0.10285714285714286),(x=0.13142857142857142, y=0.05714285714285714),(x=0.19714285714285715, y=0.022857142857142857),(x=0.26857142857142857, y=0.005714285714285714),(x=0.34, y=0.008571428571428572),(x=0.4085714285714286, y=0.03142857142857143),(x=0.4714285714285714, y=0.06857142857142857),(x=0.5257142857142857, y=0.11142857142857143),(x=0.5714285714285714, y=0.1657142857142857),(x=0.6114285714285714, y=0.22285714285714286),(x=0.6457142857142857, y=0.28285714285714286),(x=0.6857142857142857, y=0.34285714285714286),(x=0.7285714285714285, y=0.4),(x=0.7714285714285715, y=0.4542857142857143),(x=0.82, y=0.5057142857142857),(x=0.8771428571428571, y=0.5514285714285714),(x=0.9428571428571428, y=0.5771428571428572)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="letter_O" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.6122448979591837, y=0.008746355685131196),(x=0.5393586005830904, y=0),(x=0.46647230320699706, y=0),(x=0.3935860058309038, y=0.008746355685131196),(x=0.3206997084548105, y=0.03206997084548105),(x=0.2536443148688047, y=0.0641399416909621),(x=0.18950437317784255, y=0.10204081632653061),(x=0.13702623906705538, y=0.15160349854227406),(x=0.09037900874635568, y=0.2099125364431487),(x=0.0553935860058309, y=0.27405247813411077),(x=0.029154518950437316, y=0.34402332361516036),(x=0.008746355685131196, y=0.4169096209912536),(x=0, y=0.4897959183673469),(x=0, y=0.5626822157434402),(x=0.0058309037900874635, y=0.6355685131195336),(x=0.026239067055393587, y=0.7084548104956269),(x=0.052478134110787174, y=0.7755102040816326),(x=0.09329446064139942, y=0.8367346938775511),(x=0.13994169096209913, y=0.892128279883382),(x=0.19533527696793002, y=0.9358600583090378),(x=0.2594752186588921, y=0.9708454810495627),(x=0.3294460641399417, y=0.9941690962099126),(x=0.40233236151603496, y=1),(x=0.4752186588921283, y=1),(x=0.5481049562682215, y=0.9854227405247813),(x=0.6180758017492711, y=0.9620991253644314),(x=0.685131195335277, y=0.9329446064139941),(x=0.749271137026239, y=0.8950437317784257),(x=0.8046647230320699, y=0.8483965014577259),(x=0.8542274052478134, y=0.793002915451895),(x=0.8979591836734694, y=0.7317784256559766),(x=0.9271137026239067, y=0.6647230320699709),(x=0.9504373177842566, y=0.5947521865889213),(x=0.9591836734693877, y=0.521865889212828),(x=0.9533527696793003, y=0.4489795918367347),(x=0.9416909620991254, y=0.3760932944606414),(x=0.9154518950437318, y=0.3032069970845481),(x=0.880466472303207, y=0.23615160349854228),(x=0.8425655976676385, y=0.16909620991253643),(x=0.7959183673469388, y=0.10787172011661808),(x=0.7405247813411079, y=0.0553935860058309),(x=0.6705539358600583, y=0.026239067055393587),(x=0.597667638483965, y=0.014577259475218658)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>

	</Gesture_set>
	
	
	
	
	
	
	
	
	
	
	
	<Gesture_set id="stroke_letter_uppercase">
		<comment>This is a set of uppercase letters of the English alphabet</comment>
		<Gesture id="letter_D" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.00923076923076923, y=1),(x=0.00923076923076923, y=0.9230769230769231),(x=0.00923076923076923, y=0.8461538461538461),(x=0.00923076923076923, y=0.7692307692307693),(x=0.00923076923076923, y=0.6923076923076923),(x=0.006153846153846154, y=0.6153846153846154),(x=0.006153846153846154, y=0.5384615384615384),(x=0.003076923076923077, y=0.46153846153846156),(x=0, y=0.38461538461538464),(x=0, y=0.3076923076923077),(x=0, y=0.23076923076923078),(x=0, y=0.15384615384615385),(x=0.003076923076923077, y=0.07692307692307693),(x=0.055384615384615386, y=0.015384615384615385),(x=0.13230769230769232, y=0.003076923076923077),(x=0.20923076923076922, y=0),(x=0.28615384615384615, y=0.003076923076923077),(x=0.3630769230769231, y=0.021538461538461538),(x=0.4369230769230769, y=0.046153846153846156),(x=0.5076923076923077, y=0.07384615384615384),(x=0.5723076923076923, y=0.11384615384615385),(x=0.6338461538461538, y=0.16),(x=0.6861538461538461, y=0.2153846153846154),(x=0.7292307692307692, y=0.27692307692307694),(x=0.7630769230769231, y=0.3476923076923077),(x=0.7846153846153846, y=0.42153846153846153),(x=0.7846153846153846, y=0.49846153846153846),(x=0.7723076923076924, y=0.5753846153846154),(x=0.7507692307692307, y=0.6523076923076923),(x=0.7138461538461538, y=0.72),(x=0.6646153846153846, y=0.7815384615384615),(x=0.6092307692307692, y=0.8369230769230769),(x=0.5446153846153846, y=0.8830769230769231),(x=0.47384615384615386, y=0.92),(x=0.4, y=0.9507692307692308),(x=0.3230769230769231, y=0.9723076923076923),(x=0.24615384615384617, y=0.9876923076923076),(x=0.16923076923076924, y=0.9907692307692307),(x=0.09230769230769231, y=0.9907692307692307),(x=0.015384615384615385, y=0.9784615384615385)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_G" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.6422976501305483, y=0.03655352480417755),(x=0.5796344647519582, y=0.00783289817232376),(x=0.5143603133159269, y=0),(x=0.4490861618798956, y=0.005221932114882507),(x=0.38381201044386426, y=0.020887728459530026),(x=0.32114882506527415, y=0.04699738903394256),(x=0.26109660574412535, y=0.08093994778067885),(x=0.20887728459530025, y=0.1227154046997389),(x=0.1566579634464752, y=0.1671018276762402),(x=0.11488250652741515, y=0.2193211488250653),(x=0.07571801566579635, y=0.2741514360313316),(x=0.04699738903394256, y=0.3342036553524804),(x=0.02349869451697128, y=0.3968668407310705),(x=0.00783289817232376, y=0.46214099216710186),(x=0, y=0.5274151436031331),(x=0, y=0.5926892950391645),(x=0.013054830287206266, y=0.6579634464751958),(x=0.03133159268929504, y=0.720626631853786),(x=0.06005221932114883, y=0.7806788511749347),(x=0.09660574412532637, y=0.835509138381201),(x=0.13838120104438642, y=0.8825065274151436),(x=0.185378590078329, y=0.9268929503916449),(x=0.24281984334203655, y=0.95822454308094),(x=0.3028720626631854, y=0.97911227154047),(x=0.3681462140992167, y=0.9921671018276762),(x=0.43342036553524804, y=1),(x=0.49869451697127937, y=1),(x=0.5639686684073107, y=0.9921671018276762),(x=0.6292428198433421, y=0.9817232375979112),(x=0.6919060052219321, y=0.9634464751958225),(x=0.6919060052219321, y=0.8981723237597912),(x=0.6866840731070496, y=0.8328981723237598),(x=0.6788511749347259, y=0.7676240208877285),(x=0.6762402088772846, y=0.7023498694516971),(x=0.6736292428198434, y=0.6370757180156658),(x=0.6553524804177546, y=0.5744125326370757),(x=0.5900783289817233, y=0.5744125326370757),(x=0.5248041775456919, y=0.5718015665796344),(x=0.4595300261096606, y=0.5718015665796344),(x=0.39425587467362927, y=0.5718015665796344),(x=0.3289817232375979, y=0.577023498694517)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_F" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.8898809523809523, y=0.002976190476190476),(x=0.8154761904761905, y=0.002976190476190476),(x=0.7410714285714285, y=0.002976190476190476),(x=0.6666666666666666, y=0.002976190476190476),(x=0.5922619047619048, y=0.002976190476190476),(x=0.5178571428571428, y=0.002976190476190476),(x=0.44345238095238093, y=0.002976190476190476),(x=0.369047619047619, y=0),(x=0.29464285714285715, y=0),(x=0.22023809523809523, y=0),(x=0.14583333333333331, y=0),(x=0.07142857142857142, y=0.008928571428571428),(x=0, y=0.03273809523809523),(x=0.005952380952380952, y=0.10714285714285714),(x=0.008928571428571428, y=0.18154761904761904),(x=0.008928571428571428, y=0.25595238095238093),(x=0.011904761904761904, y=0.33035714285714285),(x=0.011904761904761904, y=0.40476190476190477),(x=0.011904761904761904, y=0.47916666666666663),(x=0.01488095238095238, y=0.5535714285714285),(x=0.017857142857142856, y=0.6279761904761905),(x=0.017857142857142856, y=0.7023809523809523),(x=0.020833333333333332, y=0.7767857142857142),(x=0.020833333333333332, y=0.8511904761904762),(x=0.017857142857142856, y=0.925595238095238),(x=0.011904761904761904, y=1)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_A" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0.9565217391304348),(x=0.05434782608695652, y=0.8840579710144928),(x=0.10144927536231885, y=0.8043478260869565),(x=0.14855072463768115, y=0.7246376811594203),(x=0.1956521739130435, y=0.644927536231884),(x=0.2427536231884058, y=0.5615942028985508),(x=0.2898550724637681, y=0.4818840579710145),(x=0.3333333333333333, y=0.39855072463768115),(x=0.3804347826086957, y=0.31884057971014496),(x=0.42391304347826086, y=0.23550724637681159),(x=0.4746376811594203, y=0.15942028985507248),(x=0.5217391304347826, y=0.07971014492753624),(x=0.5652173913043478, y=0),(x=0.6195652173913043, y=0.07246376811594203),(x=0.6521739130434783, y=0.15942028985507248),(x=0.677536231884058, y=0.2463768115942029),(x=0.713768115942029, y=0.32971014492753625),(x=0.7463768115942029, y=0.41304347826086957),(x=0.782608695652174, y=0.4963768115942029),(x=0.8188405797101449, y=0.5797101449275363),(x=0.855072463768116, y=0.6630434782608696),(x=0.8913043478260869, y=0.7463768115942029),(x=0.9239130434782609, y=0.8333333333333334),(x=0.9601449275362319, y=0.9166666666666666),(x=0.9963768115942029, y=1)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_C" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.7181208053691275, y=0.2550335570469799),(x=0.6778523489932886, y=0.17785234899328858),(x=0.6208053691275167, y=0.11409395973154363),(x=0.5503355704697986, y=0.06375838926174497),(x=0.47315436241610737, y=0.026845637583892617),(x=0.3926174496644295, y=0.003355704697986577),(x=0.3087248322147651, y=0),(x=0.22818791946308725, y=0.02348993288590604),(x=0.15771812080536912, y=0.07046979865771812),(x=0.10067114093959731, y=0.13087248322147652),(x=0.05704697986577181, y=0.2046979865771812),(x=0.026845637583892617, y=0.28523489932885904),(x=0.006711409395973154, y=0.36912751677852346),(x=0, y=0.45302013422818793),(x=0.003355704697986577, y=0.5369127516778524),(x=0.020134228187919462, y=0.6208053691275167),(x=0.0436241610738255, y=0.7013422818791946),(x=0.08053691275167785, y=0.7785234899328859),(x=0.12416107382550336, y=0.8523489932885906),(x=0.17785234899328858, y=0.912751677852349),(x=0.2483221476510067, y=0.9630872483221476),(x=0.32550335570469796, y=0.9932885906040269),(x=0.4093959731543624, y=1),(x=0.49328859060402686, y=0.9832214765100671),(x=0.5671140939597316, y=0.9395973154362416),(x=0.6342281879194631, y=0.889261744966443),(x=0.6879194630872483, y=0.825503355704698),(x=0.7382550335570469, y=0.7583892617449665)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_B" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.014326647564469913, y=0.9255014326647564),(x=0.011461318051575931, y=0.8538681948424068),(x=0.011461318051575931, y=0.7822349570200573),(x=0.011461318051575931, y=0.7106017191977078),(x=0.008595988538681949, y=0.6389684813753581),(x=0.0057306590257879654, y=0.5673352435530086),(x=0.0028653295128939827, y=0.49570200573065903),(x=0, y=0.42406876790830944),(x=0, y=0.35243553008595985),(x=0.0028653295128939827, y=0.2808022922636103),(x=0.017191977077363897, y=0.20916905444126074),(x=0.04297994269340974, y=0.14040114613180515),(x=0.0830945558739255, y=0.07736389684813753),(x=0.13753581661891118, y=0.025787965616045846),(x=0.20630372492836677, y=0),(x=0.27793696275071633, y=0),(x=0.3438395415472779, y=0.028653295128939826),(x=0.3982808022922636, y=0.07449856733524356),(x=0.43266475644699137, y=0.14040114613180515),(x=0.44412607449856734, y=0.21203438395415472),(x=0.43266475644699137, y=0.2836676217765043),(x=0.3954154727793696, y=0.3467048710601719),(x=0.3438395415472779, y=0.3982808022922636),(x=0.2836676217765043, y=0.4383954154727794),(x=0.2148997134670487, y=0.4699140401146132),(x=0.1489971346704871, y=0.501432664756447),(x=0.22063037249283668, y=0.492836676217765),(x=0.2922636103151862, y=0.504297994269341),(x=0.36103151862464183, y=0.5300859598853868),(x=0.42406876790830944, y=0.5644699140401146),(x=0.4813753581661891, y=0.6103151862464183),(x=0.5243553008595988, y=0.667621776504298),(x=0.5501432664756447, y=0.7363896848137536),(x=0.5472779369627507, y=0.8080229226361031),(x=0.5157593123209169, y=0.8739255014326647),(x=0.4613180515759312, y=0.9226361031518624),(x=0.3982808022922636, y=0.9598853868194842),(x=0.32951289398280803, y=0.98567335243553),(x=0.25787965616045844, y=0.994269340974212),(x=0.18624641833810887, y=1),(x=0.1146131805157593, y=0.997134670487106)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_M" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0.7565632458233891),(x=0.03102625298329356, y=0.7016706443914081),(x=0.05489260143198091, y=0.6443914081145585),(x=0.07875894988066826, y=0.5871121718377088),(x=0.10023866348448687, y=0.5298329355608592),(x=0.12171837708830549, y=0.4725536992840096),(x=0.1431980906921241, y=0.4128878281622912),(x=0.162291169451074, y=0.3532219570405728),(x=0.18138424821002389, y=0.2959427207637232),(x=0.1957040572792363, y=0.2362768496420048),(x=0.21241050119331742, y=0.1766109785202864),(x=0.22911694510739858, y=0.11694510739856802),(x=0.24582338902147974, y=0.057279236276849645),(x=0.2649164677804296, y=0),(x=0.2983293556085919, y=0.050119331742243436),(x=0.31980906921241053, y=0.10501193317422435),(x=0.34128878281622915, y=0.15990453460620527),(x=0.36276849642004777, y=0.21479713603818618),(x=0.3866348448687351, y=0.26968973747016706),(x=0.4152744630071599, y=0.32219570405727926),(x=0.44630071599045346, y=0.3747016706443914),(x=0.4797136038186158, y=0.42482100238663484),(x=0.5155131264916468, y=0.37708830548926014),(x=0.5441527446300716, y=0.324582338902148),(x=0.5727923627684964, y=0.2720763723150358),(x=0.60381861575179, y=0.21957040572792363),(x=0.6324582338902148, y=0.16467780429594273),(x=0.6587112171837709, y=0.10978520286396182),(x=0.6897374701670644, y=0.057279236276849645),(x=0.7183770883054893, y=0.00477326968973747),(x=0.7422434367541767, y=0.05966587112171838),(x=0.7613365155131265, y=0.11694510739856802),(x=0.7804295942720764, y=0.17422434367541767),(x=0.7995226730310263, y=0.2315035799522673),(x=0.8210023866348449, y=0.2863961813842482),(x=0.8424821002386635, y=0.34128878281622915),(x=0.8639618138424822, y=0.39856801909307876),(x=0.8854415274463008, y=0.45584725536992843),(x=0.9069212410501194, y=0.513126491646778),(x=0.9307875894988067, y=0.568019093078759),(x=0.9522673031026253, y=0.6252983293556086),(x=0.9761336515513127, y=0.6801909307875895),(x=1, y=0.7350835322195705)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_L" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.0024330900243309003, y=0),(x=0, y=0.06082725060827251),(x=0, y=0.12165450121654502),(x=0, y=0.18248175182481752),(x=0.0024330900243309003, y=0.24330900243309003),(x=0.0024330900243309003, y=0.30413625304136255),(x=0.0024330900243309003, y=0.36496350364963503),(x=0.0024330900243309003, y=0.4257907542579076),(x=0.0024330900243309003, y=0.48661800486618007),(x=0.0072992700729927005, y=0.5474452554744526),(x=0.009732360097323601, y=0.6082725060827251),(x=0.014598540145985401, y=0.6690997566909976),(x=0.019464720194647202, y=0.7299270072992701),(x=0.024330900243309004, y=0.7907542579075426),(x=0.024330900243309004, y=0.8515815085158152),(x=0.024330900243309004, y=0.9124087591240876),(x=0.029197080291970802, y=0.9732360097323601),(x=0.08759124087591241, y=0.9902676399026764),(x=0.14841849148418493, y=0.9927007299270073),(x=0.20924574209245742, y=0.9927007299270073),(x=0.27007299270072993, y=0.9927007299270073),(x=0.3309002433090024, y=0.9902676399026764),(x=0.39172749391727496, y=0.9902676399026764),(x=0.45255474452554745, y=0.9902676399026764),(x=0.51338199513382, y=0.9951338199513382),(x=0.5742092457420924, y=0.9975669099756691),(x=0.635036496350365, y=1),(x=0.6958637469586375, y=1)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_O" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.6122448979591837, y=0.008746355685131196),(x=0.5393586005830904, y=0),(x=0.46647230320699706, y=0),(x=0.3935860058309038, y=0.008746355685131196),(x=0.3206997084548105, y=0.03206997084548105),(x=0.2536443148688047, y=0.0641399416909621),(x=0.18950437317784255, y=0.10204081632653061),(x=0.13702623906705538, y=0.15160349854227406),(x=0.09037900874635568, y=0.2099125364431487),(x=0.0553935860058309, y=0.27405247813411077),(x=0.029154518950437316, y=0.34402332361516036),(x=0.008746355685131196, y=0.4169096209912536),(x=0, y=0.4897959183673469),(x=0, y=0.5626822157434402),(x=0.0058309037900874635, y=0.6355685131195336),(x=0.026239067055393587, y=0.7084548104956269),(x=0.052478134110787174, y=0.7755102040816326),(x=0.09329446064139942, y=0.8367346938775511),(x=0.13994169096209913, y=0.892128279883382),(x=0.19533527696793002, y=0.9358600583090378),(x=0.2594752186588921, y=0.9708454810495627),(x=0.3294460641399417, y=0.9941690962099126),(x=0.40233236151603496, y=1),(x=0.4752186588921283, y=1),(x=0.5481049562682215, y=0.9854227405247813),(x=0.6180758017492711, y=0.9620991253644314),(x=0.685131195335277, y=0.9329446064139941),(x=0.749271137026239, y=0.8950437317784257),(x=0.8046647230320699, y=0.8483965014577259),(x=0.8542274052478134, y=0.793002915451895),(x=0.8979591836734694, y=0.7317784256559766),(x=0.9271137026239067, y=0.6647230320699709),(x=0.9504373177842566, y=0.5947521865889213),(x=0.9591836734693877, y=0.521865889212828),(x=0.9533527696793003, y=0.4489795918367347),(x=0.9416909620991254, y=0.3760932944606414),(x=0.9154518950437318, y=0.3032069970845481),(x=0.880466472303207, y=0.23615160349854228),(x=0.8425655976676385, y=0.16909620991253643),(x=0.7959183673469388, y=0.10787172011661808),(x=0.7405247813411079, y=0.0553935860058309),(x=0.6705539358600583, y=0.026239067055393587),(x=0.597667638483965, y=0.014577259475218658)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_N" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.0036363636363636364, y=1),(x=0, y=0.9090909090909091),(x=0, y=0.8181818181818182),(x=0, y=0.7272727272727273),(x=0.007272727272727273, y=0.6363636363636364),(x=0.01090909090909091, y=0.5454545454545454),(x=0.014545454545454545, y=0.45454545454545453),(x=0.02181818181818182, y=0.36363636363636365),(x=0.02181818181818182, y=0.2727272727272727),(x=0.02909090909090909, y=0.18181818181818182),(x=0.02909090909090909, y=0.09090909090909091),(x=0.03636363636363636, y=0),(x=0.10545454545454545, y=0.05454545454545454),(x=0.16727272727272727, y=0.12),(x=0.2290909090909091, y=0.18545454545454546),(x=0.2872727272727273, y=0.2545454545454545),(x=0.3490909090909091, y=0.3236363636363636),(x=0.4109090909090909, y=0.3927272727272727),(x=0.4727272727272727, y=0.4618181818181818),(x=0.5309090909090909, y=0.5272727272727272),(x=0.5890909090909091, y=0.6),(x=0.6472727272727272, y=0.6690909090909091),(x=0.7054545454545454, y=0.7345454545454545),(x=0.7672727272727272, y=0.8036363636363636),(x=0.8290909090909091, y=0.8690909090909091),(x=0.8909090909090909, y=0.9381818181818182),(x=0.96, y=1),(x=0.9745454545454545, y=0.9090909090909091),(x=0.9781818181818182, y=0.8181818181818182),(x=0.9781818181818182, y=0.7272727272727273),(x=0.9781818181818182, y=0.6363636363636364),(x=0.9781818181818182, y=0.5454545454545454),(x=0.9745454545454545, y=0.45454545454545453),(x=0.9709090909090909, y=0.36363636363636365),(x=0.9709090909090909, y=0.2727272727272727),(x=0.9709090909090909, y=0.18181818181818182),(x=0.9636363636363636, y=0.09090909090909091),(x=0.9563636363636364, y=0)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_I" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0),(x=0.004705882352941176, y=0.0588235294117647),(x=0.002352941176470588, y=0.1176470588235294),(x=0.002352941176470588, y=0.1764705882352941),(x=0.004705882352941176, y=0.2352941176470588),(x=0.004705882352941176, y=0.2941176470588235),(x=0.007058823529411764, y=0.3529411764705882),(x=0.007058823529411764, y=0.4117647058823529),(x=0.007058823529411764, y=0.4705882352941176),(x=0.007058823529411764, y=0.5294117647058824),(x=0.007058823529411764, y=0.588235294117647),(x=0.007058823529411764, y=0.6470588235294117),(x=0.007058823529411764, y=0.7058823529411764),(x=0.007058823529411764, y=0.7647058823529411),(x=0.009411764705882352, y=0.8235294117647058),(x=0.009411764705882352, y=0.8823529411764706),(x=0.009411764705882352, y=0.9411764705882352),(x=0.011764705882352941, y=0.9999999999999999)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_H" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0),(x=0.0024691358024691358, y=0.06172839506172839),(x=0.009876543209876543, y=0.12345679012345678),(x=0.014814814814814815, y=0.18518518518518517),(x=0.01728395061728395, y=0.24691358024691357),(x=0.019753086419753086, y=0.30864197530864196),(x=0.024691358024691357, y=0.37037037037037035),(x=0.02962962962962963, y=0.43209876543209874),(x=0.02962962962962963, y=0.49382716049382713),(x=0.03209876543209877, y=0.5555555555555556),(x=0.0345679012345679, y=0.6172839506172839),(x=0.0345679012345679, y=0.6790123456790124),(x=0.0345679012345679, y=0.7407407407407407),(x=0.03950617283950617, y=0.8024691358024691),(x=0.04197530864197531, y=0.8641975308641975),(x=0.046913580246913576, y=0.9259259259259259),(x=0.05432098765432099, y=0.9876543209876543),(x=0.07407407407407407, y=0.928395061728395),(x=0.08148148148148147, y=0.8666666666666667),(x=0.09382716049382715, y=0.8049382716049382),(x=0.1111111111111111, y=0.7432098765432099),(x=0.12839506172839507, y=0.6814814814814815),(x=0.15555555555555556, y=0.6246913580246913),(x=0.1876543209876543, y=0.5703703703703703),(x=0.2271604938271605, y=0.5209876543209876),(x=0.2765432098765432, y=0.48148148148148145),(x=0.3382716049382716, y=0.4666666666666667),(x=0.39753086419753086, y=0.48641975308641977),(x=0.4469135802469136, y=0.5259259259259259),(x=0.48148148148148145, y=0.5777777777777777),(x=0.508641975308642, y=0.6345679012345679),(x=0.5308641975308642, y=0.6938271604938272),(x=0.5481481481481482, y=0.7530864197530864),(x=0.5604938271604938, y=0.8148148148148148),(x=0.5703703703703703, y=0.8765432098765432),(x=0.5777777777777777, y=0.9382716049382716),(x=0.5851851851851851, y=1)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_K" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.7601010101010102, y=0),(x=0.7373737373737375, y=0.06060606060606061),(x=0.7095959595959597, y=0.1186868686868687),(x=0.6792929292929294, y=0.17424242424242425),(x=0.648989898989899, y=0.2297979797979798),(x=0.6161616161616162, y=0.28535353535353536),(x=0.5808080808080809, y=0.3383838383838384),(x=0.5454545454545455, y=0.39141414141414144),(x=0.5050505050505051, y=0.44191919191919193),(x=0.46212121212121215, y=0.48989898989898994),(x=0.4191919191919192, y=0.537878787878788),(x=0.37373737373737376, y=0.5808080808080809),(x=0.32323232323232326, y=0.6212121212121212),(x=0.2702020202020202, y=0.6565656565656566),(x=0.2095959595959596, y=0.6818181818181819),(x=0.14646464646464646, y=0.6919191919191919),(x=0.08585858585858587, y=0.6666666666666667),(x=0.045454545454545456, y=0.6161616161616162),(x=0.01767676767676768, y=0.5555555555555556),(x=0.005050505050505051, y=0.4924242424242425),(x=0, y=0.42929292929292934),(x=0.005050505050505051, y=0.3661616161616162),(x=0.025252525252525256, y=0.30303030303030304),(x=0.05050505050505051, y=0.24242424242424243),(x=0.09090909090909091, y=0.19191919191919193),(x=0.14646464646464646, y=0.15909090909090912),(x=0.2095959595959596, y=0.15404040404040406),(x=0.27272727272727276, y=0.17171717171717174),(x=0.3257575757575758, y=0.20454545454545456),(x=0.37121212121212127, y=0.2474747474747475),(x=0.4141414141414142, y=0.29545454545454547),(x=0.45202020202020204, y=0.3434343434343435),(x=0.48989898989898994, y=0.3964646464646465),(x=0.5252525252525253, y=0.446969696969697),(x=0.5606060606060607, y=0.5),(x=0.5909090909090909, y=0.5555555555555556),(x=0.6237373737373738, y=0.6085858585858587),(x=0.6540404040404041, y=0.6641414141414141),(x=0.686868686868687, y=0.7171717171717172),(x=0.7146464646464648, y=0.7727272727272728),(x=0.7424242424242425, y=0.8282828282828284),(x=0.7702020202020202, y=0.8838383838383839),(x=0.7954545454545455, y=0.941919191919192),(x=0.8232323232323233, y=1)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_J" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.417910447761194, y=0),(x=0.4200426439232409, y=0.053304904051172705),(x=0.42217484008528783, y=0.10660980810234541),(x=0.42430703624733473, y=0.15991471215351813),(x=0.42430703624733473, y=0.21321961620469082),(x=0.42430703624733473, y=0.26652452025586354),(x=0.42217484008528783, y=0.31982942430703626),(x=0.42217484008528783, y=0.3731343283582089),(x=0.42217484008528783, y=0.42643923240938164),(x=0.42430703624733473, y=0.47974413646055436),(x=0.42430703624733473, y=0.5330490405117271),(x=0.42643923240938164, y=0.5863539445628998),(x=0.42643923240938164, y=0.6396588486140725),(x=0.42643923240938164, y=0.6929637526652452),(x=0.42217484008528783, y=0.7462686567164178),(x=0.4115138592750533, y=0.7995735607675906),(x=0.39658848614072495, y=0.8528784648187633),(x=0.371002132196162, y=0.9019189765458422),(x=0.3368869936034115, y=0.9445628997867803),(x=0.2942430703624733, y=0.9786780383795309),(x=0.24307036247334754, y=1),(x=0.18976545842217485, y=0.997867803837953),(x=0.14285714285714285, y=0.9722814498933902),(x=0.1044776119402985, y=0.9317697228144989),(x=0.07249466950959488, y=0.8869936034115138),(x=0.046908315565031986, y=0.835820895522388),(x=0.027718550106609806, y=0.7825159914712153),(x=0.01279317697228145, y=0.7313432835820896),(x=0, y=0.6780383795309168)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_U" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0),(x=0, y=0.08445945945945946),(x=0.0033783783783783786, y=0.16891891891891891),(x=0.006756756756756757, y=0.2533783783783784),(x=0.013513513513513514, y=0.33783783783783783),(x=0.016891891891891893, y=0.4222972972972973),(x=0.030405405405405407, y=0.5067567567567568),(x=0.04054054054054054, y=0.5912162162162162),(x=0.06756756756756757, y=0.6722972972972974),(x=0.10472972972972974, y=0.75),(x=0.15540540540540543, y=0.8175675675675677),(x=0.22297297297297297, y=0.8716216216216217),(x=0.3006756756756757, y=0.9087837837837839),(x=0.3817567567567568, y=0.9358108108108109),(x=0.46621621621621623, y=0.9527027027027027),(x=0.5506756756756757, y=0.9594594594594595),(x=0.6351351351351352, y=0.9527027027027027),(x=0.7195945945945946, y=0.9358108108108109),(x=0.7972972972972974, y=0.8986486486486487),(x=0.8682432432432433, y=0.847972972972973),(x=0.9222972972972974, y=0.7804054054054055),(x=0.9560810810810811, y=0.6993243243243243),(x=0.9797297297297298, y=0.6182432432432433),(x=0.9898648648648649, y=0.5337837837837838),(x=1, y=0.44932432432432434),(x=1, y=0.3648648648648649),(x=1, y=0.28040540540540543),(x=1, y=0.19594594594594594),(x=0.9932432432432433, y=0.11148648648648649),(x=0.9831081081081081, y=0.02702702702702703)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_T" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0),(x=0.07204610951008646, y=0),(x=0.1440922190201729, y=0.002881844380403458),(x=0.21613832853025935, y=0.002881844380403458),(x=0.2881844380403458, y=0.011527377521613832),(x=0.36023054755043227, y=0.011527377521613832),(x=0.4322766570605187, y=0.017291066282420747),(x=0.5043227665706052, y=0.017291066282420747),(x=0.5763688760806917, y=0.017291066282420747),(x=0.648414985590778, y=0.017291066282420747),(x=0.7204610951008645, y=0.020172910662824207),(x=0.7780979827089337, y=0.06340057636887608),(x=0.7780979827089337, y=0.13544668587896252),(x=0.7780979827089337, y=0.20749279538904897),(x=0.7780979827089337, y=0.2795389048991354),(x=0.7809798270893371, y=0.35158501440922185),(x=0.7809798270893371, y=0.42363112391930835),(x=0.7780979827089337, y=0.4956772334293948),(x=0.7752161383285302, y=0.5677233429394812),(x=0.7752161383285302, y=0.6397694524495677),(x=0.7752161383285302, y=0.7118155619596541),(x=0.7752161383285302, y=0.7838616714697406),(x=0.7752161383285302, y=0.855907780979827),(x=0.7752161383285302, y=0.9279538904899135),(x=0.7809798270893371, y=0.9999999999999999)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_W" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0),(x=0.026829268292682926, y=0.05609756097560976),(x=0.05365853658536585, y=0.11219512195121951),(x=0.08048780487804878, y=0.16829268292682928),(x=0.1048780487804878, y=0.22439024390243903),(x=0.13170731707317074, y=0.2780487804878049),(x=0.15853658536585366, y=0.33414634146341465),(x=0.18292682926829268, y=0.3902439024390244),(x=0.2073170731707317, y=0.44634146341463415),(x=0.23414634146341462, y=0.5024390243902439),(x=0.26097560975609757, y=0.5585365853658537),(x=0.28780487804878047, y=0.6146341463414634),(x=0.348780487804878, y=0.6048780487804878),(x=0.3780487804878049, y=0.5487804878048781),(x=0.4097560975609756, y=0.4951219512195122),(x=0.44146341463414634, y=0.44146341463414634),(x=0.47560975609756095, y=0.3902439024390244),(x=0.5365853658536586, y=0.3853658536585366),(x=0.5707317073170731, y=0.43414634146341463),(x=0.6048780487804878, y=0.4853658536585366),(x=0.6390243902439025, y=0.5365853658536586),(x=0.6731707317073171, y=0.5878048780487805),(x=0.7097560975609756, y=0.6390243902439025),(x=0.7536585365853659, y=0.5951219512195122),(x=0.7829268292682927, y=0.5414634146341464),(x=0.8073170731707318, y=0.48292682926829267),(x=0.8317073170731707, y=0.424390243902439),(x=0.8585365853658536, y=0.36829268292682926),(x=0.8853658536585366, y=0.3097560975609756),(x=0.9097560975609756, y=0.25121951219512195),(x=0.9317073170731708, y=0.1926829268292683),(x=0.9560975609756097, y=0.13658536585365855),(x=0.9780487804878049, y=0.07804878048780488),(x=1, y=0.01951219512195122)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_V" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0),(x=0.03333333333333333, y=0.061111111111111116),(x=0.07222222222222223, y=0.11666666666666667),(x=0.10833333333333334, y=0.17777777777777778),(x=0.14444444444444446, y=0.23611111111111113),(x=0.18055555555555555, y=0.29444444444444445),(x=0.21666666666666667, y=0.35555555555555557),(x=0.25277777777777777, y=0.4138888888888889),(x=0.2888888888888889, y=0.47222222222222227),(x=0.325, y=0.5305555555555556),(x=0.3666666666666667, y=0.5888888888888889),(x=0.4083333333333333, y=0.6444444444444445),(x=0.4527777777777778, y=0.7000000000000001),(x=0.49444444444444446, y=0.7527777777777778),(x=0.5416666666666667, y=0.8027777777777778),(x=0.6055555555555556, y=0.7694444444444445),(x=0.6416666666666667, y=0.7083333333333334),(x=0.675, y=0.6444444444444445),(x=0.7083333333333334, y=0.5805555555555556),(x=0.7416666666666667, y=0.5166666666666667),(x=0.7694444444444445, y=0.45),(x=0.8027777777777778, y=0.3861111111111111),(x=0.8333333333333334, y=0.32222222222222224),(x=0.8694444444444445, y=0.2611111111111111),(x=0.9027777777777778, y=0.19722222222222224),(x=0.9361111111111111, y=0.13333333333333333),(x=0.9694444444444444, y=0.06944444444444445),(x=1, y=0.005555555555555556)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_Q" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.552870090634441, y=0),(x=0.4773413897280967, y=0),(x=0.40181268882175225, y=0.01812688821752266),(x=0.3293051359516616, y=0.0513595166163142),(x=0.2628398791540785, y=0.09063444108761329),(x=0.20241691842900303, y=0.13595166163141995),(x=0.14501510574018128, y=0.18429003021148035),(x=0.09667673716012085, y=0.2416918429003021),(x=0.05740181268882175, y=0.3081570996978852),(x=0.027190332326283987, y=0.3776435045317221),(x=0.00906344410876133, y=0.45317220543806647),(x=0, y=0.5287009063444109),(x=0.006042296072507553, y=0.6042296072507553),(x=0.01812688821752266, y=0.6797583081570997),(x=0.045317220543806644, y=0.7492447129909365),(x=0.08157099697885196, y=0.8157099697885196),(x=0.1299093655589124, y=0.8731117824773413),(x=0.18731117824773413, y=0.9214501510574018),(x=0.256797583081571, y=0.9546827794561934),(x=0.3323262839879154, y=0.9697885196374623),(x=0.4078549848942598, y=0.9697885196374623),(x=0.4833836858006042, y=0.9546827794561934),(x=0.5558912386706949, y=0.9274924471299094),(x=0.6253776435045317, y=0.8912386706948641),(x=0.6797583081570997, y=0.8398791540785498),(x=0.7311178247734139, y=0.7854984894259819),(x=0.7764350453172205, y=0.7250755287009063),(x=0.8096676737160121, y=0.6555891238670695),(x=0.8338368580060423, y=0.5800604229607251),(x=0.8459214501510574, y=0.5045317220543807),(x=0.8459214501510574, y=0.42900302114803623),(x=0.8368580060422961, y=0.35347432024169184),(x=0.8187311178247734, y=0.27794561933534745),(x=0.7854984894259819, y=0.2054380664652568),(x=0.743202416918429, y=0.13897280966767372),(x=0.6888217522658611, y=0.08157099697885196),(x=0.6253776435045317, y=0.03625377643504532),(x=0.6978851963746223, y=0.006042296072507553),(x=0.7734138972809668, y=0.006042296072507553),(x=0.8489425981873112, y=0.012084592145015106),(x=0.9244712990936556, y=0.021148036253776436),(x=1, y=0.027190332326283987)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_P" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.009478672985781991, y=0.4786729857819906),(x=0.06872037914691943, y=0.4786729857819906),(x=0.1279620853080569, y=0.47156398104265407),(x=0.18483412322274884, y=0.4549763033175356),(x=0.2393364928909953, y=0.4312796208530806),(x=0.29383886255924174, y=0.40284360189573465),(x=0.3436018957345972, y=0.36729857819905215),(x=0.38625592417061616, y=0.3222748815165877),(x=0.4170616113744076, y=0.27014218009478674),(x=0.4218009478672986, y=0.2109004739336493),(x=0.4052132701421801, y=0.15402843601895735),(x=0.3696682464454977, y=0.10189573459715641),(x=0.3246445497630332, y=0.05924170616113744),(x=0.27014218009478674, y=0.03080568720379147),(x=0.2132701421800948, y=0.011848341232227489),(x=0.15402843601895735, y=0.002369668246445498),(x=0.09478672985781991, y=0),(x=0.03554502369668247, y=0.002369668246445498),(x=0.002369668246445498, y=0.05213270142180095),(x=0, y=0.1113744075829384),(x=0.002369668246445498, y=0.17061611374407584),(x=0.004739336492890996, y=0.22985781990521328),(x=0.004739336492890996, y=0.28909952606635075),(x=0.004739336492890996, y=0.3483412322274882),(x=0.007109004739336493, y=0.40758293838862564),(x=0.011848341232227489, y=0.4668246445497631),(x=0.009478672985781991, y=0.5260663507109005),(x=0.009478672985781991, y=0.5853080568720379),(x=0.007109004739336493, y=0.6445497630331753),(x=0.007109004739336493, y=0.7037914691943129),(x=0.007109004739336493, y=0.7630331753554503),(x=0.007109004739336493, y=0.8222748815165878),(x=0.011848341232227489, y=0.8815165876777252),(x=0.014218009478672987, y=0.9407582938388627),(x=0.014218009478672987, y=1)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_S" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.6134453781512605, y=0.036414565826330535),(x=0.5434173669467787, y=0.011204481792717087),(x=0.4733893557422969, y=0),(x=0.40336134453781514, y=0),(x=0.3333333333333333, y=0.011204481792717087),(x=0.26330532212885155, y=0.028011204481792718),(x=0.1988795518207283, y=0.058823529411764705),(x=0.1400560224089636, y=0.09803921568627451),(x=0.0896358543417367, y=0.1484593837535014),(x=0.056022408963585436, y=0.21288515406162464),(x=0.04201680672268908, y=0.28291316526610644),(x=0.056022408963585436, y=0.35294117647058826),(x=0.09803921568627451, y=0.4117647058823529),(x=0.1568627450980392, y=0.45098039215686275),(x=0.22128851540616246, y=0.4789915966386555),(x=0.2913165266106443, y=0.49299719887955185),(x=0.36134453781512604, y=0.5070028011204482),(x=0.42857142857142855, y=0.5266106442577031),(x=0.49299719887955185, y=0.5518207282913166),(x=0.5546218487394958, y=0.5882352941176471),(x=0.6050420168067226, y=0.6358543417366946),(x=0.6386554621848739, y=0.6974789915966386),(x=0.6414565826330533, y=0.7675070028011205),(x=0.6274509803921569, y=0.8375350140056023),(x=0.5910364145658263, y=0.8991596638655462),(x=0.5322128851540616, y=0.9411764705882353),(x=0.4649859943977591, y=0.969187675070028),(x=0.3977591036414566, y=0.9915966386554622),(x=0.3277310924369748, y=0.9943977591036415),(x=0.257703081232493, y=1),(x=0.1876750700280112, y=0.9971988795518207),(x=0.11764705882352941, y=0.9831932773109244),(x=0.056022408963585436, y=0.9495798319327731),(x=0, y=0.9047619047619048)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_R" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.02972972972972973, y=1),(x=0.024324324324324326, y=0.9324324324324325),(x=0.024324324324324326, y=0.8648648648648649),(x=0.021621621621621623, y=0.7972972972972974),(x=0.01891891891891892, y=0.7297297297297298),(x=0.016216216216216217, y=0.6621621621621622),(x=0.013513513513513514, y=0.5945945945945946),(x=0.010810810810810811, y=0.5270270270270271),(x=0.008108108108108109, y=0.4594594594594595),(x=0.005405405405405406, y=0.3918918918918919),(x=0.002702702702702703, y=0.32432432432432434),(x=0.002702702702702703, y=0.2567567567567568),(x=0, y=0.1891891891891892),(x=0, y=0.12162162162162163),(x=0.008108108108108109, y=0.05405405405405406),(x=0.06756756756756757, y=0.021621621621621623),(x=0.13513513513513514, y=0.002702702702702703),(x=0.20270270270270271, y=0),(x=0.2702702702702703, y=0.01891891891891892),(x=0.32162162162162167, y=0.062162162162162166),(x=0.3675675675675676, y=0.11351351351351352),(x=0.39729729729729735, y=0.17567567567567569),(x=0.4, y=0.24324324324324326),(x=0.3810810810810811, y=0.3081081081081081),(x=0.33783783783783783, y=0.3621621621621622),(x=0.28378378378378377, y=0.40540540540540543),(x=0.22162162162162163, y=0.43783783783783786),(x=0.15405405405405406, y=0.4621621621621622),(x=0.0972972972972973, y=0.5),(x=0.13783783783783785, y=0.5540540540540541),(x=0.1837837837837838, y=0.6054054054054054),(x=0.22972972972972974, y=0.654054054054054),(x=0.2783783783783784, y=0.7027027027027027),(x=0.32432432432432434, y=0.7540540540540541),(x=0.3675675675675676, y=0.8081081081081082),(x=0.4135135135135135, y=0.8594594594594596),(x=0.45675675675675675, y=0.9108108108108108),(x=0.5, y=0.9648648648648649)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_Y" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0),(x=0.010126582278481013, y=0.06329113924050633),(x=0.03037974683544304, y=0.12405063291139241),(x=0.05569620253164557, y=0.18227848101265823),(x=0.08607594936708861, y=0.2379746835443038),(x=0.12151898734177216, y=0.28860759493670884),(x=0.16455696202531647, y=0.3341772151898734),(x=0.21518987341772153, y=0.369620253164557),(x=0.2759493670886076, y=0.389873417721519),(x=0.33924050632911396, y=0.4),(x=0.40253164556962023, y=0.38734177215189874),(x=0.4607594936708861, y=0.359493670886076),(x=0.5063291139240507, y=0.31645569620253167),(x=0.5443037974683544, y=0.26329113924050634),(x=0.5746835443037975, y=0.20506329113924052),(x=0.589873417721519, y=0.14177215189873418),(x=0.6, y=0.07848101265822785),(x=0.6025316455696202, y=0.01518987341772152),(x=0.6050632911392405, y=0.07848101265822785),(x=0.6050632911392405, y=0.14177215189873418),(x=0.6075949367088608, y=0.20506329113924052),(x=0.6075949367088608, y=0.2683544303797468),(x=0.6075949367088608, y=0.33164556962025316),(x=0.6050632911392405, y=0.3949367088607595),(x=0.6025316455696202, y=0.4582278481012658),(x=0.6, y=0.5215189873417722),(x=0.5949367088607596, y=0.5848101265822785),(x=0.5873417721518988, y=0.6481012658227848),(x=0.5772151898734177, y=0.7113924050632912),(x=0.5594936708860759, y=0.7746835443037975),(x=0.5392405063291139, y=0.8354430379746836),(x=0.5113924050632912, y=0.8936708860759494),(x=0.46582278481012657, y=0.9417721518987342),(x=0.4050632911392405, y=0.9670886075949368),(x=0.34177215189873417, y=0.9848101265822785),(x=0.27848101265822783, y=0.9949367088607595),(x=0.21518987341772153, y=1),(x=0.1518987341772152, y=0.989873417721519),(x=0.08860759493670886, y=0.9721518987341773),(x=0.03037974683544304, y=0.9468354430379747)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_X" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.022099447513812154, y=0),(x=0.04143646408839779, y=0.06629834254143646),(x=0.06629834254143646, y=0.13259668508287292),(x=0.09116022099447513, y=0.19613259668508287),(x=0.11878453038674033, y=0.2596685082872928),(x=0.15193370165745856, y=0.3204419889502762),(x=0.1850828729281768, y=0.3784530386740331),(x=0.22375690607734805, y=0.43646408839779005),(x=0.26519337016574585, y=0.4917127071823204),(x=0.30939226519337015, y=0.5414364640883977),(x=0.3591160220994475, y=0.5883977900552486),(x=0.4143646408839779, y=0.6298342541436464),(x=0.47237569060773477, y=0.6657458563535912),(x=0.5359116022099447, y=0.6933701657458563),(x=0.6049723756906077, y=0.7099447513812155),(x=0.6740331491712707, y=0.7099447513812155),(x=0.7430939226519336, y=0.6988950276243093),(x=0.8066298342541436, y=0.6685082872928176),(x=0.8646408839779005, y=0.6270718232044199),(x=0.9116022099447514, y=0.574585635359116),(x=0.9502762430939227, y=0.5165745856353591),(x=0.9834254143646408, y=0.4530386740331491),(x=1, y=0.38397790055248615),(x=0.9944751381215469, y=0.3149171270718232),(x=0.9751381215469613, y=0.2458563535911602),(x=0.930939226519337, y=0.1878453038674033),(x=0.8674033149171271, y=0.15193370165745856),(x=0.7983425414364641, y=0.13535911602209943),(x=0.729281767955801, y=0.13535911602209943),(x=0.660220994475138, y=0.143646408839779),(x=0.5911602209944751, y=0.16574585635359115),(x=0.5248618784530387, y=0.19613259668508287),(x=0.4613259668508287, y=0.2292817679558011),(x=0.4060773480662983, y=0.27071823204419887),(x=0.35359116022099446, y=0.3149171270718232),(x=0.3011049723756906, y=0.361878453038674),(x=0.2541436464088398, y=0.4143646408839779),(x=0.20994475138121546, y=0.46961325966850825),(x=0.16850828729281767, y=0.5248618784530387),(x=0.1298342541436464, y=0.5828729281767956),(x=0.09392265193370165, y=0.643646408839779),(x=0.06077348066298342, y=0.7071823204419889),(x=0.027624309392265192, y=0.7679558011049723),(x=0, y=0.8314917127071823)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_Z" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.03225806451612903, y=0),(x=0.09429280397022333, y=0.007444168734491315),(x=0.15632754342431762, y=0.009925558312655087),(x=0.21836228287841192, y=0.012406947890818858),(x=0.2803970223325062, y=0.012406947890818858),(x=0.3424317617866005, y=0.01488833746898263),(x=0.4044665012406948, y=0.01488833746898263),(x=0.4665012406947891, y=0.01488833746898263),(x=0.5285359801488834, y=0.01488833746898263),(x=0.5905707196029777, y=0.01488833746898263),(x=0.652605459057072, y=0.01488833746898263),(x=0.7146401985111662, y=0.01488833746898263),(x=0.7766749379652605, y=0.012406947890818858),(x=0.7568238213399504, y=0.07196029776674938),(x=0.7121588089330024, y=0.11662531017369727),(x=0.6674937965260546, y=0.16129032258064516),(x=0.6228287841191067, y=0.20595533498759305),(x=0.5831265508684863, y=0.2531017369727047),(x=0.5409429280397022, y=0.2977667493796526),(x=0.4987593052109181, y=0.34491315136476425),(x=0.45905707196029777, y=0.3920595533498759),(x=0.41935483870967744, y=0.4392059553349876),(x=0.37965260545905705, y=0.48883374689826303),(x=0.3399503722084367, y=0.5384615384615384),(x=0.2977667493796526, y=0.5856079404466501),(x=0.26054590570719605, y=0.6377171215880894),(x=0.22084367245657568, y=0.6873449131513648),(x=0.18362282878411912, y=0.7369727047146402),(x=0.14392059553349876, y=0.7866004962779156),(x=0.10669975186104218, y=0.8387096774193549),(x=0.07196029776674938, y=0.890818858560794),(x=0.03722084367245657, y=0.9429280397022333),(x=0, y=0.9925558312655087),(x=0.062034739454094295, y=1),(x=0.12406947890818859, y=1),(x=0.18610421836228289, y=0.9975186104218362),(x=0.24813895781637718, y=0.9975186104218362),(x=0.31017369727047145, y=0.9950372208436724),(x=0.37220843672456577, y=0.9950372208436724),(x=0.43424317617866004, y=0.9925558312655087),(x=0.49627791563275436, y=0.9925558312655087),(x=0.5583126550868487, y=0.9950372208436724),(x=0.6203473945409429, y=0.9975186104218362),(x=0.6823821339950372, y=0.9950372208436724),(x=0.7444168734491315, y=0.9975186104218362)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>

	</Gesture_set>

	<Gesture_set gesture_set_name="stroke_letter_lowercase">

		<Gesture id="letter_e" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.140625, y=0.44791666666666663),(x=0.2708333333333333, y=0.44791666666666663),(x=0.40104166666666663, y=0.453125),(x=0.53125, y=0.453125),(x=0.6614583333333333, y=0.44791666666666663),(x=0.7708333333333333, y=0.375),(x=0.78125, y=0.24479166666666666),(x=0.7395833333333333, y=0.11979166666666666),(x=0.6302083333333333, y=0.03645833333333333),(x=0.5052083333333333, y=0),(x=0.375, y=0),(x=0.24479166666666666, y=0.046875),(x=0.140625, y=0.13020833333333331),(x=0.0625, y=0.234375),(x=0.015625, y=0.359375),(x=0, y=0.4895833333333333),(x=0.010416666666666666, y=0.6197916666666666),(x=0.057291666666666664, y=0.7447916666666666),(x=0.125, y=0.859375),(x=0.22395833333333331, y=0.9479166666666666),(x=0.34375, y=1),(x=0.4739583333333333, y=1),(x=0.59375, y=0.9375),(x=0.6927083333333333, y=0.8489583333333333)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_d" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.36103151862464183, y=0.6017191977077364),(x=0.28939828080229224, y=0.5902578796561604),(x=0.21776504297994267, y=0.5902578796561604),(x=0.1461318051575931, y=0.6103151862464183),(x=0.08882521489971347, y=0.6561604584527221),(x=0.045845272206303724, y=0.7163323782234957),(x=0.017191977077363897, y=0.7822349570200573),(x=0, y=0.8538681948424068),(x=0.0057306590257879654, y=0.9255014326647564),(x=0.04871060171919771, y=0.979942693409742),(x=0.1174785100286533, y=1),(x=0.18911174785100285, y=0.9914040114613181),(x=0.25501432664756446, y=0.9598853868194842),(x=0.3123209169054441, y=0.9140401146131805),(x=0.3553008595988539, y=0.8538681948424068),(x=0.3868194842406877, y=0.7879656160458453),(x=0.3954154727793696, y=0.7163323782234957),(x=0.3954154727793696, y=0.6446991404011461),(x=0.3954154727793696, y=0.5730659025787965),(x=0.3954154727793696, y=0.501432664756447),(x=0.38968481375358166, y=0.4297994269340974),(x=0.38968481375358166, y=0.35816618911174786),(x=0.38968481375358166, y=0.28653295128939826),(x=0.38968481375358166, y=0.2148997134670487),(x=0.38968481375358166, y=0.14326647564469913),(x=0.38968481375358166, y=0.07163323782234957),(x=0.3868194842406877, y=0)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_g" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.3375, y=0.015625),(x=0.259375, y=0),(x=0.18125000000000002, y=0.018750000000000003),(x=0.109375, y=0.05625),(x=0.05625, y=0.115625),(x=0.018750000000000003, y=0.184375),(x=0, y=0.2625),(x=0.003125, y=0.340625),(x=0.043750000000000004, y=0.40937500000000004),(x=0.12187500000000001, y=0.42500000000000004),(x=0.19687500000000002, y=0.39375000000000004),(x=0.253125, y=0.3375),(x=0.29375, y=0.26875),(x=0.321875, y=0.19062500000000002),(x=0.3375, y=0.1125),(x=0.34687500000000004, y=0.034375),(x=0.36875, y=0.109375),(x=0.37812500000000004, y=0.1875),(x=0.384375, y=0.265625),(x=0.390625, y=0.34375),(x=0.39375000000000004, y=0.421875),(x=0.39375000000000004, y=0.5),(x=0.390625, y=0.578125),(x=0.384375, y=0.65625),(x=0.375, y=0.734375),(x=0.359375, y=0.8125),(x=0.340625, y=0.890625),(x=0.30625, y=0.9625),(x=0.23750000000000002, y=1),(x=0.15937500000000002, y=0.984375),(x=0.09375, y=0.9375),(x=0.05, y=0.8718750000000001),(x=0.025, y=0.7937500000000001),(x=0.015625, y=0.7156250000000001)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_f" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.3645833333333333, y=0.17708333333333331),(x=0.33854166666666663, y=0.11458333333333333),(x=0.29947916666666663, y=0.0625),(x=0.24479166666666666, y=0.0234375),(x=0.1796875, y=0),(x=0.11458333333333333, y=0),(x=0.0546875, y=0.03125),(x=0.018229166666666664, y=0.0859375),(x=0.0026041666666666665, y=0.15104166666666666),(x=0, y=0.21614583333333331),(x=0.0078125, y=0.28125),(x=0.03125, y=0.34375),(x=0.057291666666666664, y=0.4036458333333333),(x=0.08333333333333333, y=0.46354166666666663),(x=0.10416666666666666, y=0.5260416666666666),(x=0.12239583333333333, y=0.5911458333333333),(x=0.13802083333333331, y=0.65625),(x=0.15104166666666666, y=0.7213541666666666),(x=0.15625, y=0.7864583333333333),(x=0.16145833333333331, y=0.8515625),(x=0.16145833333333331, y=0.9166666666666666),(x=0.15104166666666666, y=0.9817708333333333),(x=0.0859375, y=1),(x=0.033854166666666664, y=0.9557291666666666),(x=0.005208333333333333, y=0.8932291666666666),(x=0.0026041666666666665, y=0.828125),(x=0.015625, y=0.7630208333333333),(x=0.046875, y=0.703125),(x=0.09635416666666666, y=0.65625),(x=0.15625, y=0.6276041666666666),(x=0.22135416666666666, y=0.6145833333333333),(x=0.2864583333333333, y=0.609375)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_a" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.9371069182389937, y=0.07547169811320756),(x=0.7861635220125787, y=0.006289308176100629),(x=0.628930817610063, y=0),(x=0.4716981132075472, y=0.025157232704402517),(x=0.3207547169811321, y=0.08176100628930819),(x=0.18867924528301888, y=0.17610062893081763),(x=0.08176100628930819, y=0.29559748427672955),(x=0.01886792452830189, y=0.44025157232704404),(x=0, y=0.5974842767295597),(x=0.031446540880503145, y=0.7547169811320755),(x=0.13836477987421383, y=0.8616352201257862),(x=0.2893081761006289, y=0.9119496855345912),(x=0.44654088050314467, y=0.8867924528301887),(x=0.5911949685534591, y=0.8238993710691824),(x=0.7169811320754718, y=0.7232704402515724),(x=0.8050314465408805, y=0.5911949685534591),(x=0.8805031446540881, y=0.44654088050314467),(x=0.9245283018867925, y=0.2893081761006289),(x=0.9245283018867925, y=0.1320754716981132),(x=0.9433962264150944, y=0.2893081761006289),(x=0.9622641509433962, y=0.44654088050314467),(x=0.9685534591194969, y=0.6037735849056605),(x=0.9811320754716981, y=0.7610062893081762),(x=1, y=0.9182389937106918)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_c" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.8571428571428571, y=0.17391304347826086),(x=0.732919254658385, y=0.06832298136645962),(x=0.577639751552795, y=0.006211180124223602),(x=0.42236024844720493, y=0),(x=0.2670807453416149, y=0.037267080745341616),(x=0.14285714285714285, y=0.13664596273291924),(x=0.05590062111801242, y=0.2670807453416149),(x=0.006211180124223602, y=0.4161490683229813),(x=0, y=0.5714285714285714),(x=0.037267080745341616, y=0.7267080745341614),(x=0.11801242236024843, y=0.8571428571428571),(x=0.24223602484472048, y=0.9440993788819875),(x=0.3913043478260869, y=0.9937888198757763),(x=0.5465838509316769, y=0.9999999999999999),(x=0.6956521739130435, y=0.9565217391304347),(x=0.8136645962732919, y=0.8509316770186335)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_b" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0),(x=0.00273224043715847, y=0.06830601092896176),(x=0.00546448087431694, y=0.1366120218579235),(x=0.00819672131147541, y=0.20491803278688525),(x=0.00819672131147541, y=0.273224043715847),(x=0.00819672131147541, y=0.34153005464480873),(x=0.00273224043715847, y=0.4098360655737705),(x=0, y=0.4781420765027322),(x=0, y=0.546448087431694),(x=0, y=0.6147540983606558),(x=0.00273224043715847, y=0.6830601092896175),(x=0.00273224043715847, y=0.7513661202185792),(x=0.00273224043715847, y=0.819672131147541),(x=0.00273224043715847, y=0.8879781420765027),(x=0.01366120218579235, y=0.9562841530054644),(x=0.06830601092896176, y=1),(x=0.1366120218579235, y=1),(x=0.20491803278688525, y=0.9808743169398907),(x=0.2677595628415301, y=0.953551912568306),(x=0.319672131147541, y=0.9098360655737705),(x=0.36065573770491804, y=0.8524590163934426),(x=0.366120218579235, y=0.7841530054644809),(x=0.3524590163934426, y=0.7158469945355191),(x=0.3224043715846995, y=0.6502732240437158),(x=0.273224043715847, y=0.5956284153005464),(x=0.20765027322404372, y=0.5628415300546448),(x=0.13934426229508196, y=0.5491803278688525),(x=0.07103825136612021, y=0.5546448087431693)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_m" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0.31208053691275167),(x=0.013422818791946308, y=0.22818791946308725),(x=0.040268456375838924, y=0.1476510067114094),(x=0.087248322147651, y=0.07718120805369127),(x=0.15436241610738255, y=0.026845637583892617),(x=0.2348993288590604, y=0),(x=0.3187919463087248, y=0.006711409395973154),(x=0.3926174496644295, y=0.050335570469798654),(x=0.44630872483221473, y=0.11409395973154363),(x=0.4798657718120805, y=0.1912751677852349),(x=0.5033557046979865, y=0.27181208053691275),(x=0.5167785234899329, y=0.35570469798657717),(x=0.5302013422818792, y=0.27181208053691275),(x=0.5536912751677853, y=0.18791946308724833),(x=0.5939597315436241, y=0.11073825503355704),(x=0.6543624161073825, y=0.04697986577181208),(x=0.7315436241610738, y=0.010067114093959731),(x=0.8154362416107382, y=0.006711409395973154),(x=0.889261744966443, y=0.04697986577181208),(x=0.9395973154362416, y=0.11073825503355704),(x=0.9798657718120806, y=0.18791946308724833),(x=0.9932885906040269, y=0.27181208053691275),(x=1, y=0.35570469798657717)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_l" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.017730496453900707, y=0),(x=0.017730496453900707, y=0.08865248226950355),(x=0.014184397163120567, y=0.1773049645390071),(x=0.014184397163120567, y=0.26595744680851063),(x=0.010638297872340425, y=0.3546099290780142),(x=0.010638297872340425, y=0.4432624113475177),(x=0.0070921985815602835, y=0.5319148936170213),(x=0.0070921985815602835, y=0.6205673758865248),(x=0.0035460992907801418, y=0.7092198581560284),(x=0, y=0.7978723404255319),(x=0, y=0.8865248226950354),(x=0.010638297872340425, y=0.975177304964539),(x=0.09574468085106383, y=1)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_o" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.6461538461538462, y=0.023076923076923078),(x=0.4538461538461539, y=0.015384615384615385),(x=0.2692307692307693, y=0.09230769230769231),(x=0.13076923076923078, y=0.23076923076923078),(x=0.03076923076923077, y=0.4),(x=0, y=0.5923076923076923),(x=0.05384615384615385, y=0.7769230769230769),(x=0.18461538461538463, y=0.9153846153846155),(x=0.3615384615384616, y=0.9846153846153847),(x=0.5538461538461539, y=0.9923076923076923),(x=0.7461538461538462, y=0.9384615384615385),(x=0.9076923076923078, y=0.8230769230769232),(x=1, y=0.6461538461538462),(x=0.9923076923076923, y=0.4538461538461539),(x=0.9153846153846155, y=0.26153846153846155),(x=0.7769230769230769, y=0.1076923076923077),(x=0.6153846153846154, y=0)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_n" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0),(x=0.005555555555555556, y=0.1388888888888889),(x=0.011111111111111112, y=0.2777777777777778),(x=0.016666666666666666, y=0.4166666666666667),(x=0.022222222222222223, y=0.5555555555555556),(x=0.03333333333333333, y=0.6944444444444444),(x=0.03888888888888889, y=0.8333333333333334),(x=0.05555555555555556, y=0.9722222222222222),(x=0.06666666666666667, y=0.8333333333333334),(x=0.08333333333333334, y=0.6944444444444444),(x=0.1, y=0.5555555555555556),(x=0.12222222222222223, y=0.4166666666666667),(x=0.16111111111111112, y=0.2777777777777778),(x=0.22777777777777777, y=0.15),(x=0.3388888888888889, y=0.06666666666666667),(x=0.4777777777777778, y=0.07777777777777778),(x=0.5722222222222223, y=0.17777777777777778),(x=0.6222222222222222, y=0.3055555555555556),(x=0.65, y=0.4444444444444445),(x=0.6555555555555556, y=0.5833333333333334),(x=0.6555555555555556, y=0.7222222222222222),(x=0.6611111111111111, y=0.8611111111111112),(x=0.6666666666666667, y=1)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_i" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0.08614232209737828),(x=0.09363295880149813, y=0.10486891385767791),(x=0.18726591760299627, y=0.09363295880149813),(x=0.27340823970037453, y=0.056179775280898875),(x=0.352059925093633, y=0),(x=0.31086142322097376, y=0.08614232209737828),(x=0.26591760299625467, y=0.16853932584269662),(x=0.22846441947565543, y=0.2546816479400749),(x=0.18726591760299627, y=0.3408239700374532),(x=0.149812734082397, y=0.42696629213483145),(x=0.1198501872659176, y=0.5168539325842697),(x=0.09737827715355805, y=0.6104868913857678),(x=0.07865168539325842, y=0.704119850187266),(x=0.07116104868913858, y=0.7977528089887641),(x=0.07116104868913858, y=0.8913857677902621),(x=0.0898876404494382, y=0.9850187265917603),(x=0.18352059925093633, y=1),(x=0.2621722846441948, y=0.947565543071161),(x=0.33707865168539325, y=0.8913857677902621)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_h" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0.9065155807365439),(x=0.0339943342776204, y=0.8413597733711049),(x=0.0623229461756374, y=0.7762039660056658),(x=0.0906515580736544, y=0.708215297450425),(x=0.11331444759206799, y=0.6373937677053825),(x=0.1388101983002833, y=0.56657223796034),(x=0.15864022662889518, y=0.4957507082152975),(x=0.1756373937677054, y=0.42492917847025496),(x=0.1926345609065156, y=0.3541076487252125),(x=0.2067988668555241, y=0.28328611898017),(x=0.2181303116147309, y=0.21246458923512748),(x=0.22662889518413598, y=0.141643059490085),(x=0.2322946175637394, y=0.0708215297450425),(x=0.22946175637393768, y=0),(x=0.1784702549575071, y=0.0509915014164306),(x=0.1614730878186969, y=0.12181303116147309),(x=0.1529745042492918, y=0.1926345609065156),(x=0.1501416430594901, y=0.26345609065155806),(x=0.1501416430594901, y=0.3342776203966006),(x=0.1501416430594901, y=0.4050991501416431),(x=0.1501416430594901, y=0.47592067988668557),(x=0.1501416430594901, y=0.546742209631728),(x=0.1501416430594901, y=0.6175637393767706),(x=0.1501416430594901, y=0.6883852691218131),(x=0.1473087818696884, y=0.7592067988668556),(x=0.141643059490085, y=0.830028328611898),(x=0.1388101983002833, y=0.9008498583569405),(x=0.1359773371104816, y=0.9716713881019831),(x=0.17280453257790368, y=0.9065155807365439),(x=0.19830028328611898, y=0.8385269121813032),(x=0.22662889518413598, y=0.773371104815864),(x=0.2577903682719547, y=0.708215297450425),(x=0.2946175637393768, y=0.6458923512747876),(x=0.33994334277620397, y=0.5892351274787536),(x=0.4107648725212465, y=0.5807365439093485),(x=0.43059490084985835, y=0.6487252124645893),(x=0.4334277620396601, y=0.7195467422096318),(x=0.4334277620396601, y=0.7903682719546743),(x=0.4390934844192635, y=0.8611898016997167),(x=0.4475920679886686, y=0.9320113314447592),(x=0.4674220963172805, y=1),(x=0.5127478753541077, y=0.943342776203966),(x=0.5439093484419264, y=0.878186968838527)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_k" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.054285714285714284, y=0),(x=0.07142857142857142, y=0.07142857142857142),(x=0.08571428571428572, y=0.14285714285714285),(x=0.09428571428571429, y=0.21428571428571427),(x=0.09428571428571429, y=0.2857142857142857),(x=0.09428571428571429, y=0.35714285714285715),(x=0.08857142857142856, y=0.42857142857142855),(x=0.08285714285714285, y=0.5),(x=0.07428571428571429, y=0.5714285714285714),(x=0.06285714285714286, y=0.6428571428571429),(x=0.05142857142857143, y=0.7142857142857143),(x=0.04, y=0.7857142857142857),(x=0.025714285714285714, y=0.8571428571428571),(x=0.011428571428571429, y=0.9285714285714286),(x=0, y=1),(x=0.022857142857142857, y=0.9285714285714286),(x=0.045714285714285714, y=0.8571428571428571),(x=0.06571428571428571, y=0.7885714285714286),(x=0.08571428571428572, y=0.7171428571428572),(x=0.10857142857142857, y=0.6457142857142857),(x=0.13428571428571429, y=0.5771428571428572),(x=0.15714285714285714, y=0.5057142857142857),(x=0.18285714285714286, y=0.4342857142857143),(x=0.20857142857142857, y=0.3628571428571429),(x=0.23714285714285716, y=0.29428571428571426),(x=0.2714285714285714, y=0.23142857142857143),(x=0.30857142857142855, y=0.16857142857142857),(x=0.38, y=0.15714285714285714),(x=0.38, y=0.22857142857142856),(x=0.35428571428571426, y=0.29714285714285715),(x=0.31142857142857144, y=0.35428571428571426),(x=0.26857142857142857, y=0.4114285714285714),(x=0.2257142857142857, y=0.4685714285714286),(x=0.17714285714285713, y=0.5228571428571429),(x=0.14, y=0.5857142857142857),(x=0.11428571428571428, y=0.6542857142857142),(x=0.11714285714285715, y=0.7257142857142858),(x=0.14857142857142858, y=0.7914285714285715),(x=0.2, y=0.8428571428571429),(x=0.26285714285714284, y=0.8771428571428571),(x=0.3314285714285714, y=0.8971428571428571),(x=0.40285714285714286, y=0.9114285714285715),(x=0.4742857142857143, y=0.9228571428571428),(x=0.5457142857142857, y=0.9342857142857143)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_j" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0),(x=0.06007067137809187, y=0.0636042402826855),(x=0.13427561837455831, y=0.11307420494699646),(x=0.21908127208480566, y=0.13780918727915195),(x=0.30742049469964666, y=0.1413427561837456),(x=0.3957597173144876, y=0.12367491166077739),(x=0.48056537102473496, y=0.09187279151943463),(x=0.5512367491166078, y=0.038869257950530034),(x=0.5618374558303887, y=0.127208480565371),(x=0.5618374558303887, y=0.21554770318021202),(x=0.5653710247349824, y=0.303886925795053),(x=0.558303886925795, y=0.392226148409894),(x=0.5512367491166078, y=0.48056537102473496),(x=0.5441696113074205, y=0.568904593639576),(x=0.5300353356890459, y=0.657243816254417),(x=0.508833922261484, y=0.7455830388692579),(x=0.47703180212014135, y=0.8303886925795053),(x=0.4381625441696113, y=0.911660777385159),(x=0.38515901060070673, y=0.9858657243816255),(x=0.2968197879858657, y=1),(x=0.20848056537102475, y=0.9717314487632509),(x=0.13074204946996465, y=0.9257950530035336),(x=0.0706713780918728, y=0.8586572438162544),(x=0.038869257950530034, y=0.773851590106007),(x=0.038869257950530034, y=0.6855123674911661)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_u" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0.005208333333333333),(x=0.010416666666666666, y=0.13541666666666666),(x=0.03125, y=0.265625),(x=0.057291666666666664, y=0.3958333333333333),(x=0.09375, y=0.5208333333333333),(x=0.13541666666666666, y=0.6458333333333333),(x=0.203125, y=0.7552083333333333),(x=0.296875, y=0.84375),(x=0.4114583333333333, y=0.90625),(x=0.5416666666666666, y=0.9166666666666666),(x=0.6614583333333333, y=0.859375),(x=0.7552083333333333, y=0.765625),(x=0.8125, y=0.6458333333333333),(x=0.8541666666666666, y=0.515625),(x=0.890625, y=0.390625),(x=0.9010416666666666, y=0.26041666666666663),(x=0.9114583333333333, y=0.13020833333333331),(x=0.90625, y=0),(x=0.9375, y=0.13020833333333331),(x=0.953125, y=0.26041666666666663),(x=0.9583333333333333, y=0.390625),(x=0.9635416666666666, y=0.5208333333333333),(x=0.9739583333333333, y=0.6510416666666666),(x=0.9791666666666666, y=0.78125),(x=1, y=0.9114583333333333)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_t" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0.009852216748768473),(x=0.12315270935960591, y=0.024630541871921183),(x=0.24630541871921183, y=0.019704433497536946),(x=0.3694581280788177, y=0.009852216748768473),(x=0.49261083743842365, y=0.009852216748768473),(x=0.6157635467980296, y=0.009852216748768473),(x=0.7389162561576355, y=0.0049261083743842365),(x=0.8620689655172414, y=0),(x=0.9753694581280788, y=0.059113300492610835),(x=0.9802955665024631, y=0.18226600985221675),(x=0.9802955665024631, y=0.3054187192118227),(x=0.9802955665024631, y=0.4285714285714286),(x=0.9802955665024631, y=0.5517241379310345),(x=0.9852216748768473, y=0.6748768472906403),(x=0.9950738916256158, y=0.7980295566502463),(x=1, y=0.9211822660098522)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_w" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.13623978201634876, y=0.027247956403269755),(x=0.09264305177111716, y=0.08174386920980926),(x=0.05994550408719346, y=0.1416893732970027),(x=0.0326975476839237, y=0.20708446866485014),(x=0.013623978201634877, y=0.2724795640326975),(x=0.0027247956403269754, y=0.3405994550408719),(x=0, y=0.4087193460490463),(x=0.005449591280653951, y=0.4768392370572207),(x=0.02997275204359673, y=0.5422343324250681),(x=0.07084468664850135, y=0.5967302452316076),(x=0.12806539509536785, y=0.6321525885558583),(x=0.19618528610354222, y=0.6376021798365122),(x=0.2615803814713896, y=0.6103542234332425),(x=0.31607629427792916, y=0.5667574931880108),(x=0.3678474114441417, y=0.5204359673024523),(x=0.4087193460490463, y=0.4632152588555858),(x=0.444141689373297, y=0.40326975476839233),(x=0.4713896457765667, y=0.33787465940054495),(x=0.49046321525885556, y=0.26975476839237056),(x=0.4877384196185286, y=0.33787465940054495),(x=0.49591280653950953, y=0.40599455040871935),(x=0.5149863760217983, y=0.4713896457765667),(x=0.547683923705722, y=0.5313351498637602),(x=0.5967302452316076, y=0.5803814713896458),(x=0.659400544959128, y=0.6130790190735694),(x=0.7275204359673024, y=0.6185286103542235),(x=0.7956403269754768, y=0.6076294277929155),(x=0.8583106267029973, y=0.5776566757493188),(x=0.9100817438692098, y=0.5286103542234333),(x=0.9509536784741144, y=0.4713896457765667),(x=0.9836512261580381, y=0.4087193460490463),(x=1, y=0.3405994550408719),(x=1, y=0.2724795640326975),(x=0.9782016348773842, y=0.20435967302452315),(x=0.9482288828337875, y=0.13896457765667575),(x=0.9046321525885558, y=0.08174386920980926),(x=0.8555858310626703, y=0.0326975476839237),(x=0.7901907356948229, y=0)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_v" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0.017543859649122806),(x=0.07017543859649122, y=0.10526315789473684),(x=0.13157894736842105, y=0.19736842105263158),(x=0.19298245614035087, y=0.2850877192982456),(x=0.2543859649122807, y=0.37280701754385964),(x=0.3157894736842105, y=0.4649122807017544),(x=0.3771929824561403, y=0.5526315789473684),(x=0.44298245614035087, y=0.6403508771929824),(x=0.513157894736842, y=0.7280701754385964),(x=0.5921052631578947, y=0.8070175438596491),(x=0.6666666666666666, y=0.7236842105263157),(x=0.7192982456140351, y=0.6228070175438596),(x=0.7675438596491228, y=0.5175438596491228),(x=0.8114035087719298, y=0.4122807017543859),(x=0.8640350877192982, y=0.3114035087719298),(x=0.9078947368421052, y=0.20614035087719296),(x=0.956140350877193, y=0.10087719298245613),(x=1, y=0)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_q" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.3143631436314363, y=0.016260162601626015),(x=0.24661246612466126, y=0),(x=0.17886178861788618, y=0.005420054200542005),(x=0.11382113821138211, y=0.02981029810298103),(x=0.05962059620596206, y=0.07317073170731707),(x=0.02168021680216802, y=0.13008130081300812),(x=0, y=0.1951219512195122),(x=0.0027100271002710027, y=0.26287262872628725),(x=0.03252032520325203, y=0.3252032520325203),(x=0.0975609756097561, y=0.34688346883468835),(x=0.16531165311653118, y=0.33604336043360433),(x=0.22493224932249323, y=0.2981029810298103),(x=0.27371273712737126, y=0.24661246612466126),(x=0.3062330623306233, y=0.18699186991869918),(x=0.3170731707317073, y=0.11924119241192412),(x=0.31978319783197834, y=0.051490514905149054),(x=0.32791327913279134, y=0.11924119241192412),(x=0.33062330623306235, y=0.18699186991869918),(x=0.33604336043360433, y=0.25474254742547425),(x=0.34146341463414637, y=0.3224932249322493),(x=0.34146341463414637, y=0.3902439024390244),(x=0.34417344173441733, y=0.45799457994579945),(x=0.34688346883468835, y=0.5257452574525745),(x=0.34688346883468835, y=0.5934959349593496),(x=0.34959349593495936, y=0.6612466124661247),(x=0.3523035230352303, y=0.7289972899728997),(x=0.3604336043360434, y=0.7967479674796748),(x=0.3604336043360434, y=0.8644986449864499),(x=0.36585365853658536, y=0.9322493224932249),(x=0.3794037940379404, y=1),(x=0.4092140921409214, y=0.9349593495934959),(x=0.43360433604336046, y=0.8699186991869918),(x=0.45799457994579945, y=0.8048780487804879),(x=0.4878048780487805, y=0.7398373983739838),(x=0.5121951219512195, y=0.6720867208672087)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_p" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0.36125654450261785),(x=0.12565445026178013, y=0.40314136125654454),(x=0.25654450261780104, y=0.3979057591623037),(x=0.38219895287958117, y=0.35078534031413616),(x=0.4816753926701571, y=0.2670157068062827),(x=0.5078534031413613, y=0.13612565445026178),(x=0.4083769633507854, y=0.04712041884816754),(x=0.2774869109947644, y=0),(x=0.14659685863874347, y=0),(x=0.041884816753926704, y=0.08376963350785341),(x=0.02617801047120419, y=0.21465968586387435),(x=0.02617801047120419, y=0.3455497382198953),(x=0.02617801047120419, y=0.47643979057591623),(x=0.03141361256544503, y=0.6073298429319373),(x=0.03141361256544503, y=0.7382198952879582),(x=0.041884816753926704, y=0.8691099476439791),(x=0.04712041884816754, y=1)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_s" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.8409090909090909, y=0.18181818181818182),(x=0.6818181818181819, y=0.06818181818181818),(x=0.5, y=0),(x=0.3106060606060606, y=0),(x=0.12878787878787878, y=0.05303030303030303),(x=0, y=0.19696969696969696),(x=0.10606060606060606, y=0.3560606060606061),(x=0.29545454545454547, y=0.3939393939393939),(x=0.48484848484848486, y=0.4318181818181818),(x=0.6666666666666667, y=0.49242424242424243),(x=0.8257575757575758, y=0.5984848484848485),(x=0.9166666666666667, y=0.7651515151515151),(x=0.8030303030303031, y=0.9242424242424243),(x=0.6136363636363636, y=0.9772727272727273),(x=0.42424242424242425, y=1),(x=0.23484848484848486, y=1),(x=0.05303030303030303, y=0.9318181818181819)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_r" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0),(x=0.022857142857142857, y=0.14285714285714285),(x=0.05142857142857143, y=0.2857142857142857),(x=0.06857142857142857, y=0.42857142857142855),(x=0.08571428571428572, y=0.5714285714285714),(x=0.10285714285714286, y=0.7142857142857143),(x=0.12571428571428572, y=0.8571428571428571),(x=0.14285714285714285, y=1),(x=0.14285714285714285, y=0.8571428571428571),(x=0.14285714285714285, y=0.7142857142857143),(x=0.14285714285714285, y=0.5714285714285714),(x=0.1657142857142857, y=0.42857142857142855),(x=0.2057142857142857, y=0.2857142857142857),(x=0.3028571428571429, y=0.17714285714285713),(x=0.44571428571428573, y=0.13714285714285715),(x=0.5885714285714285, y=0.13142857142857142),(x=0.7314285714285714, y=0.14285714285714285),(x=0.8742857142857143, y=0.16)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_y" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0),(x=0.016722408026755852, y=0.08361204013377926),(x=0.056856187290969896, y=0.15719063545150502),(x=0.11371237458193979, y=0.22073578595317725),(x=0.18729096989966554, y=0.26421404682274247),(x=0.2709030100334448, y=0.2809364548494983),(x=0.35451505016722407, y=0.2709030100334448),(x=0.4280936454849498, y=0.23076923076923075),(x=0.48494983277591974, y=0.16722408026755853),(x=0.5250836120401338, y=0.0903010033444816),(x=0.5518394648829431, y=0.010033444816053512),(x=0.5518394648829431, y=0.09364548494983277),(x=0.5484949832775919, y=0.17725752508361203),(x=0.5418060200668896, y=0.2608695652173913),(x=0.5317725752508361, y=0.34448160535117056),(x=0.5150501672240803, y=0.4280936454849498),(x=0.4983277591973244, y=0.5117056856187291),(x=0.47157190635451507, y=0.5919732441471571),(x=0.43812709030100333, y=0.6688963210702341),(x=0.40468227424749165, y=0.745819397993311),(x=0.3612040133779264, y=0.8193979933110368),(x=0.3110367892976589, y=0.8862876254180602),(x=0.25418060200668896, y=0.9498327759197325),(x=0.18729096989966554, y=1),(x=0.11036789297658862, y=0.9665551839464883),(x=0.13043478260869565, y=0.882943143812709),(x=0.1705685618729097, y=0.8060200668896321),(x=0.22073578595317725, y=0.7391304347826086),(x=0.27424749163879597, y=0.6755852842809364),(x=0.33444816053511706, y=0.6153846153846154),(x=0.39464882943143814, y=0.5518394648829431),(x=0.45484949832775917, y=0.4916387959866221),(x=0.5150501672240803, y=0.43478260869565216),(x=0.5785953177257525, y=0.37792642140468224),(x=0.6421404682274248, y=0.3210702341137124),(x=0.7090301003344481, y=0.26755852842809363),(x=0.7725752508361204, y=0.2140468227424749),(x=0.8394648829431438, y=0.16387959866220736)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_x" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0, y=0.03180212014134275),(x=0.08833922261484099, y=0.010600706713780918),(x=0.17667844522968199, y=0),(x=0.26501766784452296, y=0),(x=0.35335689045936397, y=0.021201413427561835),(x=0.42402826855123676, y=0.07420494699646643),(x=0.4628975265017668, y=0.15547703180212014),(x=0.4558303886925795, y=0.24381625441696111),(x=0.42402826855123676, y=0.3286219081272085),(x=0.3710247349823321, y=0.3992932862190813),(x=0.31095406360424027, y=0.4628975265017668),(x=0.24381625441696111, y=0.519434628975265),(x=0.17314487632508835, y=0.5759717314487632),(x=0.10247349823321554, y=0.6289752650176679),(x=0.0353356890459364, y=0.6890459363957597),(x=0.1166077738515901, y=0.6466431095406361),(x=0.19081272084805653, y=0.6007067137809187),(x=0.2614840989399293, y=0.5441696113074205),(x=0.3250883392226148, y=0.4840989399293286),(x=0.38515901060070673, y=0.4204946996466431),(x=0.4452296819787986, y=0.3568904593639576),(x=0.508833922261484, y=0.29328621908127206),(x=0.568904593639576, y=0.22614840989399293),(x=0.6325088339222614, y=0.1625441696113074),(x=0.6996466431095406, y=0.10600706713780919),(x=0.7703180212014135, y=0.04946996466431095),(x=0.8445229681978799, y=0),(x=0.7597173144876325, y=0.038869257950530034),(x=0.6819787985865724, y=0.08480565371024734),(x=0.6183745583038869, y=0.14840989399293286),(x=0.558303886925795, y=0.21554770318021202),(x=0.519434628975265, y=0.2968197879858657),(x=0.4911660777385159, y=0.38162544169611307),(x=0.4911660777385159, y=0.46996466431095407),(x=0.519434628975265, y=0.5547703180212014),(x=0.5865724381625441, y=0.607773851590106),(x=0.6749116607773852, y=0.6219081272084805),(x=0.7632508833922261, y=0.607773851590106),(x=0.8445229681978799, y=0.5724381625441696),(x=0.9222614840989399, y=0.5265017667844523),(x=1, y=0.4840989399293286)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>


		<Gesture id="letter_z" type="stroke">
			<match>
				<action>
					<initial>
						<point path_pts="(x=0.06172839506172839, y=0.012345679012345678),(x=0.1388888888888889, y=0.012345679012345678),(x=0.21604938271604937, y=0.012345679012345678),(x=0.29320987654320985, y=0.012345679012345678),(x=0.37037037037037035, y=0.012345679012345678),(x=0.44753086419753085, y=0.012345679012345678),(x=0.5246913580246914, y=0.012345679012345678),(x=0.6018518518518519, y=0.012345679012345678),(x=0.6790123456790123, y=0.012345679012345678),(x=0.7561728395061728, y=0.012345679012345678),(x=0.8333333333333333, y=0.009259259259259259),(x=0.9104938271604938, y=0.0030864197530864196),(x=0.9876543209876543, y=0),(x=0.9382716049382716, y=0.06172839506172839),(x=0.8641975308641975, y=0.09567901234567901),(x=0.7901234567901234, y=0.12654320987654322),(x=0.7160493827160493, y=0.16049382716049382),(x=0.6388888888888888, y=0.1882716049382716),(x=0.5679012345679012, y=0.2222222222222222),(x=0.49382716049382713, y=0.25),(x=0.41975308641975306, y=0.2839506172839506),(x=0.3487654320987654, y=0.32098765432098764),(x=0.27469135802469136, y=0.35493827160493824),(x=0.2037037037037037, y=0.3919753086419753),(x=0.13580246913580246, y=0.43209876543209874),(x=0.06481481481481481, y=0.4722222222222222),(x=0, y=0.5154320987654321),(x=0.07407407407407407, y=0.537037037037037),(x=0.15123456790123457, y=0.5339506172839505),(x=0.22839506172839505, y=0.5308641975308641),(x=0.3055555555555555, y=0.5308641975308641),(x=0.38271604938271603, y=0.5308641975308641),(x=0.45987654320987653, y=0.5308641975308641),(x=0.537037037037037, y=0.5308641975308641),(x=0.6141975308641975, y=0.5308641975308641),(x=0.691358024691358, y=0.5308641975308641),(x=0.7685185185185185, y=0.5308641975308641),(x=0.845679012345679, y=0.5277777777777778),(x=0.9228395061728395, y=0.5277777777777778),(x=1, y=0.5308641975308641)"/>
						<cluster point_number="1"/>
						<event touchEvent="TouchEnd"/>
					</initial>
				</action>
			</match>
			<analysis>
				<algorithm class="vectormetric" type="continuous">
					<library module="stroke"/>
					<returns>
						<property id="stroke_x" result=""/>
						<property id="stroke_y" result=""/>
						<property id="stroke_prob" result=""/>
					</returns>
				</algorithm>
			</analysis>
			<mapping>
				<update dispatch_type="discrete" dispatch_mode="cluster_remove">
					<gesture_event type="stroke_letter">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
	</Gesture_set>
		
			
		
		
		
		
	
</GestureMarkupLanguage>