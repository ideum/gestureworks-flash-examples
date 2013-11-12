<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage xmlns:gml="http://gestureworks.com/gml/version/1.0">
	
	<Gesture_globals>
		<input>
			<surface>true</surface>
			<motion>true</motion>
			<sensors>true</sensors>
		</input>
	</Gesture_globals>


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
								<gesture_event type="drag">
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
								<gesture_event type="scale">
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
								<property ref="drag_dx" active="true" delta_min=".01" delta_max="100"/>
								<property ref="drag_dy" active="true" delta_min=".01" delta_max="100"/>
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
										<cluster point_number="0" point_number_min="1" point_number_max="10"/>
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
								
					<Gesture id="2-point-power-drag" type="drag">
							<match>
								<action>
									<initial>
											<cluster point_number="2"/>
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
							<processing>
								<multiply_filter>
										<property ref="dx" active="true" factor="2"/>
										<property ref="dy" active="true" factor="2"/>
								</multiply_filter>
							</processing>
							<mapping>
								<update dispatch_type="continuous">
									<gesture_event type="drag">
										<property ref="dx" target="x"/>
										<property ref="dy" target="y"/>
									</gesture_event>
								</update>
							</mapping>
					</Gesture>	
						
					
					<Gesture id="n-rotate-to-scale" type="rotate">
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
									<property id="scale_dsx" result="dtheta"/>
									<property id="scale_dsy" result="dtheta"/>
								</returns>
							</algorithm>
						</analysis>
						<processing>
							<multiply_filter>
									<property ref="scale_dsx" active="true" factor="0.01"/>
									<property ref="scale_dsy" active="true" factor="0.01"/>
							</multiply_filter>
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
									<property ref="dx" active="true" delta_min="0.0" delta_max="100"/>
									<property ref="dy" active="true" delta_min="0.0" delta_max="100"/>
									<property ref="dsx" active="true" delta_min="0.0" delta_max="0.2"/>
									<property ref="dsy" active="true" delta_min="0.0" delta_max="0.2"/>
									<property ref="dtheta" active="false"/>
								</delta_filter>
								<boundary_filter>
									<property ref="dx" active="true" boundary_min="200" boundary_max="1720"/>
									<property ref="dy" active="true" boundary_min="200" boundary_max="880"/>
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
													<cluster point_number="0" point_number_min="1" point_number_max="5"/>
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
													<cluster point_number="0" point_number_min="0" point_number_max="5"/>
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
													<property id="tilt_dx" return="dsx" var="dsx" var_min="0.015"/>
													<property id="tilt_dy" return="dsy" var="dsy" var_min="0.015"/>
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
									<gesture_event  type="triple_tap">
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
		
		
		
		<Gesture_set id="stroke_symbols">
		
					<Gesture id="symbol_chevron_left" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.7008086253369272, y=0),(x=0.6388140161725068, y=0.03234501347708895),(x=0.5822102425876011, y=0.07008086253369272),(x=0.5283018867924528, y=0.11320754716981132),(x=0.47439353099730464, y=0.15363881401617252),(x=0.42048517520215634, y=0.19676549865229112),(x=0.3665768194070081, y=0.24258760107816713),(x=0.31266846361185985, y=0.28571428571428575),(x=0.261455525606469, y=0.33153638814016173),(x=0.21024258760107817, y=0.37466307277628036),(x=0.15902964959568733, y=0.42048517520215634),(x=0.1078167115902965, y=0.46361185983827496),(x=0.05390835579514825, y=0.5067385444743936),(x=0, y=0.5498652291105122),(x=0.04582210242587601, y=0.5956873315363882),(x=0.10242587601078168, y=0.6280323450134772),(x=0.16172506738544476, y=0.6576819407008087),(x=0.22102425876010784, y=0.6900269541778976),(x=0.2803234501347709, y=0.7223719676549866),(x=0.339622641509434, y=0.7547169811320755),(x=0.39892183288409705, y=0.7870619946091645),(x=0.4528301886792453, y=0.8247978436657682),(x=0.5121293800539084, y=0.8598382749326146),(x=0.568733153638814, y=0.8975741239892184),(x=0.6253369272237197, y=0.9326145552560647),(x=0.6846361185983828, y=0.9676549865229112),(x=0.7439353099730459, y=1)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_chevron_right" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0),(x=0.061919504643962855, y=0.043343653250773995),(x=0.12693498452012383, y=0.08978328173374614),(x=0.19504643962848298, y=0.13003095975232198),(x=0.26315789473684215, y=0.17027863777089786),(x=0.33126934984520123, y=0.20743034055727555),(x=0.40247678018575855, y=0.24148606811145512),(x=0.4705882352941177, y=0.2755417956656347),(x=0.541795665634675, y=0.30650154798761614),(x=0.6099071207430341, y=0.34365325077399383),(x=0.6811145510835914, y=0.3777089783281734),(x=0.7492260061919505, y=0.411764705882353),(x=0.8204334365325078, y=0.44272445820433437),(x=0.8947368421052632, y=0.4674922600619195),(x=0.8359133126934986, y=0.5201238390092879),(x=0.7678018575851394, y=0.5572755417956656),(x=0.6965944272445821, y=0.5944272445820433),(x=0.6253869969040248, y=0.628482972136223),(x=0.5572755417956656, y=0.6656346749226006),(x=0.48606811145510836, y=0.7027863777089783),(x=0.4179566563467493, y=0.7430340557275542),(x=0.34674922600619196, y=0.7801857585139319),(x=0.281733746130031, y=0.823529411764706),(x=0.21362229102167185, y=0.8637770897832818),(x=0.14860681114551083, y=0.9102167182662539),(x=0.0804953560371517, y=0.9535603715170279),(x=0.015479876160990714, y=1)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_chevron_up" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0.8885448916408669),(x=0.04024767801857585, y=0.8204334365325078),(x=0.07430340557275542, y=0.7492260061919505),(x=0.11145510835913314, y=0.6780185758513932),(x=0.1455108359133127, y=0.6068111455108359),(x=0.17956656346749228, y=0.5325077399380805),(x=0.21671826625386997, y=0.4613003095975233),(x=0.25386996904024767, y=0.39009287925696595),(x=0.2910216718266254, y=0.3188854489164087),(x=0.33126934984520123, y=0.25077399380804954),(x=0.3715170278637771, y=0.1826625386996904),(x=0.4179566563467493, y=0.11764705882352942),(x=0.4674922600619195, y=0.05572755417956657),(x=0.5232198142414861, y=0),(x=0.5727554179566564, y=0.05882352941176471),(x=0.6099071207430341, y=0.12693498452012383),(x=0.6470588235294118, y=0.19504643962848298),(x=0.6811145510835914, y=0.26625386996904027),(x=0.7089783281733747, y=0.33746130030959753),(x=0.7461300309597524, y=0.4055727554179567),(x=0.7801857585139319, y=0.47678018575851394),(x=0.8173374613003096, y=0.5479876160990712),(x=0.8513931888544892, y=0.6191950464396285),(x=0.8854489164086687, y=0.6873065015479877),(x=0.9226006191950465, y=0.7554179566563468),(x=0.9597523219814242, y=0.823529411764706),(x=1, y=0.8916408668730651)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_chevron_down" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0.029585798816568046),(x=0.038461538461538464, y=0.09171597633136094),(x=0.07692307692307693, y=0.15384615384615385),(x=0.12130177514792899, y=0.21301775147928995),(x=0.16272189349112426, y=0.27514792899408286),(x=0.20414201183431951, y=0.3343195266272189),(x=0.2485207100591716, y=0.3964497041420118),(x=0.29289940828402367, y=0.4526627218934911),(x=0.34023668639053256, y=0.5088757396449703),(x=0.3816568047337278, y=0.5680473372781065),(x=0.4230769230769231, y=0.6301775147928994),(x=0.46745562130177515, y=0.6893491124260355),(x=0.514792899408284, y=0.7455621301775148),(x=0.5650887573964497, y=0.8017751479289941),(x=0.6153846153846154, y=0.7455621301775148),(x=0.6479289940828402, y=0.6775147928994083),(x=0.6804733727810651, y=0.606508875739645),(x=0.7130177514792899, y=0.5355029585798816),(x=0.7485207100591715, y=0.46745562130177515),(x=0.7810650887573964, y=0.3994082840236686),(x=0.8195266272189349, y=0.3313609467455621),(x=0.8550295857988165, y=0.2662721893491124),(x=0.8905325443786982, y=0.1982248520710059),(x=0.9289940828402367, y=0.1331360946745562),(x=0.9674556213017751, y=0.06804733727810651),(x=1, y=0)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_arrow_left" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.3231132075471698, y=0),(x=0.2783018867924528, y=0.04009433962264151),(x=0.23113207547169812, y=0.07783018867924528),(x=0.18396226415094338, y=0.1179245283018868),(x=0.1391509433962264, y=0.1580188679245283),(x=0.09198113207547169, y=0.1981132075471698),(x=0.04716981132075471, y=0.23820754716981132),(x=0, y=0.27594339622641506),(x=0.05660377358490566, y=0.29245283018867924),(x=0.11556603773584906, y=0.2900943396226415),(x=0.17452830188679244, y=0.285377358490566),(x=0.23349056603773585, y=0.2830188679245283),(x=0.29245283018867924, y=0.28066037735849053),(x=0.35141509433962265, y=0.28066037735849053),(x=0.410377358490566, y=0.28066037735849053),(x=0.4693396226415094, y=0.28066037735849053),(x=0.5283018867924528, y=0.28066037735849053),(x=0.5872641509433962, y=0.285377358490566),(x=0.6462264150943396, y=0.285377358490566),(x=0.705188679245283, y=0.2830188679245283),(x=0.7641509433962264, y=0.2830188679245283),(x=0.8231132075471698, y=0.28066037735849053),(x=0.8820754716981132, y=0.2783018867924528),(x=0.9410377358490566, y=0.27594339622641506),(x=1, y=0.27358490566037735)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_arrow_right" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.6509433962264151, y=0),(x=0.6910377358490566, y=0.04245283018867924),(x=0.7334905660377358, y=0.08018867924528301),(x=0.7783018867924528, y=0.11556603773584906),(x=0.8231132075471698, y=0.15330188679245282),(x=0.8655660377358491, y=0.19339622641509432),(x=0.9080188679245282, y=0.23349056603773585),(x=0.9528301886792453, y=0.27358490566037735),(x=1, y=0.3089622641509434),(x=0.9433962264150944, y=0.32547169811320753),(x=0.8844339622641509, y=0.3231132075471698),(x=0.8254716981132075, y=0.31839622641509435),(x=0.7665094339622641, y=0.3136792452830189),(x=0.7075471698113207, y=0.3113207547169811),(x=0.6485849056603773, y=0.3089622641509434),(x=0.5896226415094339, y=0.30660377358490565),(x=0.5306603773584906, y=0.30424528301886794),(x=0.4716981132075472, y=0.30424528301886794),(x=0.41273584905660377, y=0.30424528301886794),(x=0.35377358490566035, y=0.3018867924528302),(x=0.29481132075471694, y=0.3018867924528302),(x=0.2358490566037736, y=0.3018867924528302),(x=0.17688679245283018, y=0.30424528301886794),(x=0.1179245283018868, y=0.30660377358490565),(x=0.0589622641509434, y=0.30660377358490565),(x=0, y=0.30660377358490565)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_arrow_up" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0.33726415094339623),(x=0.05424528301886792, y=0.3113207547169811),(x=0.1061320754716981, y=0.28066037735849053),(x=0.15330188679245282, y=0.2429245283018868),(x=0.1981132075471698, y=0.205188679245283),(x=0.2429245283018868, y=0.1650943396226415),(x=0.28773584905660377, y=0.125),(x=0.33254716981132076, y=0.08490566037735849),(x=0.3773584905660377, y=0.04481132075471698),(x=0.41745283018867924, y=0),(x=0.43396226415094336, y=0.05660377358490566),(x=0.43396226415094336, y=0.11556603773584906),(x=0.43396226415094336, y=0.17452830188679244),(x=0.43396226415094336, y=0.23349056603773585),(x=0.4292452830188679, y=0.29245283018867924),(x=0.4268867924528302, y=0.35141509433962265),(x=0.4245283018867924, y=0.410377358490566),(x=0.4221698113207547, y=0.4693396226415094),(x=0.41981132075471694, y=0.5283018867924528),(x=0.41745283018867924, y=0.5872641509433962),(x=0.4150943396226415, y=0.6462264150943396),(x=0.4150943396226415, y=0.705188679245283),(x=0.41273584905660377, y=0.7641509433962264),(x=0.41273584905660377, y=0.8231132075471698),(x=0.410377358490566, y=0.8820754716981132),(x=0.410377358490566, y=0.9410377358490566),(x=0.4150943396226415, y=1)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_arrow_down" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0),(x=0.006666666666666666, y=0.05555555555555555),(x=0.008888888888888889, y=0.1111111111111111),(x=0.008888888888888889, y=0.16666666666666666),(x=0.011111111111111112, y=0.2222222222222222),(x=0.011111111111111112, y=0.2777777777777778),(x=0.011111111111111112, y=0.3333333333333333),(x=0.008888888888888889, y=0.3888888888888889),(x=0.008888888888888889, y=0.4444444444444444),(x=0.008888888888888889, y=0.5),(x=0.008888888888888889, y=0.5555555555555556),(x=0.008888888888888889, y=0.6111111111111112),(x=0.008888888888888889, y=0.6666666666666666),(x=0.008888888888888889, y=0.7222222222222222),(x=0.006666666666666666, y=0.7777777777777778),(x=0.006666666666666666, y=0.8333333333333334),(x=0.011111111111111112, y=0.8888888888888888),(x=0.011111111111111112, y=0.9444444444444444),(x=0.017777777777777778, y=1),(x=0.06, y=0.96),(x=0.09555555555555556, y=0.9155555555555556),(x=0.1288888888888889, y=0.8688888888888889),(x=0.16, y=0.8222222222222222),(x=0.19111111111111112, y=0.7733333333333333),(x=0.2222222222222222, y=0.7266666666666667),(x=0.25333333333333335, y=0.68),(x=0.2822222222222222, y=0.6288888888888889)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_add" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0.485),(x=0.0625, y=0.4825),(x=0.125, y=0.47500000000000003),(x=0.1875, y=0.47000000000000003),(x=0.25, y=0.4675),(x=0.3125, y=0.4675),(x=0.375, y=0.4675),(x=0.4375, y=0.465),(x=0.5, y=0.465),(x=0.5625, y=0.465),(x=0.625, y=0.4625),(x=0.6875, y=0.4625),(x=0.75, y=0.4625),(x=0.8125, y=0.46),(x=0.875, y=0.46),(x=0.9375, y=0.46),(x=1, y=0.4625),(x=0.9975, y=0.4),(x=0.9525, y=0.35000000000000003),(x=0.9075, y=0.3025),(x=0.8625, y=0.2575),(x=0.8150000000000001, y=0.2125),(x=0.7675000000000001, y=0.1675),(x=0.7225, y=0.1225),(x=0.675, y=0.0775),(x=0.625, y=0.0375),(x=0.5750000000000001, y=0),(x=0.515, y=0.0175),(x=0.5025000000000001, y=0.08),(x=0.5025000000000001, y=0.14250000000000002),(x=0.5025000000000001, y=0.20500000000000002),(x=0.505, y=0.2675),(x=0.505, y=0.33),(x=0.505, y=0.3925),(x=0.505, y=0.455),(x=0.505, y=0.5175),(x=0.5075000000000001, y=0.58),(x=0.51, y=0.6425),(x=0.51, y=0.705),(x=0.51, y=0.7675000000000001),(x=0.5125, y=0.8300000000000001)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_subtract" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0.006666666666666666),(x=0.05555555555555555, y=0.011111111111111112),(x=0.1111111111111111, y=0.011111111111111112),(x=0.16666666666666666, y=0.008888888888888889),(x=0.2222222222222222, y=0.006666666666666666),(x=0.2777777777777778, y=0.006666666666666666),(x=0.3333333333333333, y=0.006666666666666666),(x=0.3888888888888889, y=0.0044444444444444444),(x=0.4444444444444444, y=0.0044444444444444444),(x=0.5, y=0.0022222222222222222),(x=0.5555555555555556, y=0),(x=0.6111111111111112, y=0),(x=0.6666666666666666, y=0),(x=0.7222222222222222, y=0.0022222222222222222),(x=0.7777777777777778, y=0.0022222222222222222),(x=0.8333333333333334, y=0.0022222222222222222),(x=0.8888888888888888, y=0),(x=0.9444444444444444, y=0),(x=1, y=0.0022222222222222222)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_multiply" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0),(x=0.03649635036496351, y=0.046228710462287104),(x=0.07785888077858881, y=0.09002433090024331),(x=0.12165450121654502, y=0.13138686131386862),(x=0.1654501216545012, y=0.17518248175182483),(x=0.20924574209245742, y=0.21654501216545013),(x=0.25304136253041365, y=0.26034063260340634),(x=0.29440389294403896, y=0.30413625304136255),(x=0.34063260340632606, y=0.34549878345498786),(x=0.38442822384428227, y=0.38442822384428227),(x=0.4282238442822385, y=0.4282238442822385),(x=0.4744525547445256, y=0.46715328467153283),(x=0.5182481751824818, y=0.5060827250608273),(x=0.5644768856447688, y=0.5474452554744526),(x=0.6082725060827251, y=0.586374695863747),(x=0.6520681265206812, y=0.6277372262773723),(x=0.6958637469586375, y=0.6690997566909976),(x=0.7420924574209246, y=0.7104622871046229),(x=0.7883211678832117, y=0.7493917274939172),(x=0.8345498783454988, y=0.7883211678832117),(x=0.8832116788321168, y=0.8248175182481752),(x=0.9343065693430657, y=0.8613138686131387),(x=0.9951338199513382, y=0.8515815085158152),(x=1, y=0.7907542579075426),(x=1, y=0.7299270072992701),(x=0.9975669099756691, y=0.6690997566909976),(x=0.9927007299270073, y=0.6082725060827251),(x=0.9902676399026764, y=0.5474452554744526),(x=0.9854014598540146, y=0.48661800486618007),(x=0.9829683698296837, y=0.4257907542579076),(x=0.9781021897810219, y=0.36496350364963503),(x=0.9732360097323601, y=0.30413625304136255),(x=0.9659367396593674, y=0.24330900243309003),(x=0.9610705596107056, y=0.18248175182481752),(x=0.9562043795620438, y=0.12165450121654502),(x=0.951338199513382, y=0.06082725060827251),(x=0.8905109489051095, y=0.04866180048661801),(x=0.8418491484184915, y=0.08759124087591241),(x=0.7956204379562044, y=0.12895377128953772),(x=0.7493917274939172, y=0.16788321167883213),(x=0.7007299270072993, y=0.20681265206812652),(x=0.6520681265206812, y=0.24574209245742093),(x=0.6034063260340633, y=0.2846715328467153),(x=0.5547445255474452, y=0.3236009732360097),(x=0.5085158150851582, y=0.36496350364963503),(x=0.46228710462287104, y=0.40632603406326034),(x=0.41605839416058393, y=0.45012165450121655),(x=0.36982968369829683, y=0.49148418491484186),(x=0.3260340632603406, y=0.5352798053527981),(x=0.2822384428223844, y=0.5790754257907543),(x=0.23844282238442824, y=0.6228710462287105),(x=0.19708029197080293, y=0.6690997566909976),(x=0.15571776155717762, y=0.7153284671532847),(x=0.11192214111922141, y=0.7615571776155718),(x=0.0705596107055961, y=0.8077858880778589),(x=0.029197080291970802, y=0.854014598540146)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					
					<Gesture id="symbol_divide" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=1, y=0),(x=0.9473684210526315, y=0.04473684210526316),(x=0.8973684210526316, y=0.08947368421052632),(x=0.8473684210526315, y=0.13421052631578947),(x=0.7947368421052632, y=0.1763157894736842),(x=0.7447368421052631, y=0.22105263157894736),(x=0.6921052631578947, y=0.2631578947368421),(x=0.6394736842105263, y=0.3078947368421053),(x=0.5894736842105263, y=0.3526315789473684),(x=0.5421052631578948, y=0.3973684210526316),(x=0.4921052631578947, y=0.4421052631578947),(x=0.4421052631578947, y=0.4868421052631579),(x=0.39473684210526316, y=0.531578947368421),(x=0.3447368421052632, y=0.5789473684210527),(x=0.29736842105263156, y=0.6263157894736842),(x=0.25, y=0.6736842105263158),(x=0.19999999999999998, y=0.7210526315789474),(x=0.15, y=0.7657894736842105),(x=0.10263157894736842, y=0.8131578947368421),(x=0.05263157894736842, y=0.8578947368421053),(x=0, y=0.9)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_percent" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0.019230769230769232),(x=0.04567307692307693, y=0.06009615384615385),(x=0.0889423076923077, y=0.09855769230769232),(x=0.12980769230769232, y=0.14423076923076925),(x=0.16586538461538464, y=0.19230769230769232),(x=0.20192307692307693, y=0.2403846153846154),(x=0.2355769230769231, y=0.29086538461538464),(x=0.2644230769230769, y=0.34375),(x=0.27884615384615385, y=0.40384615384615385),(x=0.2572115384615385, y=0.46153846153846156),(x=0.2139423076923077, y=0.5048076923076923),(x=0.15625, y=0.5264423076923077),(x=0.09855769230769232, y=0.5),(x=0.08413461538461539, y=0.4399038461538462),(x=0.10576923076923078, y=0.37980769230769235),(x=0.14182692307692307, y=0.3317307692307693),(x=0.1826923076923077, y=0.2884615384615385),(x=0.22836538461538464, y=0.24759615384615385),(x=0.27403846153846156, y=0.2091346153846154),(x=0.32211538461538464, y=0.17307692307692307),(x=0.36778846153846156, y=0.13461538461538464),(x=0.41586538461538464, y=0.09855769230769232),(x=0.4639423076923077, y=0.0625),(x=0.514423076923077, y=0.028846153846153848),(x=0.5673076923076923, y=0),(x=0.6201923076923077, y=0.026442307692307696),(x=0.6682692307692308, y=0.0625),(x=0.7091346153846154, y=0.10576923076923078),(x=0.7475961538461539, y=0.1514423076923077),(x=0.78125, y=0.20192307692307693),(x=0.8125, y=0.25480769230769235),(x=0.8413461538461539, y=0.31009615384615385),(x=0.858173076923077, y=0.36778846153846156),(x=0.8605769230769231, y=0.4278846153846154),(x=0.8317307692307693, y=0.4807692307692308),(x=0.7788461538461539, y=0.5096153846153847),(x=0.71875, y=0.5168269230769231),(x=0.6610576923076923, y=0.49759615384615385),(x=0.6418269230769231, y=0.4399038461538462),(x=0.6634615384615385, y=0.37980769230769235),(x=0.6995192307692308, y=0.3317307692307693),(x=0.7379807692307693, y=0.28605769230769235),(x=0.7788461538461539, y=0.2403846153846154),(x=0.8221153846153847, y=0.19471153846153846),(x=0.8653846153846154, y=0.1514423076923077),(x=0.9086538461538463, y=0.10817307692307693),(x=0.9543269230769231, y=0.06971153846153846),(x=1, y=0.028846153846153848)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_question" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.11019283746556474, y=0.4628099173553719),(x=0.06060606060606061, y=0.4104683195592287),(x=0.01928374655647383, y=0.3526170798898072),(x=0, y=0.2837465564738292),(x=0.0027548209366391185, y=0.21487603305785125),(x=0.024793388429752067, y=0.14600550964187328),(x=0.06336088154269973, y=0.0881542699724518),(x=0.11294765840220386, y=0.03581267217630854),(x=0.1763085399449036, y=0.008264462809917356),(x=0.24517906336088155, y=0),(x=0.3140495867768595, y=0.005509641873278237),(x=0.38016528925619836, y=0.024793388429752067),(x=0.44077134986225897, y=0.06060606060606061),(x=0.4903581267217631, y=0.11019283746556474),(x=0.5316804407713499, y=0.16804407713498623),(x=0.556473829201102, y=0.23415977961432508),(x=0.5674931129476584, y=0.30303030303030304),(x=0.556473829201102, y=0.371900826446281),(x=0.5289256198347108, y=0.43526170798898073),(x=0.487603305785124, y=0.4931129476584022),(x=0.4380165289256198, y=0.5426997245179064),(x=0.38292011019283745, y=0.5867768595041323),(x=0.3223140495867769, y=0.6225895316804408),(x=0.26170798898071623, y=0.6556473829201102),(x=0.2534435261707989, y=0.7245179063360881),(x=0.2534435261707989, y=0.7933884297520661),(x=0.2534435261707989, y=0.8622589531680441),(x=0.25895316804407714, y=0.9311294765840221),(x=0.26170798898071623, y=1)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_at" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.5544871794871795, y=0.30128205128205127),(x=0.47435897435897434, y=0.29166666666666663),(x=0.3942307692307692, y=0.3141025641025641),(x=0.32371794871794873, y=0.3557692307692308),(x=0.26282051282051283, y=0.41025641025641024),(x=0.21794871794871795, y=0.47756410256410253),(x=0.1923076923076923, y=0.5544871794871795),(x=0.20192307692307693, y=0.6346153846153846),(x=0.266025641025641, y=0.6826923076923077),(x=0.34615384615384615, y=0.6666666666666666),(x=0.41025641025641024, y=0.6185897435897436),(x=0.4647435897435897, y=0.5576923076923077),(x=0.49679487179487175, y=0.483974358974359),(x=0.5128205128205128, y=0.40384615384615385),(x=0.516025641025641, y=0.32371794871794873),(x=0.5128205128205128, y=0.40384615384615385),(x=0.5128205128205128, y=0.483974358974359),(x=0.5192307692307692, y=0.5641025641025641),(x=0.548076923076923, y=0.641025641025641),(x=0.5993589743589743, y=0.7051282051282051),(x=0.6794871794871795, y=0.6891025641025641),(x=0.7371794871794871, y=0.6346153846153846),(x=0.7756410256410257, y=0.5608974358974359),(x=0.798076923076923, y=0.4807692307692307),(x=0.798076923076923, y=0.4006410256410256),(x=0.782051282051282, y=0.3205128205128205),(x=0.7596153846153846, y=0.24038461538461536),(x=0.717948717948718, y=0.16987179487179488),(x=0.6634615384615384, y=0.10576923076923077),(x=0.5993589743589743, y=0.05448717948717949),(x=0.5224358974358975, y=0.016025641025641024),(x=0.4423076923076923, y=0),(x=0.36217948717948717, y=0.003205128205128205),(x=0.28205128205128205, y=0.028846153846153844),(x=0.21153846153846154, y=0.07051282051282051),(x=0.15064102564102563, y=0.1282051282051282),(x=0.10256410256410256, y=0.1923076923076923),(x=0.060897435897435896, y=0.26282051282051283),(x=0.028846153846153844, y=0.3365384615384615),(x=0.009615384615384616, y=0.41666666666666663),(x=0, y=0.49679487179487175),(x=0, y=0.5769230769230769),(x=0.016025641025641024, y=0.657051282051282),(x=0.041666666666666664, y=0.7339743589743589),(x=0.08012820512820512, y=0.8044871794871794),(x=0.1282051282051282, y=0.8653846153846153),(x=0.1858974358974359, y=0.9198717948717948),(x=0.2532051282051282, y=0.9615384615384615),(x=0.3269230769230769, y=0.9903846153846153),(x=0.40705128205128205, y=1),(x=0.48717948717948717, y=0.9903846153846153),(x=0.5608974358974359, y=0.9615384615384615),(x=0.6346153846153846, y=0.9294871794871794),(x=0.7051282051282051, y=0.8878205128205128)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_and" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.6458923512747876, y=0.8101983002832862),(x=0.5864022662889519, y=0.8498583569405099),(x=0.5212464589235127, y=0.8838526912181304),(x=0.45892351274787535, y=0.9206798866855525),(x=0.3909348441926346, y=0.9518413597733711),(x=0.32011331444759206, y=0.9745042492917847),(x=0.2492917847025496, y=0.9830028328611898),(x=0.1784702549575071, y=0.9716713881019831),(x=0.1104815864022663, y=0.943342776203966),(x=0.053824362606232294, y=0.8923512747875354),(x=0.014164305949008499, y=0.8271954674220964),(x=0, y=0.7563739376770539),(x=0.019830028328611898, y=0.6855524079320113),(x=0.056657223796033995, y=0.623229461756374),(x=0.1104815864022663, y=0.5750708215297451),(x=0.1671388101983003, y=0.5297450424929179),(x=0.2237960339943343, y=0.48441926345609065),(x=0.2719546742209632, y=0.4334277620396601),(x=0.311614730878187, y=0.37393767705382436),(x=0.33994334277620397, y=0.3059490084985836),(x=0.34844192634560905, y=0.2351274787535411),(x=0.3342776203966006, y=0.1643059490084986),(x=0.3059490084985836, y=0.0963172804532578),(x=0.26345609065155806, y=0.0368271954674221),(x=0.20113314447592068, y=0),(x=0.13031161473087818, y=0.0056657223796034),(x=0.0878186968838527, y=0.06515580736543909),(x=0.0736543909348442, y=0.1359773371104816),(x=0.08498583569405099, y=0.2067988668555241),(x=0.1104815864022663, y=0.2747875354107649),(x=0.14447592067988668, y=0.3371104815864023),(x=0.1813031161473088, y=0.39660056657223797),(x=0.2209631728045326, y=0.45609065155807366),(x=0.26062322946175637, y=0.5155807365439093),(x=0.3031161473087819, y=0.5694050991501417),(x=0.34844192634560905, y=0.623229461756374),(x=0.39660056657223797, y=0.6770538243626063),(x=0.4419263456090652, y=0.7337110481586403),(x=0.48441926345609065, y=0.7875354107648725),(x=0.5325779036827196, y=0.8413597733711049),(x=0.5779036827195467, y=0.8951841359773371),(x=0.6260623229461757, y=0.9490084985835695),(x=0.6770538243626063, y=1)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_partial" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.4250681198910082, y=0.6021798365122616),(x=0.3623978201634877, y=0.6321525885558583),(x=0.3079019073569482, y=0.6757493188010899),(x=0.2615803814713896, y=0.7275204359673024),(x=0.22888283378746593, y=0.7901907356948229),(x=0.21525885558583105, y=0.8583106267029973),(x=0.22343324250681199, y=0.9264305177111716),(x=0.2670299727520436, y=0.9782016348773842),(x=0.332425068119891, y=1),(x=0.40054495912806537, y=0.994550408719346),(x=0.4632152588555858, y=0.9645776566757492),(x=0.5177111716621253, y=0.9209809264305177),(x=0.555858310626703, y=0.8637602179836512),(x=0.5749318801089918, y=0.7956403269754768),(x=0.5858310626702997, y=0.7275204359673024),(x=0.5858310626702997, y=0.659400544959128),(x=0.5694822888283378, y=0.5912806539509536),(x=0.547683923705722, y=0.5258855585831063),(x=0.5149863760217983, y=0.4604904632152588),(x=0.47956403269754766, y=0.40054495912806537),(x=0.43869209809264303, y=0.3460490463215259),(x=0.39237057220708443, y=0.29155313351498635),(x=0.3433242506811989, y=0.24250681198910082),(x=0.29155313351498635, y=0.19346049046321526),(x=0.23705722070844687, y=0.14986376021798364),(x=0.17983651226158037, y=0.10899182561307902),(x=0.11989100817438691, y=0.07084468664850135),(x=0.05994550408719346, y=0.0326975476839237),(x=0, y=0)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					<Gesture id="symbol_integral" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.7635869565217391, y=0.05434782608695652),(x=0.7119565217391304, y=0.005434782608695652),(x=0.6440217391304348, y=0),(x=0.5760869565217391, y=0.024456521739130432),(x=0.5244565217391304, y=0.07065217391304347),(x=0.48641304347826086, y=0.1277173913043478),(x=0.4592391304347826, y=0.1902173913043478),(x=0.43478260869565216, y=0.2554347826086956),(x=0.41304347826086957, y=0.32065217391304346),(x=0.39402173913043476, y=0.38858695652173914),(x=0.375, y=0.4538043478260869),(x=0.3559782608695652, y=0.5217391304347826),(x=0.3342391304347826, y=0.5869565217391304),(x=0.31521739130434784, y=0.654891304347826),(x=0.296195652173913, y=0.720108695652174),(x=0.26902173913043476, y=0.7853260869565217),(x=0.2391304347826087, y=0.8478260869565217),(x=0.20652173913043478, y=0.9076086956521738),(x=0.16304347826086957, y=0.9619565217391304),(x=0.10597826086956522, y=1),(x=0.04076086956521739, y=0.9701086956521738),(x=0, y=0.9103260869565217)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_sum" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.5239179954441913, y=0.17995444191343962),(x=0.5239179954441913, y=0.12300683371298404),(x=0.521640091116173, y=0.06605922551252848),(x=0.521640091116173, y=0.009111617312072893),(x=0.4646924829157175, y=0),(x=0.4123006833712984, y=0.02733485193621868),(x=0.3644646924829157, y=0.0592255125284738),(x=0.31435079726651477, y=0.09111617312072892),(x=0.26879271070615035, y=0.12528473804100226),(x=0.22323462414578588, y=0.16173120728929385),(x=0.17539863325740318, y=0.1958997722095672),(x=0.13211845102505695, y=0.23462414578587698),(x=0.08656036446469248, y=0.2733485193621868),(x=0.04100227790432802, y=0.31207289293849655),(x=0, y=0.3530751708428246),(x=0.03416856492027335, y=0.4009111617312073),(x=0.08656036446469248, y=0.4259681093394077),(x=0.13895216400911162, y=0.44874715261959),(x=0.19134396355353075, y=0.4738041002277904),(x=0.24145785876993164, y=0.501138952164009),(x=0.29157175398633256, y=0.5284738041002278),(x=0.24373576309794986, y=0.5626423690205011),(x=0.1890660592255125, y=0.5854214123006833),(x=0.13895216400911162, y=0.612756264236902),(x=0.08656036446469248, y=0.6400911161731206),(x=0.03872437357630979, y=0.6719817767653758),(x=0.05694760820045558, y=0.7266514806378132),(x=0.10250569476082004, y=0.7608200455580866),(x=0.15034168564920272, y=0.7927107061503417),(x=0.1958997722095672, y=0.8246013667425968),(x=0.24145785876993164, y=0.8587699316628701),(x=0.28929384965831434, y=0.8906605922551253),(x=0.33940774487471526, y=0.9179954441913439),(x=0.3895216400911162, y=0.9476082004555808),(x=0.4396355353075171, y=0.9749430523917995),(x=0.49202733485193617, y=1),(x=0.5444191343963554, y=0.9726651480637812),(x=0.5421412300683371, y=0.9157175398633257),(x=0.5375854214123007, y=0.8587699316628701)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_square_root" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0.2602739726027397),(x=0.02968036529680365, y=0.3082191780821918),(x=0.0593607305936073, y=0.3561643835616438),(x=0.09360730593607305, y=0.40410958904109584),(x=0.1232876712328767, y=0.4520547945205479),(x=0.15753424657534246, y=0.4977168949771689),(x=0.18493150684931506, y=0.4452054794520548),(x=0.18493150684931506, y=0.3881278538812785),(x=0.18493150684931506, y=0.33105022831050224),(x=0.18036529680365296, y=0.273972602739726),(x=0.17579908675799086, y=0.21689497716894976),(x=0.17123287671232876, y=0.1598173515981735),(x=0.1689497716894977, y=0.10273972602739725),(x=0.1643835616438356, y=0.045662100456621),(x=0.2009132420091324, y=0),(x=0.25799086757990863, y=0),(x=0.3150684931506849, y=0),(x=0.3721461187214612, y=0),(x=0.4292237442922374, y=0),(x=0.48630136986301364, y=0.00228310502283105),(x=0.54337899543379, y=0.00228310502283105),(x=0.6004566210045662, y=0.00228310502283105),(x=0.6575342465753424, y=0.00228310502283105),(x=0.7146118721461187, y=0.00228310502283105),(x=0.7716894977168949, y=0.00684931506849315),(x=0.8287671232876712, y=0.00684931506849315),(x=0.8858447488584474, y=0.00684931506849315),(x=0.9429223744292237, y=0.0045662100456621),(x=1, y=0.00228310502283105)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_c_bracket_left" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.24619289340101522, y=0.050761421319796954),(x=0.2081218274111675, y=0),(x=0.1446700507614213, y=0.0025380710659898475),(x=0.10659898477157359, y=0.055837563451776644),(x=0.09644670050761421, y=0.11928934010152284),(x=0.09644670050761421, y=0.18274111675126903),(x=0.09644670050761421, y=0.24619289340101522),(x=0.08629441624365482, y=0.3096446700507614),(x=0.07106598984771573, y=0.37309644670050757),(x=0.04568527918781726, y=0.4314720812182741),(x=0, y=0.47715736040609136),(x=0.025380710659898477, y=0.5355329949238579),(x=0.055837563451776644, y=0.5939086294416244),(x=0.06852791878172589, y=0.6573604060913705),(x=0.07360406091370558, y=0.7208121827411167),(x=0.07868020304568528, y=0.7842639593908629),(x=0.08121827411167512, y=0.8477157360406091),(x=0.09390862944162436, y=0.9111675126903552),(x=0.11675126903553298, y=0.9720812182741116),(x=0.1751269035532995, y=0.9999999999999999),(x=0.2182741116751269, y=0.9517766497461928)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_c_bracket_right" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0.9693396226415094),(x=0.051886792452830184, y=1),(x=0.11084905660377357, y=0.9952830188679245),(x=0.14858490566037735, y=0.9481132075471698),(x=0.1650943396226415, y=0.8891509433962264),(x=0.17452830188679244, y=0.830188679245283),(x=0.17452830188679244, y=0.7712264150943396),(x=0.1721698113207547, y=0.7122641509433962),(x=0.1721698113207547, y=0.6533018867924528),(x=0.1792452830188679, y=0.5943396226415094),(x=0.205188679245283, y=0.5400943396226415),(x=0.23113207547169812, y=0.4858490566037736),(x=0.20283018867924527, y=0.43396226415094336),(x=0.18396226415094338, y=0.3773584905660377),(x=0.17452830188679244, y=0.31839622641509435),(x=0.17452830188679244, y=0.25943396226415094),(x=0.1792452830188679, y=0.20047169811320753),(x=0.18396226415094338, y=0.14150943396226415),(x=0.18396226415094338, y=0.08254716981132075),(x=0.16037735849056603, y=0.02830188679245283),(x=0.1061320754716981, y=0),(x=0.04952830188679245, y=0.02122641509433962)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_s_bracket_left" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.19704433497536947, y=0),(x=0.1354679802955665, y=0),(x=0.07389162561576355, y=0.0024630541871921183),(x=0.012315270935960592, y=0.019704433497536946),(x=0.007389162561576354, y=0.0812807881773399),(x=0.0049261083743842365, y=0.14285714285714285),(x=0.0024630541871921183, y=0.2044334975369458),(x=0, y=0.2660098522167488),(x=0, y=0.3275862068965517),(x=0, y=0.3891625615763547),(x=0, y=0.45073891625615764),(x=0.0024630541871921183, y=0.5123152709359606),(x=0.0049261083743842365, y=0.5738916256157636),(x=0.007389162561576354, y=0.6354679802955665),(x=0.007389162561576354, y=0.6970443349753694),(x=0.009852216748768473, y=0.7586206896551724),(x=0.012315270935960592, y=0.8201970443349754),(x=0.012315270935960592, y=0.8817733990147784),(x=0.014778325123152709, y=0.9433497536945813),(x=0.05172413793103448, y=0.9950738916256158),(x=0.11330049261083744, y=1)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_s_bracket_right" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0.0024509803921568627),(x=0.061274509803921566, y=0),(x=0.12009803921568628, y=0.01715686274509804),(x=0.12745098039215685, y=0.0784313725490196),(x=0.12990196078431374, y=0.13970588235294118),(x=0.12990196078431374, y=0.20098039215686275),(x=0.12745098039215685, y=0.2622549019607843),(x=0.12745098039215685, y=0.3235294117647059),(x=0.12990196078431374, y=0.38480392156862747),(x=0.1323529411764706, y=0.446078431372549),(x=0.1323529411764706, y=0.5073529411764706),(x=0.1323529411764706, y=0.5686274509803921),(x=0.13725490196078433, y=0.6299019607843137),(x=0.13970588235294118, y=0.6911764705882353),(x=0.13970588235294118, y=0.7524509803921569),(x=0.13480392156862744, y=0.8137254901960784),(x=0.1323529411764706, y=0.875),(x=0.1323529411764706, y=0.9362745098039216),(x=0.10784313725490197, y=0.9926470588235294),(x=0.04656862745098039, y=1)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_note" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.2860635696821516, y=0.7041564792176039),(x=0.22493887530562348, y=0.7114914425427873),(x=0.1687041564792176, y=0.7383863080684596),(x=0.11491442542787286, y=0.7701711491442543),(x=0.07334963325183375, y=0.8166259168704156),(x=0.04645476772616137, y=0.8728606356968215),(x=0.04645476772616137, y=0.9339853300733496),(x=0.08068459657701711, y=0.9853300733496333),(x=0.14180929095354522, y=1),(x=0.20293398533007334, y=0.9926650366748166),(x=0.2591687041564792, y=0.9682151589242054),(x=0.3080684596577017, y=0.9290953545232273),(x=0.3422982885085575, y=0.8753056234718827),(x=0.34963325183374083, y=0.8141809290953546),(x=0.3374083129584352, y=0.7530562347188264),(x=0.3202933985330073, y=0.6919315403422983),(x=0.30073349633251834, y=0.6308068459657702),(x=0.2787286063569682, y=0.5721271393643031),(x=0.254278728606357, y=0.5134474327628362),(x=0.22982885085574573, y=0.4547677261613692),(x=0.20537897310513448, y=0.3960880195599022),(x=0.1784841075794621, y=0.3374083129584352),(x=0.1491442542787286, y=0.28117359413202936),(x=0.1198044009779951, y=0.22493887530562348),(x=0.09046454767726161, y=0.16625916870415647),(x=0.061124694376528114, y=0.10757946210268948),(x=0.03178484107579462, y=0.05378973105134474),(x=0, y=0),(x=0.05134474327628362, y=0.03178484107579462),(x=0.1100244498777506, y=0.0488997555012225),(x=0.17114914425427874, y=0.05867970660146699),(x=0.23227383863080683, y=0.05867970660146699),(x=0.293398533007335, y=0.05378973105134474),(x=0.3545232273838631, y=0.03667481662591687)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="symbol_treble_clef" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.18952618453865336, y=0.7256857855361596),(x=0.12718204488778054, y=0.7231920199501247),(x=0.08229426433915212, y=0.6783042394014962),(x=0.10972568578553615, y=0.6209476309226932),(x=0.16458852867830423, y=0.5860349127182045),(x=0.22693266832917705, y=0.5910224438902743),(x=0.2793017456359102, y=0.6284289276807979),(x=0.3092269326683292, y=0.683291770573566),(x=0.3017456359102244, y=0.7456359102244389),(x=0.2543640897755611, y=0.7880299251870324),(x=0.1970074812967581, y=0.8154613466334164),(x=0.13466334164588528, y=0.8204488778054863),(x=0.07231920199501246, y=0.8079800498753117),(x=0.02493765586034913, y=0.7630922693266833),(x=0, y=0.7057356608478803),(x=0.0024937655860349127, y=0.6433915211970075),(x=0.02493765586034913, y=0.5835411471321695),(x=0.057356608478802994, y=0.5286783042394014),(x=0.09476309226932668, y=0.4763092269326683),(x=0.13216957605985036, y=0.4239401496259351),(x=0.16957605985037405, y=0.371571072319202),(x=0.18952618453865336, y=0.3092269326683292),(x=0.20199501246882792, y=0.24688279301745636),(x=0.20947630922693267, y=0.18453865336658354),(x=0.20947630922693267, y=0.12219451371571072),(x=0.20199501246882792, y=0.059850374064837904),(x=0.17955112219451372, y=0),(x=0.14713216957605985, y=0.05486284289276808),(x=0.14463840399002492, y=0.1172069825436409),(x=0.14713216957605985, y=0.17955112219451372),(x=0.1546134663341646, y=0.24189526184538654),(x=0.1596009975062344, y=0.30423940149625933),(x=0.16458852867830423, y=0.36658354114713215),(x=0.16957605985037405, y=0.428927680798005),(x=0.17206982543640897, y=0.4912718204488778),(x=0.1770573566084788, y=0.5536159600997506),(x=0.18204488778054861, y=0.6159600997506234),(x=0.18703241895261846, y=0.6783042394014962),(x=0.19451371571072318, y=0.740648379052369),(x=0.19451371571072318, y=0.8029925187032418),(x=0.19451371571072318, y=0.8653366583541147),(x=0.19201995012468828, y=0.9276807980049875),(x=0.18204488778054861, y=0.9900249376558603),(x=0.11970074812967581, y=1),(x=0.07481296758104738, y=0.9526184538653366)"/>
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
								<gesture_event type="stroke_symbol">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
		
		</Gesture_set>
		
		
		
		
		
		
		<Gesture_set id="stroke_numbers">
		
		
		
		
					<Gesture id="number_0" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.4532710280373831, y=0),(x=0.3948598130841121, y=0.002336448598130841),(x=0.3364485981308411, y=0.016355140186915886),(x=0.2780373831775701, y=0.035046728971962614),(x=0.22429906542056072, y=0.0630841121495327),(x=0.17757009345794392, y=0.10046728971962617),(x=0.13551401869158877, y=0.1425233644859813),(x=0.09813084112149532, y=0.18925233644859812),(x=0.06775700934579439, y=0.2406542056074766),(x=0.04439252336448598, y=0.29439252336448596),(x=0.02570093457943925, y=0.35046728971962615),(x=0.011682242990654205, y=0.40887850467289716),(x=0.002336448598130841, y=0.46728971962616817),(x=0, y=0.5257009345794392),(x=0, y=0.5841121495327103),(x=0.007009345794392522, y=0.6425233644859812),(x=0.02102803738317757, y=0.7009345794392523),(x=0.04439252336448598, y=0.7546728971962616),(x=0.07476635514018691, y=0.8060747663551401),(x=0.10981308411214953, y=0.8528037383177569),(x=0.15186915887850466, y=0.8948598130841121),(x=0.1985981308411215, y=0.9299065420560747),(x=0.24766355140186913, y=0.9579439252336448),(x=0.30140186915887845, y=0.9813084112149532),(x=0.3598130841121495, y=0.9953271028037383),(x=0.4182242990654205, y=0.9999999999999999),(x=0.47663551401869153, y=0.9929906542056074),(x=0.5350467289719626, y=0.9813084112149532),(x=0.5911214953271028, y=0.9626168224299064),(x=0.6448598130841121, y=0.9392523364485981),(x=0.6962616822429906, y=0.9088785046728971),(x=0.7406542056074766, y=0.8691588785046729),(x=0.7803738317757009, y=0.8247663551401868),(x=0.8107476635514018, y=0.7733644859813084),(x=0.8341121495327102, y=0.7172897196261682),(x=0.8504672897196262, y=0.6588785046728971),(x=0.8551401869158878, y=0.6004672897196262),(x=0.8551401869158878, y=0.5420560747663551),(x=0.8481308411214953, y=0.4836448598130841),(x=0.836448598130841, y=0.4252336448598131),(x=0.8154205607476634, y=0.366822429906542),(x=0.7967289719626167, y=0.308411214953271),(x=0.7663551401869159, y=0.2546728971962617),(x=0.7359813084112149, y=0.20093457943925233),(x=0.7009345794392523, y=0.15186915887850466),(x=0.661214953271028, y=0.10747663551401869),(x=0.616822429906542, y=0.06542056074766354),(x=0.5654205607476636, y=0.03271028037383177),(x=0.5070093457943925, y=0.011682242990654205),(x=0.44859813084112143, y=0.002336448598130841),(x=0.3901869158878504, y=0.007009345794392522)"/>
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
								<gesture_event type="stroke_number">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="number_1" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0.1552941176470588),(x=0.05411764705882353, y=0.12705882352941175),(x=0.0988235294117647, y=0.08941176470588234),(x=0.14352941176470588, y=0.047058823529411764),(x=0.18117647058823527, y=0),(x=0.19058823529411764, y=0.0588235294117647),(x=0.18823529411764706, y=0.1176470588235294),(x=0.18352941176470586, y=0.1764705882352941),(x=0.18117647058823527, y=0.2352941176470588),(x=0.1764705882352941, y=0.2941176470588235),(x=0.17411764705882352, y=0.3529411764705882),(x=0.17176470588235293, y=0.4117647058823529),(x=0.16941176470588235, y=0.4705882352941176),(x=0.16941176470588235, y=0.5294117647058824),(x=0.16941176470588235, y=0.588235294117647),(x=0.16941176470588235, y=0.6470588235294117),(x=0.17176470588235293, y=0.7058823529411764),(x=0.17176470588235293, y=0.7647058823529411),(x=0.17176470588235293, y=0.8235294117647058),(x=0.17411764705882352, y=0.8823529411764706),(x=0.1788235294117647, y=0.9411764705882352),(x=0.18117647058823527, y=0.9999999999999999)"/>
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
								<gesture_event type="stroke_number">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="number_2" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0.23560209424083772),(x=0.03141361256544503, y=0.1780104712041885),(x=0.07329842931937174, y=0.12565445026178013),(x=0.12303664921465969, y=0.07853403141361257),(x=0.18062827225130892, y=0.044502617801047126),(x=0.24345549738219896, y=0.020942408376963352),(x=0.3089005235602094, y=0.005235602094240838),(x=0.37434554973821993, y=0),(x=0.4397905759162304, y=0.007853403141361258),(x=0.4947643979057592, y=0.044502617801047126),(x=0.5340314136125655, y=0.09947643979057592),(x=0.5549738219895288, y=0.16230366492146597),(x=0.5575916230366492, y=0.22774869109947646),(x=0.5445026178010471, y=0.29319371727748694),(x=0.5287958115183247, y=0.3586387434554974),(x=0.5078534031413613, y=0.42146596858638746),(x=0.4816753926701571, y=0.4842931937172775),(x=0.45287958115183247, y=0.5445026178010471),(x=0.418848167539267, y=0.6020942408376964),(x=0.3848167539267016, y=0.6596858638743456),(x=0.3455497382198953, y=0.712041884816754),(x=0.3089005235602094, y=0.7670157068062827),(x=0.2670157068062827, y=0.8193717277486912),(x=0.22251308900523561, y=0.8691099476439791),(x=0.1780104712041885, y=0.9188481675392671),(x=0.12565445026178013, y=0.9607329842931938),(x=0.07329842931937174, y=1),(x=0.1387434554973822, y=1),(x=0.2041884816753927, y=0.9921465968586388),(x=0.2696335078534032, y=0.9869109947643979),(x=0.33507853403141363, y=0.9842931937172775),(x=0.4005235602094241, y=0.9816753926701571),(x=0.4659685863874346, y=0.9816753926701571),(x=0.5314136125654451, y=0.9816753926701571),(x=0.5968586387434556, y=0.9816753926701571),(x=0.662303664921466, y=0.9816753926701571),(x=0.7277486910994765, y=0.9816753926701571)"/>
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
								<gesture_event type="stroke_number">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="number_3" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0.10684931506849316),(x=0.0547945205479452, y=0.06301369863013699),(x=0.1178082191780822, y=0.030136986301369864),(x=0.18356164383561643, y=0.010958904109589041),(x=0.25205479452054796, y=0),(x=0.32054794520547947, y=0.0027397260273972603),(x=0.38904109589041097, y=0.016438356164383564),(x=0.4465753424657534, y=0.052054794520547946),(x=0.4958904109589041, y=0.10136986301369863),(x=0.5315068493150685, y=0.16164383561643836),(x=0.5506849315068493, y=0.2273972602739726),(x=0.547945205479452, y=0.2958904109589041),(x=0.5232876712328767, y=0.36164383561643837),(x=0.4794520547945206, y=0.4136986301369863),(x=0.4246575342465753, y=0.4547945205479452),(x=0.3589041095890411, y=0.4821917808219178),(x=0.29315068493150687, y=0.5068493150684932),(x=0.22465753424657534, y=0.5232876712328767),(x=0.29315068493150687, y=0.5068493150684932),(x=0.36164383561643837, y=0.5013698630136987),(x=0.4301369863013699, y=0.5068493150684932),(x=0.4931506849315069, y=0.5342465753424658),(x=0.5506849315068493, y=0.5698630136986301),(x=0.5917808219178082, y=0.6246575342465753),(x=0.6164383561643836, y=0.6904109589041096),(x=0.6109589041095891, y=0.7589041095890411),(x=0.5835616438356165, y=0.821917808219178),(x=0.5424657534246575, y=0.8767123287671232),(x=0.4904109589041096, y=0.9205479452054794),(x=0.4301369863013699, y=0.9561643835616438),(x=0.36712328767123287, y=0.9863013698630138),(x=0.29863013698630136, y=1),(x=0.23013698630136986, y=1),(x=0.16164383561643836, y=0.9835616438356164),(x=0.09863013698630137, y=0.9506849315068493)"/>
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
								<gesture_event type="stroke_number">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="number_4" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.007272727272727273, y=0),(x=0.014545454545454545, y=0.09090909090909091),(x=0.014545454545454545, y=0.18181818181818182),(x=0.014545454545454545, y=0.2727272727272727),(x=0.01090909090909091, y=0.36363636363636365),(x=0.007272727272727273, y=0.45454545454545453),(x=0.0036363636363636364, y=0.5454545454545454),(x=0, y=0.6363636363636364),(x=0, y=0.7272727272727273),(x=0, y=0.8181818181818182),(x=0.01090909090909091, y=0.9090909090909091),(x=0.09090909090909091, y=0.9563636363636364),(x=0.18181818181818182, y=0.9563636363636364),(x=0.2727272727272727, y=0.9563636363636364),(x=0.36363636363636365, y=0.9563636363636364),(x=0.45454545454545453, y=0.96),(x=0.5454545454545454, y=0.9636363636363636),(x=0.6363636363636364, y=0.9709090909090909),(x=0.7272727272727273, y=0.9709090909090909),(x=0.8181818181818182, y=0.9781818181818182),(x=0.9090909090909091, y=0.9781818181818182),(x=1, y=0.9818181818181818)"/>
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
								<gesture_event type="stroke_number">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="number_5" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.6368563685636857, y=0.008130081300813007),(x=0.5691056910569106, y=0),(x=0.5013550135501355, y=0),(x=0.43360433604336046, y=0.0027100271002710027),(x=0.36585365853658536, y=0.008130081300813007),(x=0.2981029810298103, y=0.01084010840108401),(x=0.23035230352303523, y=0.01084010840108401),(x=0.16260162601626016, y=0.013550135501355014),(x=0.0948509485094851, y=0.01084010840108401),(x=0.02710027100271003, y=0.008130081300813007),(x=0, y=0.07046070460704607),(x=0, y=0.13821138211382114),(x=0, y=0.20596205962059622),(x=0.005420054200542005, y=0.27371273712737126),(x=0.005420054200542005, y=0.34146341463414637),(x=0.005420054200542005, y=0.4092140921409214),(x=0.008130081300813007, y=0.47696476964769646),(x=0.07317073170731707, y=0.45799457994579945),(x=0.13821138211382114, y=0.4363143631436314),(x=0.20596205962059622, y=0.4254742547425474),(x=0.27371273712737126, y=0.4146341463414634),(x=0.34146341463414637, y=0.41192411924119243),(x=0.4092140921409214, y=0.41192411924119243),(x=0.47696476964769646, y=0.42005420054200543),(x=0.5420054200542005, y=0.4444444444444444),(x=0.5934959349593496, y=0.48509485094850946),(x=0.6287262872628726, y=0.5447154471544715),(x=0.6476964769647696, y=0.6124661246612466),(x=0.6476964769647696, y=0.6802168021680217),(x=0.6368563685636857, y=0.7479674796747967),(x=0.6097560975609756, y=0.8102981029810298),(x=0.5691056910569106, y=0.8672086720867209),(x=0.5176151761517616, y=0.9132791327913279),(x=0.45528455284552843, y=0.948509485094851),(x=0.3902439024390244, y=0.975609756097561),(x=0.3224932249322493, y=0.994579945799458),(x=0.25474254742547425, y=1),(x=0.18699186991869918, y=0.994579945799458),(x=0.11924119241192412, y=0.967479674796748),(x=0.05962059620596206, y=0.9322493224932249),(x=0.008130081300813007, y=0.8834688346883469)"/>
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
								<gesture_event type="stroke_number">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="number_6" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.5736040609137055, y=0),(x=0.5101522842639593, y=0),(x=0.44670050761421315, y=0.0076142131979695426),(x=0.383248730964467, y=0.02284263959390863),(x=0.3223350253807106, y=0.04568527918781726),(x=0.2639593908629441, y=0.07614213197969542),(x=0.21319796954314718, y=0.11421319796954314),(x=0.16751269035532992, y=0.15989847715736039),(x=0.12944162436548223, y=0.21065989847715735),(x=0.09390862944162436, y=0.2639593908629441),(x=0.06345177664974619, y=0.31979695431472077),(x=0.04060913705583756, y=0.38071065989847713),(x=0.02284263959390863, y=0.4441624365482233),(x=0.005076142131979695, y=0.5076142131979695),(x=0, y=0.5710659898477157),(x=0, y=0.6345177664974618),(x=0.005076142131979695, y=0.697969543147208),(x=0.017766497461928932, y=0.7614213197969543),(x=0.03807106598984771, y=0.8223350253807106),(x=0.06852791878172589, y=0.8781725888324873),(x=0.10913705583756345, y=0.9238578680203045),(x=0.15736040609137056, y=0.9670050761421319),(x=0.21573604060913704, y=0.9898477157360406),(x=0.27918781725888325, y=0.9999999999999999),(x=0.3426395939086294, y=0.9974619289340101),(x=0.4035532994923858, y=0.9771573604060912),(x=0.45685279187817257, y=0.9441624365482233),(x=0.5050761421319797, y=0.9010152284263959),(x=0.5406091370558376, y=0.8451776649746192),(x=0.5634517766497461, y=0.781725888324873),(x=0.5634517766497461, y=0.7182741116751269),(x=0.5456852791878172, y=0.6573604060913705),(x=0.5076142131979695, y=0.6040609137055837),(x=0.4543147208121827, y=0.565989847715736),(x=0.39340101522842635, y=0.5431472081218274),(x=0.3299492385786802, y=0.5431472081218274),(x=0.26903553299492383, y=0.5634517766497461),(x=0.2182741116751269, y=0.6040609137055837),(x=0.18274111675126903, y=0.6573604060913705),(x=0.16243654822335024, y=0.7182741116751269)"/>
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
								<gesture_event type="stroke_number">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="number_7" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0),(x=0.057870370370370364, y=0.0023148148148148147),(x=0.11574074074074073, y=0.0023148148148148147),(x=0.1736111111111111, y=0.006944444444444444),(x=0.23148148148148145, y=0.006944444444444444),(x=0.28935185185185186, y=0.006944444444444444),(x=0.3472222222222222, y=0.009259259259259259),(x=0.40509259259259256, y=0.009259259259259259),(x=0.4629629629629629, y=0.006944444444444444),(x=0.5208333333333333, y=0.004629629629629629),(x=0.5787037037037037, y=0.0023148148148148147),(x=0.6365740740740741, y=0),(x=0.6342592592592592, y=0.057870370370370364),(x=0.599537037037037, y=0.10416666666666666),(x=0.5671296296296297, y=0.15277777777777776),(x=0.5347222222222222, y=0.19907407407407407),(x=0.5023148148148148, y=0.24768518518518517),(x=0.4699074074074074, y=0.2962962962962963),(x=0.43981481481481477, y=0.3472222222222222),(x=0.4074074074074074, y=0.3958333333333333),(x=0.37731481481481477, y=0.4444444444444444),(x=0.3472222222222222, y=0.49537037037037035),(x=0.3171296296296296, y=0.5439814814814814),(x=0.28935185185185186, y=0.5949074074074073),(x=0.2569444444444444, y=0.6435185185185185),(x=0.22685185185185183, y=0.6944444444444444),(x=0.19907407407407407, y=0.7476851851851851),(x=0.16898148148148148, y=0.798611111111111),(x=0.1388888888888889, y=0.849537037037037),(x=0.1087962962962963, y=0.9004629629629629),(x=0.07870370370370369, y=0.9513888888888888),(x=0.046296296296296294, y=1)"/>
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
								<gesture_event type="stroke_number">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="number_8" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.29234338747099764, y=0),(x=0.23665893271461716, y=0.016241299303944315),(x=0.18561484918793503, y=0.048723897911832945),(x=0.13921113689095127, y=0.08584686774941995),(x=0.10440835266821345, y=0.13225058004640372),(x=0.08352668213457076, y=0.18793503480278423),(x=0.08120649651972157, y=0.2459396751740139),(x=0.09280742459396751, y=0.3039443155452436),(x=0.12529002320185614, y=0.35266821345707655),(x=0.16937354988399073, y=0.38979118329466356),(x=0.22041763341067283, y=0.419953596287703),(x=0.27610208816705334, y=0.44083526682134566),(x=0.32946635730858465, y=0.46171693735498837),(x=0.382830626450116, y=0.48491879350348027),(x=0.4361948955916473, y=0.5104408352668213),(x=0.48259860788863107, y=0.54292343387471),(x=0.5243619489559165, y=0.5846867749419953),(x=0.5545243619489559, y=0.6357308584686775),(x=0.5754060324825986, y=0.691415313225058),(x=0.5870069605568445, y=0.7494199535962877),(x=0.5823665893271461, y=0.8074245939675173),(x=0.5638051044083526, y=0.8631090487238979),(x=0.5243619489559165, y=0.9071925754060325),(x=0.4756380510440835, y=0.9419953596287702),(x=0.42227378190255216, y=0.9675174013921113),(x=0.3642691415313225, y=0.988399071925754),(x=0.3062645011600928, y=1),(x=0.24825986078886308, y=1),(x=0.1902552204176334, y=0.9860788863109048),(x=0.1345707656612529, y=0.962877030162413),(x=0.08816705336426914, y=0.925754060324826),(x=0.048723897911832945, y=0.8793503480278422),(x=0.016241299303944315, y=0.8283062645011601),(x=0, y=0.7726218097447796),(x=0, y=0.7146171693735499),(x=0.018561484918793503, y=0.6566125290023201),(x=0.048723897911832945, y=0.605568445475638),(x=0.09048723897911833, y=0.5614849187935035),(x=0.13689095127610207, y=0.5243619489559165),(x=0.18561484918793503, y=0.494199535962877),(x=0.23665893271461716, y=0.46635730858468677),(x=0.2900232018561485, y=0.44315545243619486),(x=0.3433874709976798, y=0.4153132250580046),(x=0.39443155452436196, y=0.38515081206496515),(x=0.4385150812064965, y=0.345707656612529),(x=0.46867749419953597, y=0.29234338747099764),(x=0.4733178654292343, y=0.23433874709976799),(x=0.46867749419953597, y=0.17633410672853828),(x=0.45011600928074247, y=0.11832946635730858),(x=0.4176334106728538, y=0.06728538283062645),(x=0.37354988399071926, y=0.025522041763341066),(x=0.31554524361948955, y=0.01160092807424594)"/>
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
								<gesture_event type="stroke_number">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
					
					<Gesture id="number_9" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.39913232104121477, y=0.026030368763557486),(x=0.3449023861171367, y=0.008676789587852495),(x=0.29067245119305857, y=0),(x=0.2364425162689805, y=0.004338394793926247),(x=0.1822125813449024, y=0.01735357917570499),(x=0.1301518438177874, y=0.036876355748373106),(x=0.0824295010845987, y=0.06724511930585683),(x=0.04338394793926247, y=0.10629067245119306),(x=0.015184381778741866, y=0.1540130151843818),(x=0, y=0.2082429501084599),(x=0, y=0.26247288503253796),(x=0.010845986984815618, y=0.3167028199566161),(x=0.039045553145336226, y=0.36225596529284165),(x=0.08026030368763558, y=0.3969631236442516),(x=0.13232104121475055, y=0.4164859002169198),(x=0.18655097613882865, y=0.420824295010846),(x=0.24078091106290672, y=0.40563991323210413),(x=0.2885032537960954, y=0.37960954446854667),(x=0.32537960954446854, y=0.3405639913232104),(x=0.3557483731019523, y=0.2928416485900217),(x=0.3774403470715835, y=0.24078091106290672),(x=0.3926247288503254, y=0.18655097613882865),(x=0.39479392624728854, y=0.13232104121475055),(x=0.39479392624728854, y=0.07809110629067245),(x=0.39479392624728854, y=0.13232104121475055),(x=0.3969631236442516, y=0.18655097613882865),(x=0.3969631236442516, y=0.24078091106290672),(x=0.3969631236442516, y=0.29501084598698485),(x=0.3969631236442516, y=0.3492407809110629),(x=0.3969631236442516, y=0.403470715835141),(x=0.3969631236442516, y=0.4577006507592191),(x=0.3926247288503254, y=0.5119305856832972),(x=0.3926247288503254, y=0.5661605206073753),(x=0.39045553145336226, y=0.6203904555314533),(x=0.39045553145336226, y=0.6746203904555315),(x=0.39045553145336226, y=0.7288503253796096),(x=0.3969631236442516, y=0.7830802603036877),(x=0.3969631236442516, y=0.8373101952277657),(x=0.3969631236442516, y=0.8915401301518439),(x=0.3969631236442516, y=0.945770065075922),(x=0.39913232104121477, y=1)"/>
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
								<gesture_event type="stroke_number">
									<property ref="stroke_x"/>
									<property ref="stroke_y"/>
									<property ref="stroke_prob"/>
								</gesture_event>
							</update>
						</mapping>
					</Gesture>
		</Gesture_set>
		
		
		
		
		<Gesture_set id="stroke_shapes">	
			
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
			
			<Gesture id="infinity" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.3076923076923077, y=0.004273504273504274),(x=0.2542735042735043, y=0),(x=0.20085470085470086, y=0.012820512820512822),(x=0.15170940170940173, y=0.03418803418803419),(x=0.10256410256410257, y=0.05982905982905984),(x=0.05982905982905984, y=0.09401709401709403),(x=0.02777777777777778, y=0.13675213675213677),(x=0.008547008547008548, y=0.18803418803418806),(x=0, y=0.24145299145299148),(x=0, y=0.2948717948717949),(x=0.004273504273504274, y=0.34829059829059833),(x=0.021367521367521368, y=0.3995726495726496),(x=0.05128205128205129, y=0.4444444444444445),(x=0.08974358974358976, y=0.4786324786324787),(x=0.13675213675213677, y=0.5042735042735044),(x=0.1901709401709402, y=0.514957264957265),(x=0.2435897435897436, y=0.5085470085470086),(x=0.2905982905982906, y=0.48076923076923084),(x=0.33333333333333337, y=0.4487179487179488),(x=0.373931623931624, y=0.4123931623931624),(x=0.4102564102564103, y=0.3717948717948718),(x=0.4444444444444445, y=0.3290598290598291),(x=0.4764957264957265, y=0.28632478632478636),(x=0.5106837606837608, y=0.2435897435897436),(x=0.5427350427350428, y=0.19871794871794873),(x=0.5747863247863249, y=0.155982905982906),(x=0.6111111111111112, y=0.11538461538461539),(x=0.6517094017094017, y=0.07905982905982907),(x=0.6965811965811967, y=0.047008547008547015),(x=0.747863247863248, y=0.02777777777777778),(x=0.8012820512820513, y=0.025641025641025644),(x=0.8525641025641026, y=0.042735042735042736),(x=0.8974358974358976, y=0.07051282051282053),(x=0.9380341880341881, y=0.10470085470085472),(x=0.9679487179487181, y=0.14743589743589744),(x=0.9914529914529916, y=0.1965811965811966),(x=1, y=0.25),(x=0.9935897435897437, y=0.30341880341880345),(x=0.9743589743589745, y=0.3547008547008547),(x=0.9487179487179488, y=0.4017094017094017),(x=0.9166666666666667, y=0.4444444444444445),(x=0.8760683760683762, y=0.48290598290598297),(x=0.826923076923077, y=0.5106837606837608),(x=0.7735042735042735, y=0.514957264957265),(x=0.7222222222222223, y=0.4957264957264958),(x=0.6816239316239316, y=0.45940170940170943),(x=0.638888888888889, y=0.42521367521367526),(x=0.6047008547008548, y=0.3824786324786325),(x=0.5705128205128206, y=0.33760683760683763),(x=0.5384615384615385, y=0.2905982905982906),(x=0.5064102564102565, y=0.2478632478632479),(x=0.4743589743589744, y=0.20085470085470086),(x=0.4465811965811966, y=0.15384615384615385),(x=0.41452991452991456, y=0.10683760683760685),(x=0.3824786324786325, y=0.061965811965811975),(x=0.34401709401709407, y=0.023504273504273508),(x=0.2948717948717949, y=0.002136752136752137)"/>
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
			
			<Gesture id="wave" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0.4302670623145401),(x=0.008902077151335312, y=0.3560830860534125),(x=0.02967359050445104, y=0.28486646884273),(x=0.050445103857566766, y=0.21364985163204747),(x=0.08605341246290801, y=0.1483679525222552),(x=0.12462908011869436, y=0.08308605341246292),(x=0.18100890207715134, y=0.032640949554896145),(x=0.24925816023738873, y=0),(x=0.32344213649851633, y=0.002967359050445104),(x=0.3827893175074184, y=0.04451038575667656),(x=0.42136498516320475, y=0.10682492581602374),(x=0.4480712166172107, y=0.17507418397626112),(x=0.4629080118694362, y=0.24925816023738873),(x=0.4807121661721068, y=0.32344213649851633),(x=0.49554896142433236, y=0.39762611275964393),(x=0.513353115727003, y=0.47181008902077154),(x=0.5370919881305638, y=0.543026706231454),(x=0.56973293768546, y=0.6112759643916914),(x=0.6083086053412463, y=0.6765578635014837),(x=0.6617210682492581, y=0.7299703264094956),(x=0.7329376854599406, y=0.7566765578635015),(x=0.8071216617210683, y=0.7448071216617211),(x=0.8694362017804155, y=0.7032640949554897),(x=0.9198813056379822, y=0.6498516320474778),(x=0.9554896142433235, y=0.5816023738872403),(x=0.9821958456973294, y=0.5074183976261127),(x=1, y=0.4332344213649852)"/>
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
			
			<Gesture id="circle" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.535483870967742, y=0.008602150537634409),(x=0.48172043010752685, y=0),(x=0.42795698924731185, y=0.0064516129032258064),(x=0.3741935483870968, y=0.01935483870967742),(x=0.3225806451612903, y=0.03655913978494624),(x=0.26881720430107525, y=0.05591397849462366),(x=0.221505376344086, y=0.08387096774193549),(x=0.17634408602150536, y=0.11612903225806452),(x=0.13333333333333333, y=0.15268817204301074),(x=0.0989247311827957, y=0.1956989247311828),(x=0.06666666666666667, y=0.23870967741935484),(x=0.043010752688172046, y=0.28817204301075267),(x=0.025806451612903226, y=0.33978494623655914),(x=0.012903225806451613, y=0.3935483870967742),(x=0.0064516129032258064, y=0.44731182795698926),(x=0, y=0.5010752688172043),(x=0, y=0.5548387096774193),(x=0.0064516129032258064, y=0.6086021505376344),(x=0.017204301075268817, y=0.6623655913978495),(x=0.03655913978494624, y=0.7139784946236559),(x=0.06021505376344086, y=0.7634408602150538),(x=0.09032258064516129, y=0.8064516129032258),(x=0.12473118279569892, y=0.8473118279569892),(x=0.16559139784946236, y=0.8838709677419355),(x=0.2086021505376344, y=0.9161290322580645),(x=0.25806451612903225, y=0.9419354838709677),(x=0.30752688172043013, y=0.9655913978494624),(x=0.35913978494623655, y=0.9827956989247312),(x=0.4129032258064516, y=0.9935483870967742),(x=0.4666666666666667, y=1),(x=0.5204301075268817, y=1),(x=0.5741935483870968, y=1),(x=0.6279569892473118, y=0.9956989247311828),(x=0.6795698924731183, y=0.9763440860215054),(x=0.7290322580645161, y=0.9505376344086022),(x=0.7698924731182796, y=0.9161290322580645),(x=0.8086021505376344, y=0.8774193548387097),(x=0.843010752688172, y=0.8344086021505376),(x=0.8709677419354839, y=0.7870967741935484),(x=0.896774193548387, y=0.7376344086021506),(x=0.9182795698924732, y=0.6881720430107527),(x=0.9311827956989247, y=0.6344086021505376),(x=0.9419354838709677, y=0.5806451612903226),(x=0.9440860215053763, y=0.5268817204301075),(x=0.9419354838709677, y=0.4731182795698925),(x=0.9311827956989247, y=0.41935483870967744),(x=0.9182795698924732, y=0.3655913978494624),(x=0.8946236559139785, y=0.3139784946236559),(x=0.8709677419354839, y=0.2645161290322581),(x=0.843010752688172, y=0.2172043010752688),(x=0.810752688172043, y=0.17419354838709677),(x=0.7720430107526882, y=0.13333333333333333),(x=0.7290322580645161, y=0.09462365591397849),(x=0.6838709677419355, y=0.06236559139784946),(x=0.6365591397849463, y=0.03225806451612903),(x=0.5870967741935483, y=0.008602150537634409),(x=0.5333333333333333, y=0)"/>
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
			
			<Gesture id="square" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.02127659574468085, y=0),(x=0.10992907801418439, y=0.0035460992907801418),(x=0.19858156028368795, y=0.010638297872340425),(x=0.28723404255319146, y=0.010638297872340425),(x=0.375886524822695, y=0.017730496453900707),(x=0.4645390070921986, y=0.02127659574468085),(x=0.5531914893617021, y=0.024822695035460994),(x=0.6418439716312057, y=0.024822695035460994),(x=0.7304964539007092, y=0.02127659574468085),(x=0.8191489361702128, y=0.017730496453900707),(x=0.9078014184397163, y=0.014184397163120567),(x=0.9822695035460993, y=0.0673758865248227),(x=0.9787234042553191, y=0.15602836879432624),(x=0.975177304964539, y=0.24468085106382978),(x=0.975177304964539, y=0.3333333333333333),(x=0.975177304964539, y=0.4219858156028369),(x=0.975177304964539, y=0.5106382978723404),(x=0.975177304964539, y=0.599290780141844),(x=0.9787234042553191, y=0.6879432624113475),(x=0.9787234042553191, y=0.776595744680851),(x=0.9787234042553191, y=0.8652482269503546),(x=0.975177304964539, y=0.9539007092198581),(x=0.8900709219858156, y=0.9858156028368794),(x=0.801418439716312, y=0.9929078014184397),(x=0.7127659574468085, y=1),(x=0.624113475177305, y=1),(x=0.5354609929078014, y=1),(x=0.44680851063829785, y=1),(x=0.35815602836879434, y=1),(x=0.2695035460992908, y=0.9964539007092198),(x=0.18085106382978722, y=0.9964539007092198),(x=0.09219858156028368, y=0.9964539007092198),(x=0.0035460992907801418, y=0.9858156028368794),(x=0.0035460992907801418, y=0.8971631205673759),(x=0.0070921985815602835, y=0.8085106382978723),(x=0.0070921985815602835, y=0.7198581560283688),(x=0.0070921985815602835, y=0.6312056737588653),(x=0.0070921985815602835, y=0.5425531914893617),(x=0.0070921985815602835, y=0.45390070921985815),(x=0.0070921985815602835, y=0.3652482269503546),(x=0.0070921985815602835, y=0.2765957446808511),(x=0.0035460992907801418, y=0.1879432624113475),(x=0, y=0.09929078014184398)"/>
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
			
			<Gesture id="arc_up" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0.46428571428571425),(x=0.015625, y=0.4107142857142857),(x=0.033482142857142856, y=0.35491071428571425),(x=0.06026785714285714, y=0.30357142857142855),(x=0.08705357142857142, y=0.2544642857142857),(x=0.12053571428571427, y=0.20982142857142855),(x=0.15625, y=0.16741071428571427),(x=0.1919642857142857, y=0.12276785714285714),(x=0.234375, y=0.08705357142857142),(x=0.28125, y=0.055803571428571425),(x=0.3325892857142857, y=0.03125),(x=0.38616071428571425, y=0.011160714285714284),(x=0.4419642857142857, y=0.002232142857142857),(x=0.4977678571428571, y=0),(x=0.5535714285714285, y=0),(x=0.6071428571428571, y=0.015625),(x=0.6584821428571428, y=0.03571428571428571),(x=0.7075892857142857, y=0.0625),(x=0.7522321428571428, y=0.09598214285714285),(x=0.7924107142857142, y=0.13169642857142858),(x=0.8325892857142857, y=0.16964285714285712),(x=0.8705357142857142, y=0.21205357142857142),(x=0.9040178571428571, y=0.2544642857142857),(x=0.9375, y=0.29910714285714285),(x=0.9665178571428571, y=0.3482142857142857),(x=0.984375, y=0.40178571428571425),(x=1, y=0.45535714285714285)"/>
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
			
			<Gesture id="arc_down" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0),(x=0.00684931506849315, y=0.05707762557077625),(x=0.0136986301369863, y=0.1141552511415525),(x=0.02968036529680365, y=0.1689497716894977),(x=0.05251141552511415, y=0.22146118721461186),(x=0.07990867579908675, y=0.271689497716895),(x=0.1141552511415525, y=0.3150684931506849),(x=0.15296803652968036, y=0.3561643835616438),(x=0.1963470319634703, y=0.39497716894977164),(x=0.24429223744292236, y=0.42237442922374424),(x=0.29452054794520544, y=0.4474885844748858),(x=0.34931506849315064, y=0.46803652968036524),(x=0.40410958904109584, y=0.4840182648401826),(x=0.4611872146118721, y=0.4908675799086758),(x=0.5182648401826484, y=0.4908675799086758),(x=0.5753424657534246, y=0.4840182648401826),(x=0.6324200913242009, y=0.4726027397260274),(x=0.687214611872146, y=0.454337899543379),(x=0.7397260273972602, y=0.43150684931506844),(x=0.7922374429223744, y=0.40410958904109584),(x=0.8378995433789954, y=0.36757990867579904),(x=0.8789954337899543, y=0.3264840182648402),(x=0.9155251141552511, y=0.2808219178082192),(x=0.9429223744292237, y=0.228310502283105),(x=0.9680365296803652, y=0.1735159817351598),(x=0.9885844748858447, y=0.1187214611872146),(x=1, y=0.06164383561643835),(x=1, y=0.0045662100456621)"/>
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
			
			<Gesture id="traingle_up" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0.7740259740259741),(x=0.02857142857142857, y=0.7116883116883117),(x=0.06493506493506493, y=0.6571428571428571),(x=0.0987012987012987, y=0.6),(x=0.13246753246753246, y=0.5428571428571428),(x=0.16883116883116883, y=0.4883116883116883),(x=0.2, y=0.42857142857142855),(x=0.23636363636363636, y=0.37402597402597404),(x=0.2727272727272727, y=0.3168831168831169),(x=0.3116883116883117, y=0.2623376623376623),(x=0.35324675324675325, y=0.21038961038961038),(x=0.38961038961038963, y=0.15584415584415584),(x=0.43116883116883115, y=0.1038961038961039),(x=0.4727272727272727, y=0.05194805194805195),(x=0.5116883116883116, y=0),(x=0.5714285714285714, y=0.02857142857142857),(x=0.6051948051948052, y=0.08571428571428572),(x=0.6363636363636364, y=0.14285714285714285),(x=0.6675324675324675, y=0.2025974025974026),(x=0.7012987012987013, y=0.2597402597402597),(x=0.7402597402597403, y=0.3090909090909091),(x=0.7792207792207793, y=0.36103896103896105),(x=0.8155844155844156, y=0.4155844155844156),(x=0.8467532467532467, y=0.4727272727272727),(x=0.8779220779220779, y=0.5298701298701298),(x=0.9090909090909091, y=0.587012987012987),(x=0.9402597402597402, y=0.6441558441558441),(x=0.9662337662337662, y=0.7038961038961039),(x=1, y=0.7610389610389611),(x=0.935064935064935, y=0.7688311688311689),(x=0.8701298701298701, y=0.7740259740259741),(x=0.8051948051948052, y=0.7766233766233767),(x=0.7402597402597403, y=0.7792207792207793),(x=0.6753246753246753, y=0.7792207792207793),(x=0.6103896103896104, y=0.7792207792207793),(x=0.5454545454545454, y=0.7792207792207793),(x=0.4805194805194805, y=0.7818181818181819),(x=0.4155844155844156, y=0.7818181818181819),(x=0.35064935064935066, y=0.7818181818181819),(x=0.2857142857142857, y=0.7818181818181819),(x=0.22077922077922077, y=0.7792207792207793),(x=0.15584415584415584, y=0.7792207792207793),(x=0.09090909090909091, y=0.7792207792207793)"/>
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
			
			<Gesture id="triangle_down" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0.02320185614849188),(x=0.03480278422273782, y=0.07192575406032482),(x=0.07192575406032482, y=0.11832946635730858),(x=0.10672853828306264, y=0.16473317865429232),(x=0.13689095127610207, y=0.21345707656612528),(x=0.16705336426914152, y=0.26218097447795824),(x=0.19721577726218098, y=0.31090487238979114),(x=0.22969837587006958, y=0.35730858468677495),(x=0.26450116009280744, y=0.40371229698375866),(x=0.29698375870069604, y=0.45011600928074247),(x=0.33178654292343385, y=0.494199535962877),(x=0.36658932714617165, y=0.54292343387471),(x=0.3990719257540603, y=0.5916473317865429),(x=0.4338747099767981, y=0.6403712296983759),(x=0.46635730858468677, y=0.6890951276102087),(x=0.5011600928074246, y=0.7354988399071926),(x=0.5498839907192575, y=0.7679814385150812),(x=0.5939675174013921, y=0.728538283062645),(x=0.62877030162413, y=0.679814385150812),(x=0.6589327146171693, y=0.62877030162413),(x=0.6890951276102087, y=0.5777262180974477),(x=0.7192575406032482, y=0.5243619489559165),(x=0.7470997679814385, y=0.4709976798143851),(x=0.777262180974478, y=0.419953596287703),(x=0.8051044083526682, y=0.36658932714617165),(x=0.8329466357308585, y=0.31322505800464034),(x=0.8607888631090487, y=0.25986078886310904),(x=0.888631090487239, y=0.2088167053364269),(x=0.9164733178654292, y=0.15545243619489557),(x=0.9443155452436195, y=0.10440835266821345),(x=0.9721577726218097, y=0.05336426914153132),(x=1, y=0.002320185614849188),(x=0.9419953596287702, y=0.002320185614849188),(x=0.8839907192575406, y=0.004640371229698376),(x=0.8259860788863109, y=0.01160092807424594),(x=0.7679814385150812, y=0.016241299303944315),(x=0.7099767981438515, y=0.016241299303944315),(x=0.6519721577726217, y=0.013921113689095127),(x=0.5939675174013921, y=0.01160092807424594),(x=0.5359628770301624, y=0.0069605568445475635),(x=0.47795823665893267, y=0.002320185614849188),(x=0.419953596287703, y=0),(x=0.3619489559164733, y=0),(x=0.3039443155452436, y=0),(x=0.2459396751740139, y=0),(x=0.18793503480278423, y=0),(x=0.12993039443155452, y=0.002320185614849188),(x=0.07192575406032482, y=0.002320185614849188),(x=0.013921113689095127, y=0.009280742459396751)"/>
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
			
			<Gesture id="diamond" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.5414507772020726, y=0.9248704663212436),(x=0.5880829015544041, y=0.8782383419689119),(x=0.6295336787564767, y=0.8290155440414508),(x=0.6735751295336788, y=0.7772020725388601),(x=0.7202072538860104, y=0.7305699481865285),(x=0.7642487046632125, y=0.6813471502590673),(x=0.8082901554404145, y=0.6347150259067358),(x=0.8549222797927462, y=0.5854922279792746),(x=0.9015544041450777, y=0.538860103626943),(x=0.9507772020725389, y=0.4922279792746114),(x=1, y=0.44818652849740936),(x=0.9585492227979275, y=0.39378238341968913),(x=0.9093264248704663, y=0.34974093264248707),(x=0.8575129533678757, y=0.305699481865285),(x=0.8082901554404145, y=0.2616580310880829),(x=0.7564766839378239, y=0.21761658031088082),(x=0.7046632124352332, y=0.17098445595854922),(x=0.655440414507772, y=0.12694300518134716),(x=0.6036269430051814, y=0.08549222797927461),(x=0.5544041450777202, y=0.04145077720207254),(x=0.5025906735751295, y=0),(x=0.4378238341968912, y=0.018134715025906738),(x=0.38860103626943004, y=0.06476683937823835),(x=0.34196891191709844, y=0.11139896373056996),(x=0.2979274611398964, y=0.15803108808290156),(x=0.25129533678756477, y=0.2072538860103627),(x=0.2072538860103627, y=0.25647668393782386),(x=0.16321243523316062, y=0.305699481865285),(x=0.12176165803108809, y=0.35751295336787564),(x=0.07512953367875648, y=0.40414507772020725),(x=0.031088082901554404, y=0.4533678756476684),(x=0, y=0.5103626943005182),(x=0.05181347150259068, y=0.5518134715025907),(x=0.10362694300518135, y=0.5906735751295337),(x=0.15025906735751296, y=0.6321243523316062),(x=0.19689119170984457, y=0.6761658031088084),(x=0.24352331606217617, y=0.7176165803108808),(x=0.2927461139896373, y=0.7564766839378239),(x=0.34196891191709844, y=0.7953367875647669),(x=0.39378238341968913, y=0.8341968911917099),(x=0.44818652849740936, y=0.8730569948186528),(x=0.5025906735751295, y=0.9093264248704663)"/>
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
			
			<Gesture id="loop_left" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=1, y=0.7514450867052023),(x=0.9277456647398844, y=0.7687861271676301),(x=0.8554913294797687, y=0.7774566473988439),(x=0.7832369942196531, y=0.7745664739884393),(x=0.7109826589595375, y=0.7601156069364161),(x=0.6387283236994219, y=0.7312138728323699),(x=0.5722543352601156, y=0.6936416184971098),(x=0.5144508670520231, y=0.6445086705202312),(x=0.4624277456647399, y=0.5924855491329479),(x=0.41329479768786126, y=0.5346820809248555),(x=0.3786127167630058, y=0.4682080924855491),(x=0.3497109826589595, y=0.3988439306358381),(x=0.338150289017341, y=0.3265895953757225),(x=0.34104046242774566, y=0.2543352601156069),(x=0.35549132947976875, y=0.18208092485549132),(x=0.38439306358381503, y=0.11271676300578035),(x=0.43352601156069365, y=0.057803468208092484),(x=0.5, y=0.023121387283236993),(x=0.5722543352601156, y=0.005780346820809248),(x=0.6445086705202312, y=0),(x=0.7167630057803468, y=0.008670520231213872),(x=0.7861271676300577, y=0.031791907514450865),(x=0.8439306358381502, y=0.07514450867052022),(x=0.8786127167630058, y=0.13872832369942195),(x=0.9017341040462428, y=0.20809248554913293),(x=0.9017341040462428, y=0.28034682080924855),(x=0.8815028901734103, y=0.35260115606936415),(x=0.838150289017341, y=0.41329479768786126),(x=0.7832369942196531, y=0.4624277456647399),(x=0.722543352601156, y=0.5057803468208092),(x=0.6560693641618497, y=0.5375722543352601),(x=0.5838150289017341, y=0.5578034682080925),(x=0.5115606936416185, y=0.5664739884393063),(x=0.4393063583815029, y=0.5722543352601156),(x=0.36705202312138724, y=0.5635838150289018),(x=0.2976878612716763, y=0.5346820809248555),(x=0.23121387283236994, y=0.49710982658959535),(x=0.17630057803468208, y=0.44797687861271673),(x=0.13005780346820808, y=0.3901734104046243),(x=0.09248554913294797, y=0.3265895953757225),(x=0.05491329479768786, y=0.26011560693641617),(x=0.026011560693641616, y=0.1936416184971098),(x=0, y=0.12427745664739884)"/>
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
			
			<Gesture id="loop_right" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.006269592476489028, y=0.8683385579937304),(x=0.07523510971786834, y=0.8275862068965517),(x=0.13793103448275862, y=0.780564263322884),(x=0.1974921630094044, y=0.7304075235109717),(x=0.25705329153605017, y=0.6802507836990596),(x=0.3134796238244514, y=0.6238244514106582),(x=0.36363636363636365, y=0.561128526645768),(x=0.4106583072100313, y=0.49843260188087773),(x=0.45454545454545453, y=0.4294670846394984),(x=0.4890282131661442, y=0.3573667711598746),(x=0.5172413793103449, y=0.28213166144200624),(x=0.5297805642633229, y=0.2037617554858934),(x=0.5172413793103449, y=0.12539184952978055),(x=0.4733542319749216, y=0.05642633228840125),(x=0.4075235109717868, y=0.012539184952978056),(x=0.329153605015674, y=0),(x=0.2507836990595611, y=0.01567398119122257),(x=0.18181818181818182, y=0.05329153605015674),(x=0.12539184952978055, y=0.10971786833855798),(x=0.07523510971786834, y=0.17241379310344826),(x=0.03761755485893417, y=0.2445141065830721),(x=0.012539184952978056, y=0.31974921630094044),(x=0, y=0.39811912225705326),(x=0.003134796238244514, y=0.47648902821316613),(x=0.03134796238244514, y=0.5517241379310345),(x=0.08463949843260188, y=0.6081504702194357),(x=0.15047021943573669, y=0.6520376175548589),(x=0.22884012539184953, y=0.664576802507837),(x=0.3072100313479624, y=0.664576802507837),(x=0.3855799373040752, y=0.6489028213166144),(x=0.46081504702194354, y=0.6238244514106582),(x=0.5360501567398119, y=0.5956112852664577),(x=0.6018808777429467, y=0.554858934169279),(x=0.6677115987460814, y=0.5109717868338558),(x=0.7304075235109717, y=0.46394984326018807),(x=0.793103448275862, y=0.41379310344827586),(x=0.8526645768025078, y=0.3605015673981191),(x=0.9090909090909091, y=0.30094043887147337),(x=0.9623824451410657, y=0.24137931034482757),(x=1, y=0.16927899686520376)"/>
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
			
			<Gesture id="tick_left" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0),(x=0.04792332268370607, y=0.06389776357827476),(x=0.09584664536741214, y=0.12460063897763578),(x=0.1437699680511182, y=0.18849840255591055),(x=0.1853035143769968, y=0.25559105431309903),(x=0.23003194888178913, y=0.3194888178913738),(x=0.2747603833865815, y=0.38658146964856227),(x=0.31629392971246006, y=0.4536741214057508),(x=0.35782747603833864, y=0.523961661341853),(x=0.402555910543131, y=0.5910543130990416),(x=0.4472843450479233, y=0.65814696485623),(x=0.4888178913738019, y=0.7252396166134185),(x=0.5303514376996805, y=0.792332268370607),(x=0.5750798722044728, y=0.8594249201277955),(x=0.6230031948881789, y=0.926517571884984),(x=0.6869009584664536, y=0.9744408945686901),(x=0.7635782747603833, y=0.9424920127795526),(x=0.8274760383386581, y=0.8913738019169328),(x=0.8849840255591054, y=0.8338658146964856),(x=0.9424920127795526, y=0.7763578274760383),(x=1, y=0.7156549520766773)"/>
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
			
			<Gesture id="tick_right" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0, y=0.7037037037037037),(x=0.04938271604938271, y=0.7623456790123456),(x=0.10185185185185185, y=0.8209876543209876),(x=0.14814814814814814, y=0.882716049382716),(x=0.19444444444444442, y=0.941358024691358),(x=0.24382716049382713, y=1),(x=0.3179012345679012, y=0.9722222222222222),(x=0.3641975308641975, y=0.9104938271604938),(x=0.4104938271604938, y=0.845679012345679),(x=0.45370370370370366, y=0.7808641975308641),(x=0.5, y=0.7160493827160493),(x=0.5401234567901234, y=0.6481481481481481),(x=0.5864197530864197, y=0.5833333333333333),(x=0.632716049382716, y=0.5185185185185185),(x=0.6790123456790123, y=0.45370370370370366),(x=0.7253086419753086, y=0.38888888888888884),(x=0.7716049382716049, y=0.32407407407407407),(x=0.8179012345679012, y=0.25925925925925924),(x=0.8641975308641975, y=0.19444444444444442),(x=0.9074074074074073, y=0.12962962962962962),(x=0.9537037037037036, y=0.06790123456790123),(x=0.9969135802469136, y=0)"/>
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
			<Gesture id="helix_right" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.5403225806451614, y=0),(x=0.4731182795698925, y=0.005376344086021506),(x=0.4059139784946237, y=0.01881720430107527),(x=0.33870967741935487, y=0.03494623655913979),(x=0.2741935483870968, y=0.06182795698924732),(x=0.21236559139784947, y=0.0913978494623656),(x=0.1532258064516129, y=0.12634408602150538),(x=0.09946236559139786, y=0.16935483870967744),(x=0.051075268817204304, y=0.217741935483871),(x=0.013440860215053765, y=0.27688172043010756),(x=0, y=0.34408602150537637),(x=0.024193548387096777, y=0.4059139784946237),(x=0.08064516129032259, y=0.44354838709677424),(x=0.14516129032258066, y=0.46505376344086025),(x=0.21236559139784947, y=0.4731182795698925),(x=0.2795698924731183, y=0.4731182795698925),(x=0.3467741935483871, y=0.46505376344086025),(x=0.41397849462365593, y=0.446236559139785),(x=0.478494623655914, y=0.41935483870967744),(x=0.5322580645161291, y=0.3790322580645162),(x=0.5725806451612904, y=0.32258064516129037),(x=0.5403225806451614, y=0.26075268817204306),(x=0.4731182795698925, y=0.239247311827957),(x=0.4059139784946237, y=0.2338709677419355),(x=0.33870967741935487, y=0.239247311827957),(x=0.27150537634408606, y=0.2553763440860215),(x=0.20698924731182797, y=0.2795698924731183),(x=0.14516129032258066, y=0.3118279569892473),(x=0.0913978494623656, y=0.3548387096774194),(x=0.048387096774193554, y=0.40860215053763443),(x=0.016129032258064516, y=0.47043010752688175),(x=0.002688172043010753, y=0.5376344086021506),(x=0.016129032258064516, y=0.6048387096774194),(x=0.05645161290322581, y=0.6612903225806452),(x=0.11021505376344087, y=0.7016129032258065),(x=0.17204301075268819, y=0.728494623655914),(x=0.23655913978494625, y=0.7473118279569894),(x=0.30376344086021506, y=0.7553763440860216),(x=0.3709677419354839, y=0.7500000000000001),(x=0.43817204301075274, y=0.7338709677419355),(x=0.5, y=0.7016129032258065),(x=0.5510752688172044, y=0.653225806451613),(x=0.5698924731182796, y=0.5860215053763441),(x=0.5134408602150538, y=0.5430107526881721),(x=0.446236559139785, y=0.5241935483870969),(x=0.3790322580645162, y=0.5241935483870969),(x=0.3118279569892473, y=0.5268817204301076),(x=0.24462365591397853, y=0.5456989247311829),(x=0.18010752688172044, y=0.5725806451612904),(x=0.12365591397849464, y=0.6102150537634409),(x=0.07258064516129033, y=0.6559139784946237),(x=0.03763440860215054, y=0.7150537634408602),(x=0.02688172043010753, y=0.7822580645161291),(x=0.02956989247311828, y=0.8494623655913979),(x=0.06451612903225806, y=0.9086021505376345),(x=0.11290322580645162, y=0.9516129032258065),(x=0.17473118279569894, y=0.9784946236559141),(x=0.239247311827957, y=0.9973118279569894),(x=0.3064516129032258, y=1),(x=0.3736559139784947, y=0.9973118279569894)"/>
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
			
			
			<Gesture id="helix_left" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.06628242074927954, y=0),(x=0.13832853025936598, y=0.020172910662824207),(x=0.20749279538904897, y=0.04322766570605187),(x=0.27665706051873196, y=0.06628242074927954),(x=0.3429394812680115, y=0.09510086455331411),(x=0.40922190201729103, y=0.12680115273775217),(x=0.4726224783861671, y=0.16138328530259366),(x=0.5331412103746397, y=0.1988472622478386),(x=0.5878962536023055, y=0.24495677233429394),(x=0.6368876080691642, y=0.29971181556195964),(x=0.6743515850144092, y=0.3631123919308357),(x=0.6945244956772334, y=0.4322766570605187),(x=0.6628242074927954, y=0.49855907780979825),(x=0.5965417867435158, y=0.5302593659942363),(x=0.5244956772334294, y=0.5417867435158501),(x=0.4524495677233429, y=0.5446685878962536),(x=0.38040345821325644, y=0.5417867435158501),(x=0.30835734870317, y=0.5244956772334294),(x=0.23631123919308356, y=0.5043227665706052),(x=0.17002881844380402, y=0.47550432276657056),(x=0.10374639769452448, y=0.44092219020172907),(x=0.04899135446685879, y=0.3919308357348703),(x=0.09221902017291066, y=0.3314121037463977),(x=0.1642651296829971, y=0.3227665706051873),(x=0.23631123919308356, y=0.3285302593659942),(x=0.30835734870317, y=0.34582132564841495),(x=0.37463976945244953, y=0.3717579250720461),(x=0.4380403458213256, y=0.4063400576368876),(x=0.49855907780979825, y=0.446685878962536),(x=0.5533141210374639, y=0.49279538904899134),(x=0.5994236311239193, y=0.5504322766570605),(x=0.6340057636887607, y=0.6138328530259366),(x=0.6397694524495677, y=0.685878962536023),(x=0.6023054755043227, y=0.7492795389048991),(x=0.5302593659942363, y=0.7752161383285302),(x=0.45821325648414984, y=0.7838616714697406),(x=0.3861671469740634, y=0.7838616714697406),(x=0.3141210374639769, y=0.7809798270893371),(x=0.24207492795389046, y=0.7694524495677233),(x=0.17002881844380402, y=0.7435158501440922),(x=0.10374639769452448, y=0.7146974063400576),(x=0.04610951008645533, y=0.6685878962536023),(x=0.037463976945244955, y=0.5965417867435158),(x=0.1095100864553314, y=0.579250720461095),(x=0.18155619596541786, y=0.5821325648414986),(x=0.25360230547550433, y=0.6023054755043227),(x=0.3227665706051873, y=0.6253602305475504),(x=0.38904899135446686, y=0.6512968299711815),(x=0.44956772334293943, y=0.6887608069164265),(x=0.5043227665706052, y=0.7348703170028817),(x=0.5561959654178674, y=0.7838616714697406),(x=0.5965417867435158, y=0.8443804034582132),(x=0.6080691642651297, y=0.9164265129682997),(x=0.5590778097982708, y=0.9711815561959654),(x=0.48703170028818443, y=0.994236311239193),(x=0.41498559077809793, y=0.9999999999999999),(x=0.3429394812680115, y=0.9971181556195965),(x=0.27089337175792505, y=0.9827089337175792),(x=0.1988472622478386, y=0.9625360230547549),(x=0.12968299711815562, y=0.9394812680115273),(x=0.060518731988472615, y=0.9048991354466858),(x=0, y=0.8645533141210374)"/>
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
			
			<Gesture id="rectangle" type="stroke">
						<match>
							<action>
								<initial>
									<point path_pts="(x=0.03636363636363636, y=0),(x=0.09318181818181817, y=0),(x=0.15, y=0),(x=0.20681818181818182, y=0),(x=0.2636363636363636, y=0),(x=0.32045454545454544, y=0),(x=0.37727272727272726, y=0),(x=0.4340909090909091, y=0),(x=0.4909090909090909, y=0),(x=0.5477272727272727, y=0.0022727272727272726),(x=0.6045454545454545, y=0.0022727272727272726),(x=0.6613636363636364, y=0.0022727272727272726),(x=0.7181818181818181, y=0.0022727272727272726),(x=0.7749999999999999, y=0),(x=0.8318181818181818, y=0),(x=0.8886363636363636, y=0),(x=0.9454545454545454, y=0.0022727272727272726),(x=0.9659090909090908, y=0.05454545454545454),(x=0.9704545454545455, y=0.11136363636363636),(x=0.975, y=0.16818181818181818),(x=0.9795454545454545, y=0.22499999999999998),(x=0.984090909090909, y=0.2818181818181818),(x=0.9886363636363635, y=0.3386363636363636),(x=0.9931818181818182, y=0.39545454545454545),(x=0.9977272727272727, y=0.45227272727272727),(x=1, y=0.509090909090909),(x=0.9522727272727273, y=0.5409090909090909),(x=0.8954545454545454, y=0.5409090909090909),(x=0.8386363636363636, y=0.5386363636363636),(x=0.7818181818181817, y=0.5363636363636364),(x=0.725, y=0.5363636363636364),(x=0.6681818181818181, y=0.5363636363636364),(x=0.6113636363636363, y=0.5363636363636364),(x=0.5545454545454546, y=0.5340909090909091),(x=0.4977272727272727, y=0.5340909090909091),(x=0.44090909090909086, y=0.5340909090909091),(x=0.3840909090909091, y=0.5340909090909091),(x=0.32727272727272727, y=0.5340909090909091),(x=0.27045454545454545, y=0.5340909090909091),(x=0.21363636363636362, y=0.5340909090909091),(x=0.1568181818181818, y=0.5386363636363636),(x=0.09999999999999999, y=0.5386363636363636),(x=0.04318181818181818, y=0.5386363636363636),(x=0.02727272727272727, y=0.4818181818181818),(x=0.024999999999999998, y=0.425),(x=0.020454545454545454, y=0.36818181818181817),(x=0.013636363636363636, y=0.31136363636363634),(x=0.011363636363636364, y=0.2545454545454545),(x=0.011363636363636364, y=0.19772727272727272),(x=0.006818181818181818, y=0.1409090909090909),(x=0.004545454545454545, y=0.08409090909090909),(x=0, y=0.02727272727272727)"/>
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
	</Gesture_set>
	
	
	
	<Gesture_set id="stroke_greek">	
		<Gesture id="greek_alpha" type="stroke">
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
		
		<Gesture id="greek_beta" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0, y=1),(x=0.06779661016949153, y=0.9491525423728814),(x=0.1288135593220339, y=0.888135593220339),(x=0.17627118644067796, y=0.8135593220338982),(x=0.21694915254237288, y=0.735593220338983),(x=0.24745762711864405, y=0.6542372881355932),(x=0.2745762711864407, y=0.5694915254237288),(x=0.288135593220339, y=0.48474576271186437),(x=0.3016949152542373, y=0.39999999999999997),(x=0.31864406779661014, y=0.31525423728813556),(x=0.31864406779661014, y=0.2305084745762712),(x=0.31864406779661014, y=0.14576271186440679),(x=0.3254237288135593, y=0.06101694915254237),(x=0.39999999999999997, y=0.01694915254237288),(x=0.48474576271186437, y=0),(x=0.5694915254237288, y=0),(x=0.6508474576271186, y=0.02711864406779661),(x=0.7084745762711864, y=0.09152542372881356),(x=0.7322033898305085, y=0.17288135593220338),(x=0.7016949152542372, y=0.2542372881355932),(x=0.6406779661016949, y=0.31864406779661014),(x=0.5627118644067797, y=0.3593220338983051),(x=0.4813559322033898, y=0.3898305084745763),(x=0.5661016949152542, y=0.3966101694915254),(x=0.6508474576271186, y=0.42033898305084744),(x=0.7254237288135593, y=0.46440677966101696),(x=0.7796610169491526, y=0.5288135593220339),(x=0.8169491525423729, y=0.6067796610169491),(x=0.8169491525423729, y=0.6915254237288135),(x=0.7728813559322034, y=0.7661016949152543),(x=0.7016949152542372, y=0.8135593220338982),(x=0.6203389830508474, y=0.8440677966101695),(x=0.535593220338983, y=0.864406779661017),(x=0.45084745762711864, y=0.8576271186440678),(x=0.36610169491525424, y=0.8338983050847457),(x=0.288135593220339, y=0.7966101694915254)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_gamma" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0, y=0.16307692307692306),(x=0.07692307692307693, y=0.14461538461538462),(x=0.15384615384615385, y=0.12615384615384614),(x=0.2276923076923077, y=0.10461538461538461),(x=0.2923076923076923, y=0.14769230769230768),(x=0.3476923076923077, y=0.2),(x=0.38769230769230767, y=0.26461538461538464),(x=0.42153846153846153, y=0.3353846153846154),(x=0.4461538461538462, y=0.40923076923076923),(x=0.4646153846153846, y=0.48615384615384616),(x=0.47692307692307695, y=0.563076923076923),(x=0.48, y=0.64),(x=0.48, y=0.7169230769230769),(x=0.4707692307692308, y=0.7938461538461539),(x=0.4553846153846154, y=0.8707692307692307),(x=0.4276923076923077, y=0.9446153846153846),(x=0.3723076923076923, y=1),(x=0.3292307692307692, y=0.9292307692307692),(x=0.31384615384615383, y=0.8523076923076923),(x=0.3046153846153846, y=0.7753846153846153),(x=0.3046153846153846, y=0.6984615384615385),(x=0.3076923076923077, y=0.6215384615384615),(x=0.32, y=0.5446153846153846),(x=0.3384615384615385, y=0.4676923076923077),(x=0.3630769230769231, y=0.39076923076923076),(x=0.39692307692307693, y=0.32),(x=0.4338461538461538, y=0.24923076923076923),(x=0.47384615384615386, y=0.18153846153846154),(x=0.52, y=0.12),(x=0.5692307692307692, y=0.05846153846153846),(x=0.6215384615384615, y=0)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_delta" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0.3496143958868894, y=0.04884318766066838),(x=0.2982005141388175, y=0.007712082262210797),(x=0.2339331619537275, y=0),(x=0.1773778920308483, y=0.033419023136246784),(x=0.13881748071979433, y=0.08740359897172235),(x=0.13624678663239073, y=0.15167095115681234),(x=0.16709511568123392, y=0.2082262210796915),(x=0.2185089974293059, y=0.2493573264781491),(x=0.27249357326478146, y=0.28277634961439585),(x=0.32390745501285345, y=0.31876606683804626),(x=0.37532133676092544, y=0.35732647814910024),(x=0.4215938303341902, y=0.4010282776349614),(x=0.467866323907455, y=0.4473007712082262),(x=0.5115681233933161, y=0.49614395886889456),(x=0.5424164524421593, y=0.5501285347043702),(x=0.5681233933161953, y=0.6092544987146529),(x=0.5809768637532133, y=0.6735218508997429),(x=0.5861182519280205, y=0.7377892030848329),(x=0.5758354755784061, y=0.8020565552699228),(x=0.5552699228791773, y=0.8637532133676092),(x=0.5167095115681234, y=0.9151670951156812),(x=0.4652956298200514, y=0.9562982005141387),(x=0.4061696658097686, y=0.987146529562982),(x=0.34190231362467866, y=0.9999999999999999),(x=0.27763496143958866, y=0.9999999999999999),(x=0.21336760925449869, y=0.9845758354755784),(x=0.15424164524421594, y=0.9537275064267351),(x=0.10282776349614395, y=0.9100257069408739),(x=0.056555269922879174, y=0.858611825192802),(x=0.025706940874035987, y=0.7994858611825192),(x=0.005141388174807198, y=0.7352185089974292),(x=0, y=0.6709511568123393),(x=0.007712082262210797, y=0.6066838046272494),(x=0.028277634961439587, y=0.5424164524421593),(x=0.056555269922879174, y=0.480719794344473),(x=0.09254498714652956, y=0.42673521850899737),(x=0.13367609254498714, y=0.377892030848329),(x=0.1799485861182519, y=0.33419023136246784),(x=0.2339331619537275, y=0.30077120822622105)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_epsilon" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0.4444444444444444, y=0.24761904761904763),(x=0.5015873015873016, y=0.19047619047619047),(x=0.5174603174603175, y=0.1111111111111111),(x=0.4666666666666667, y=0.044444444444444446),(x=0.3904761904761905, y=0.009523809523809525),(x=0.3111111111111111, y=0),(x=0.23174603174603176, y=0.015873015873015872),(x=0.15873015873015872, y=0.05396825396825397),(x=0.09841269841269841, y=0.10793650793650794),(x=0.050793650793650794, y=0.17142857142857143),(x=0.01904761904761905, y=0.24444444444444444),(x=0, y=0.3238095238095238),(x=0.009523809523809525, y=0.4031746031746032),(x=0.06984126984126984, y=0.45714285714285713),(x=0.1492063492063492, y=0.4666666666666667),(x=0.22857142857142856, y=0.45396825396825397),(x=0.15555555555555556, y=0.49206349206349204),(x=0.10158730158730159, y=0.5523809523809524),(x=0.06031746031746032, y=0.6222222222222222),(x=0.03492063492063492, y=0.6984126984126984),(x=0.022222222222222223, y=0.7777777777777778),(x=0.025396825396825397, y=0.8571428571428571),(x=0.06349206349206349, y=0.9301587301587302),(x=0.12698412698412698, y=0.9777777777777777),(x=0.20317460317460317, y=1),(x=0.28253968253968254, y=0.9968253968253968),(x=0.3619047619047619, y=0.9777777777777777),(x=0.43492063492063493, y=0.946031746031746),(x=0.4984126984126984, y=0.8952380952380953),(x=0.546031746031746, y=0.8317460317460318),(x=0.5301587301587302, y=0.7523809523809524),(x=0.4507936507936508, y=0.7333333333333333)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_zeta" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0.7767857142857142, y=0.06547619047619047),(x=0.7142857142857142, y=0.023809523809523808),(x=0.6398809523809523, y=0.017857142857142856),(x=0.5892857142857143, y=0.0744047619047619),(x=0.6309523809523809, y=0.1369047619047619),(x=0.5654761904761905, y=0.09523809523809523),(x=0.5, y=0.050595238095238096),(x=0.431547619047619, y=0.01488095238095238),(x=0.3571428571428571, y=0),(x=0.28273809523809523, y=0),(x=0.20833333333333331, y=0.026785714285714284),(x=0.1488095238095238, y=0.07142857142857142),(x=0.09821428571428571, y=0.12797619047619047),(x=0.05952380952380952, y=0.19345238095238093),(x=0.026785714285714284, y=0.26190476190476186),(x=0.005952380952380952, y=0.3363095238095238),(x=0, y=0.4107142857142857),(x=0.005952380952380952, y=0.4851190476190476),(x=0.02976190476190476, y=0.5565476190476191),(x=0.06845238095238095, y=0.6190476190476191),(x=0.11904761904761904, y=0.6696428571428571),(x=0.18154761904761904, y=0.7083333333333333),(x=0.25297619047619047, y=0.7351190476190476),(x=0.32440476190476186, y=0.7559523809523809),(x=0.3958333333333333, y=0.7767857142857142),(x=0.4672619047619047, y=0.800595238095238),(x=0.5297619047619048, y=0.8452380952380952),(x=0.5416666666666666, y=0.9196428571428571),(x=0.4880952380952381, y=0.9732142857142857),(x=0.41666666666666663, y=1),(x=0.34226190476190477, y=0.9970238095238094),(x=0.26785714285714285, y=0.9821428571428571),(x=0.19345238095238093, y=0.9523809523809523),(x=0.125, y=0.9226190476190476),(x=0.05357142857142857, y=0.8898809523809523)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_eta" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0, y=0.12820512820512822),(x=0.03418803418803419, y=0.06267806267806268),(x=0.10256410256410257, y=0.03703703703703704),(x=0.13675213675213677, y=0.09971509971509972),(x=0.14245014245014245, y=0.17094017094017094),(x=0.1452991452991453, y=0.24216524216524218),(x=0.1452991452991453, y=0.3133903133903134),(x=0.1452991452991453, y=0.38461538461538464),(x=0.14245014245014245, y=0.45584045584045585),(x=0.14245014245014245, y=0.5270655270655271),(x=0.150997150997151, y=0.5982905982905983),(x=0.15954415954415954, y=0.5270655270655271),(x=0.16809116809116809, y=0.45584045584045585),(x=0.17663817663817666, y=0.38461538461538464),(x=0.18803418803418803, y=0.3133903133903134),(x=0.19943019943019943, y=0.24216524216524218),(x=0.21652421652421652, y=0.17094017094017094),(x=0.245014245014245, y=0.10256410256410257),(x=0.2849002849002849, y=0.042735042735042736),(x=0.3418803418803419, y=0),(x=0.4102564102564103, y=0.019943019943019943),(x=0.45584045584045585, y=0.07692307692307693),(x=0.47008547008547014, y=0.14814814814814817),(x=0.4814814814814815, y=0.21937321937321938),(x=0.4871794871794872, y=0.2905982905982906),(x=0.4871794871794872, y=0.36182336182336183),(x=0.4871794871794872, y=0.43304843304843305),(x=0.49002849002849, y=0.5042735042735043),(x=0.49572649572649574, y=0.5754985754985755),(x=0.5042735042735043, y=0.6467236467236468),(x=0.5185185185185185, y=0.717948717948718),(x=0.5327635327635328, y=0.7891737891737892),(x=0.5498575498575499, y=0.8603988603988605),(x=0.5726495726495727, y=0.9287749287749288),(x=0.6068376068376069, y=0.9943019943019944),(x=0.6780626780626781, y=1),(x=0.7207977207977209, y=0.9430199430199431),(x=0.7606837606837608, y=0.8803418803418804),(x=0.7977207977207977, y=0.8176638176638177)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_theta" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0.5270758122743683, y=0.01444043321299639),(x=0.4368231046931408, y=0.02888086642599278),(x=0.3537906137184116, y=0.07220216606498195),(x=0.2815884476534296, y=0.1263537906137184),(x=0.21660649819494585, y=0.19133574007220217),(x=0.1588447653429603, y=0.25992779783393505),(x=0.10830324909747292, y=0.33574007220216606),(x=0.06498194945848376, y=0.4187725631768953),(x=0.03249097472924188, y=0.5054151624548736),(x=0.010830324909747294, y=0.5956678700361011),(x=0, y=0.6859205776173285),(x=0.007220216606498195, y=0.776173285198556),(x=0.03249097472924188, y=0.8664259927797834),(x=0.07942238267148015, y=0.9458483754512635),(x=0.1552346570397112, y=0.996389891696751),(x=0.24548736462093865, y=1),(x=0.33574007220216606, y=0.9783393501805054),(x=0.40794223826714804, y=0.924187725631769),(x=0.48014440433212996, y=0.8664259927797834),(x=0.5415162454873647, y=0.7978339350180506),(x=0.5992779783393501, y=0.7256317689530686),(x=0.6425992779783394, y=0.6462093862815884),(x=0.6823104693140795, y=0.5595667870036102),(x=0.7075812274368232, y=0.4693140794223827),(x=0.7220216606498195, y=0.37906137184115524),(x=0.7220216606498195, y=0.2888086642599278),(x=0.7111913357400722, y=0.19855595667870038),(x=0.6678700361010831, y=0.11913357400722022),(x=0.5812274368231047, y=0.07942238267148015),(x=0.4909747292418773, y=0.07942238267148015),(x=0.40072202166064985, y=0.10830324909747292),(x=0.3212996389891697, y=0.1552346570397112),(x=0.2527075812274368, y=0.21660649819494585),(x=0.19494584837545126, y=0.2888086642599278),(x=0.1552346570397112, y=0.37184115523465705),(x=0.16606498194945848, y=0.4620938628158845),(x=0.25631768953068595, y=0.4657039711191336),(x=0.33935018050541516, y=0.4296028880866426),(x=0.41155234657039713, y=0.37545126353790614),(x=0.48014440433212996, y=0.3176895306859206),(x=0.5487364620938628, y=0.25631768953068595),(x=0.6173285198555957, y=0.19494584837545126),(x=0.6787003610108303, y=0.12996389891696752),(x=0.7436823104693141, y=0.06498194945848376),(x=0.8086642599277979, y=0)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_iota" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0, y=0.20557491289198607),(x=0.07665505226480836, y=0.16376306620209058),(x=0.14982578397212543, y=0.11149825783972125),(x=0.21951219512195122, y=0.059233449477351915),(x=0.2857142857142857, y=0),(x=0.27526132404181186, y=0.08710801393728224),(x=0.24390243902439024, y=0.17073170731707318),(x=0.20905923344947736, y=0.25435540069686413),(x=0.17770034843205576, y=0.33797909407665505),(x=0.15331010452961671, y=0.42160278745644597),(x=0.1289198606271777, y=0.5087108013937283),(x=0.10801393728222997, y=0.5958188153310104),(x=0.09407665505226481, y=0.6829268292682927),(x=0.08710801393728224, y=0.7700348432055749),(x=0.08362369337979095, y=0.8571428571428571),(x=0.09059233449477352, y=0.9442508710801394),(x=0.1602787456445993, y=1),(x=0.23344947735191637, y=0.9477351916376306),(x=0.2926829268292683, y=0.8815331010452961),(x=0.34494773519163763, y=0.8118466898954704)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_kappa" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0.057692307692307696, y=0),(x=0.09890109890109891, y=0.05494505494505495),(x=0.12362637362637363, y=0.11813186813186814),(x=0.1401098901098901, y=0.18406593406593408),(x=0.14835164835164835, y=0.2527472527472528),(x=0.14835164835164835, y=0.32142857142857145),(x=0.14835164835164835, y=0.39010989010989017),(x=0.14285714285714288, y=0.4587912087912088),(x=0.13186813186813187, y=0.5274725274725275),(x=0.1208791208791209, y=0.5961538461538461),(x=0.1043956043956044, y=0.6648351648351649),(x=0.08516483516483517, y=0.7307692307692308),(x=0.06593406593406594, y=0.7994505494505495),(x=0.046703296703296704, y=0.8681318681318682),(x=0.024725274725274728, y=0.9340659340659342),(x=0, y=1),(x=0.02197802197802198, y=0.9340659340659342),(x=0.04395604395604396, y=0.8653846153846154),(x=0.06593406593406594, y=0.7967032967032968),(x=0.08791208791208792, y=0.7280219780219781),(x=0.11263736263736264, y=0.6620879120879122),(x=0.13461538461538464, y=0.5961538461538461),(x=0.1565934065934066, y=0.5274725274725275),(x=0.18131868131868134, y=0.46153846153846156),(x=0.2087912087912088, y=0.3983516483516484),(x=0.2417582417582418, y=0.3351648351648352),(x=0.27472527472527475, y=0.27472527472527475),(x=0.3076923076923077, y=0.2142857142857143),(x=0.34890109890109894, y=0.1565934065934066),(x=0.39010989010989017, y=0.10164835164835166),(x=0.4450549450549451, y=0.057692307692307696),(x=0.4450549450549451, y=0.1263736263736264),(x=0.40384615384615385, y=0.18131868131868134),(x=0.35989010989010994, y=0.23626373626373628),(x=0.3131868131868132, y=0.2884615384615385),(x=0.271978021978022, y=0.3461538461538462),(x=0.23076923076923078, y=0.4010989010989011),(x=0.19230769230769232, y=0.4587912087912088),(x=0.1620879120879121, y=0.5192307692307693),(x=0.13736263736263737, y=0.5851648351648352),(x=0.1263736263736264, y=0.6538461538461539),(x=0.13186813186813187, y=0.7225274725274726),(x=0.1565934065934066, y=0.7857142857142858),(x=0.20054945054945056, y=0.8351648351648352),(x=0.2527472527472528, y=0.881868131868132),(x=0.315934065934066, y=0.9148351648351649),(x=0.3818681318681319, y=0.9340659340659342),(x=0.45054945054945056, y=0.9368131868131869),(x=0.5192307692307693, y=0.9258241758241759)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_lamba" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0, y=0.9237536656891495),(x=0.04985337243401759, y=0.8680351906158358),(x=0.09970674486803519, y=0.8123167155425219),(x=0.15249266862170088, y=0.7595307917888563),(x=0.20527859237536658, y=0.7067448680351907),(x=0.26392961876832843, y=0.6598240469208211),(x=0.3196480938416422, y=0.6099706744868035),(x=0.3343108504398827, y=0.5366568914956011),(x=0.31378299120234604, y=0.4633431085043988),(x=0.2932551319648094, y=0.39296187683284456),(x=0.26392961876832843, y=0.3225806451612903),(x=0.2316715542521994, y=0.25219941348973607),(x=0.19648093841642228, y=0.187683284457478),(x=0.15542521994134897, y=0.12316715542521994),(x=0.11730205278592376, y=0.05865102639296188),(x=0.06744868035190615, y=0),(x=0.026392961876832845, y=0.06451612903225806),(x=0.04105571847507331, y=0.1378299120234604),(x=0.06451612903225806, y=0.20821114369501467),(x=0.09090909090909091, y=0.2756598240469208),(x=0.12023460410557185, y=0.34310850439882695),(x=0.15542521994134897, y=0.40762463343108507),(x=0.1935483870967742, y=0.47214076246334313),(x=0.2316715542521994, y=0.533724340175953),(x=0.2727272727272727, y=0.5953079178885631),(x=0.31378299120234604, y=0.656891495601173),(x=0.35777126099706746, y=0.718475073313783),(x=0.40175953079178883, y=0.7741935483870968),(x=0.45454545454545453, y=0.8269794721407625),(x=0.5073313782991202, y=0.8768328445747801),(x=0.5659824046920822, y=0.9208211143695014),(x=0.624633431085044, y=0.9618768328445748),(x=0.6891495601173021, y=1)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_mu" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0, y=1),(x=0.06116207951070336, y=0.9541284403669725),(x=0.10703363914373089, y=0.8929663608562691),(x=0.14678899082568808, y=0.8256880733944955),(x=0.1834862385321101, y=0.7584097859327217),(x=0.21712538226299694, y=0.6850152905198776),(x=0.24770642201834864, y=0.6116207951070336),(x=0.2691131498470948, y=0.5351681957186545),(x=0.290519877675841, y=0.45871559633027525),(x=0.308868501529052, y=0.382262996941896),(x=0.3211009174311927, y=0.3058103975535168),(x=0.327217125382263, y=0.22935779816513763),(x=0.3333333333333333, y=0.1529051987767584),(x=0.3333333333333333, y=0.0764525993883792),(x=0.3333333333333333, y=0),(x=0.327217125382263, y=0.0764525993883792),(x=0.3302752293577982, y=0.1529051987767584),(x=0.3394495412844037, y=0.22935779816513763),(x=0.3516819571865443, y=0.3058103975535168),(x=0.3730886850152905, y=0.382262996941896),(x=0.41284403669724773, y=0.44954128440366975),(x=0.46788990825688076, y=0.3944954128440367),(x=0.4954128440366973, y=0.3211009174311927),(x=0.5198776758409785, y=0.24464831804281345),(x=0.5412844036697247, y=0.16819571865443425),(x=0.5535168195718655, y=0.09174311926605505),(x=0.5626911314984709, y=0.01529051987767584),(x=0.5565749235474006, y=0.09174311926605505),(x=0.5565749235474006, y=0.16819571865443425),(x=0.5626911314984709, y=0.24464831804281345),(x=0.5657492354740061, y=0.3211009174311927),(x=0.5779816513761468, y=0.39755351681957185),(x=0.599388379204893, y=0.4709480122324159),(x=0.6299694189602446, y=0.5412844036697247)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_nu" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0, y=0.33463035019455256),(x=0.08949416342412451, y=0.3735408560311284),(x=0.17120622568093385, y=0.42412451361867703),(x=0.24513618677042803, y=0.49027237354085607),(x=0.30350194552529186, y=0.5680933852140078),(x=0.35797665369649806, y=0.6459143968871596),(x=0.4046692607003891, y=0.7276264591439688),(x=0.4474708171206226, y=0.8171206225680934),(x=0.48249027237354086, y=0.9066147859922179),(x=0.5175097276264592, y=1),(x=0.5953307392996109, y=0.9416342412451362),(x=0.6575875486381323, y=0.8638132295719845),(x=0.7120622568093385, y=0.7782101167315175),(x=0.7626459143968871, y=0.6926070038910506),(x=0.8054474708171206, y=0.603112840466926),(x=0.8404669260700389, y=0.5058365758754864),(x=0.8560311284046693, y=0.4085603112840467),(x=0.8560311284046693, y=0.311284046692607),(x=0.8287937743190662, y=0.21400778210116733),(x=0.77431906614786, y=0.12840466926070038),(x=0.7042801556420234, y=0.05058365758754864),(x=0.6186770428015564, y=0)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_xi" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0.3553530751708428, y=0),(x=0.378132118451025, y=0.05239179954441913),(x=0.4123006833712984, y=0.0979498861047836),(x=0.45558086560364464, y=0.13439635535307518),(x=0.5079726651480637, y=0.15717539863325738),(x=0.5421412300683371, y=0.11161731207289294),(x=0.49202733485193617, y=0.0797266514806378),(x=0.43735763097949887, y=0.06150341685649202),(x=0.3804100227790433, y=0.06150341685649202),(x=0.3234624145785877, y=0.07517084282460136),(x=0.27107061503416857, y=0.10022779043280182),(x=0.23006833712984054, y=0.14123006833712984),(x=0.21412300683371296, y=0.19817767653758542),(x=0.22323462414578588, y=0.25512528473804097),(x=0.25284738041002275, y=0.30296127562642367),(x=0.29157175398633256, y=0.3462414578587699),(x=0.33712984054669703, y=0.3804100227790433),(x=0.3895216400911162, y=0.4031890660592255),(x=0.33940774487471526, y=0.37357630979498857),(x=0.2824601366742597, y=0.3644646924829157),(x=0.2255125284738041, y=0.3644646924829157),(x=0.16856492027334852, y=0.3758542141230068),(x=0.11389521640091116, y=0.39635535307517084),(x=0.07061503416856492, y=0.43280182232346237),(x=0.03416856492027335, y=0.4760820045558086),(x=0.009111617312072893, y=0.5284738041002278),(x=0, y=0.5854214123006833),(x=0.018223234624145785, y=0.6400911161731206),(x=0.04783599088838269, y=0.6902050113895216),(x=0.0888382687927107, y=0.7266514806378132),(x=0.1366742596810934, y=0.75626423690205),(x=0.1890660592255125, y=0.7813211845102506),(x=0.24373576309794986, y=0.7995444191343963),(x=0.2984054669703872, y=0.8132118451025057),(x=0.35079726651480636, y=0.8337129840546696),(x=0.39863325740318906, y=0.867881548974943),(x=0.4145785876993166, y=0.9225512528473804),(x=0.3826879271070615, y=0.970387243735763),(x=0.32801822323462415, y=0.9931662870159453),(x=0.27107061503416857, y=1),(x=0.21412300683371296, y=0.990888382687927),(x=0.15717539863325738, y=0.9772209567198177)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_omicon" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0.5037037037037037, y=0.01728395061728395),(x=0.4419753086419753, y=0),(x=0.3802469135802469, y=0),(x=0.31851851851851853, y=0.009876543209876543),(x=0.25925925925925924, y=0.03209876543209877),(x=0.20493827160493827, y=0.06419753086419754),(x=0.1580246913580247, y=0.1037037037037037),(x=0.11604938271604938, y=0.15061728395061727),(x=0.07901234567901234, y=0.20246913580246914),(x=0.04938271604938271, y=0.25679012345679014),(x=0.02962962962962963, y=0.3160493827160494),(x=0.014814814814814815, y=0.37777777777777777),(x=0.0049382716049382715, y=0.43950617283950616),(x=0, y=0.5012345679012346),(x=0, y=0.562962962962963),(x=0.0049382716049382715, y=0.6246913580246913),(x=0.022222222222222223, y=0.6839506172839506),(x=0.03950617283950617, y=0.7432098765432099),(x=0.06666666666666667, y=0.7999999999999999),(x=0.10123456790123457, y=0.8493827160493826),(x=0.14074074074074075, y=0.8938271604938272),(x=0.18518518518518517, y=0.9358024691358025),(x=0.23950617283950618, y=0.9679012345679012),(x=0.29876543209876544, y=0.9901234567901235),(x=0.36049382716049383, y=1),(x=0.4222222222222222, y=1),(x=0.4839506172839506, y=0.9901234567901235),(x=0.5432098765432098, y=0.9679012345679012),(x=0.6, y=0.9407407407407408),(x=0.6469135802469136, y=0.8987654320987654),(x=0.6938271604938272, y=0.854320987654321),(x=0.7308641975308642, y=0.8049382716049382),(x=0.762962962962963, y=0.7506172839506172),(x=0.7851851851851852, y=0.6888888888888889),(x=0.7999999999999999, y=0.6271604938271604),(x=0.8024691358024691, y=0.5654320987654321),(x=0.8024691358024691, y=0.5037037037037037),(x=0.8024691358024691, y=0.4419753086419753),(x=0.7876543209876543, y=0.3802469135802469),(x=0.7753086419753086, y=0.31851851851851853),(x=0.7530864197530864, y=0.25679012345679014),(x=0.7283950617283951, y=0.19753086419753085),(x=0.6938271604938272, y=0.14320987654320988),(x=0.6567901234567901, y=0.09382716049382715),(x=0.6074074074074074, y=0.05185185185185185),(x=0.5506172839506173, y=0.022222222222222223),(x=0.4888888888888889, y=0.007407407407407408)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_pi" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0.05714285714285714, y=0.5142857142857142),(x=0.10857142857142857, y=0.4657142857142857),(x=0.15714285714285714, y=0.4114285714285714),(x=0.20285714285714285, y=0.35714285714285715),(x=0.24571428571428572, y=0.3),(x=0.2885714285714286, y=0.24),(x=0.32571428571428573, y=0.17714285714285713),(x=0.3628571428571429, y=0.11428571428571428),(x=0.3942857142857143, y=0.04857142857142857),(x=0.3742857142857143, y=0.11714285714285715),(x=0.35714285714285715, y=0.18857142857142858),(x=0.34, y=0.26),(x=0.32857142857142857, y=0.3314285714285714),(x=0.32571428571428573, y=0.40285714285714286),(x=0.34, y=0.4742857142857143),(x=0.39714285714285713, y=0.5171428571428571),(x=0.4657142857142857, y=0.4942857142857143),(x=0.5142857142857142, y=0.44),(x=0.5285714285714286, y=0.36857142857142855),(x=0.5085714285714286, y=0.3),(x=0.45714285714285713, y=0.24571428571428572),(x=0.39714285714285713, y=0.2),(x=0.3342857142857143, y=0.16),(x=0.26857142857142857, y=0.12285714285714286),(x=0.20285714285714285, y=0.08857142857142856),(x=0.13714285714285715, y=0.054285714285714284),(x=0.06857142857142857, y=0.025714285714285714),(x=0, y=0),(x=0.07142857142857142, y=0),(x=0.14285714285714285, y=0.002857142857142857),(x=0.21428571428571427, y=0.011428571428571429),(x=0.2857142857142857, y=0.014285714285714285),(x=0.35714285714285715, y=0.017142857142857144),(x=0.42857142857142855, y=0.02),(x=0.5, y=0.022857142857142857),(x=0.5714285714285714, y=0.025714285714285714),(x=0.6428571428571429, y=0.02857142857142857),(x=0.7142857142857143, y=0.02857142857142857),(x=0.7857142857142857, y=0.02857142857142857),(x=0.8571428571428571, y=0.03142857142857143),(x=0.9285714285714286, y=0.03428571428571429),(x=1, y=0.037142857142857144)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_rho" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0.5099009900990099, y=0.22277227722772278),(x=0.5668316831683169, y=0.24752475247524752),(x=0.6237623762376238, y=0.2722772277227723),(x=0.6831683168316832, y=0.29207920792079206),(x=0.745049504950495, y=0.3069306930693069),(x=0.806930693069307, y=0.3094059405940594),(x=0.8688118811881188, y=0.3069306930693069),(x=0.9282178217821783, y=0.2821782178217822),(x=0.9727722772277227, y=0.23514851485148516),(x=0.9975247524752475, y=0.17574257425742573),(x=1, y=0.11386138613861387),(x=0.9752475247524752, y=0.05198019801980198),(x=0.9232673267326733, y=0.01485148514851485),(x=0.8613861386138614, y=0),(x=0.7995049504950495, y=0.009900990099009901),(x=0.7376237623762376, y=0.03217821782178218),(x=0.6806930693069307, y=0.06188118811881188),(x=0.6311881188118812, y=0.09900990099009901),(x=0.5841584158415841, y=0.1410891089108911),(x=0.5396039603960396, y=0.18564356435643564),(x=0.4975247524752475, y=0.2301980198019802),(x=0.45792079207920794, y=0.27970297029702973),(x=0.4183168316831683, y=0.3292079207920792),(x=0.3787128712871287, y=0.3787128712871287),(x=0.33910891089108913, y=0.4282178217821782),(x=0.30198019801980197, y=0.4777227722772277),(x=0.2623762376237624, y=0.5272277227722773),(x=0.2202970297029703, y=0.5717821782178217),(x=0.17326732673267328, y=0.6138613861386139),(x=0.12376237623762376, y=0.6534653465346535),(x=0.06188118811881188, y=0.6658415841584159),(x=0, y=0.6534653465346535)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_sigma" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=1, y=0.014669926650366748),(x=0.9388753056234719, y=0.014669926650366748),(x=0.8777506112469438, y=0.009779951100244499),(x=0.8166259168704156, y=0.007334963325183374),(x=0.7555012224938875, y=0.004889975550122249),(x=0.6943765281173594, y=0.0024449877750611247),(x=0.6332518337408313, y=0),(x=0.5721271393643031, y=0),(x=0.511002444987775, y=0),(x=0.44987775061124696, y=0),(x=0.38875305623471884, y=0.0024449877750611247),(x=0.3276283618581907, y=0.007334963325183374),(x=0.2665036674816626, y=0.012224938875305624),(x=0.20537897310513448, y=0.017114914425427872),(x=0.14425427872860636, y=0.02689486552567237),(x=0.08312958435207823, y=0.039119804400977995),(x=0.029339853300733496, y=0.07334963325183375),(x=0, y=0.1295843520782396),(x=0, y=0.19070904645476772),(x=0.017114914425427872, y=0.24938875305623473),(x=0.04645476772616137, y=0.30317848410757947),(x=0.08312958435207823, y=0.35207823960880197),(x=0.1271393643031785, y=0.39119804400978),(x=0.1784841075794621, y=0.42053789731051344),(x=0.2396088019559902, y=0.43765281173594134),(x=0.30073349633251834, y=0.43765281173594134),(x=0.36185819070904646, y=0.4229828850855746),(x=0.4180929095354523, y=0.3960880195599022),(x=0.46454767726161367, y=0.3545232273838631),(x=0.4963325183374083, y=0.30073349633251834),(x=0.5183374083129584, y=0.24205378973105135),(x=0.5183374083129584, y=0.18092909535452323),(x=0.49877750611246946, y=0.1198044009779951),(x=0.4572127139364303, y=0.07334963325183375),(x=0.39853300733496333, y=0.04645476772616137)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_tau" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0.16120906801007556, y=0),(x=0.10327455919395466, y=0.025188916876574305),(x=0.04785894206549118, y=0.0579345088161209),(x=0, y=0.10075566750629722),(x=0, y=0.163727959697733),(x=0.055415617128463476, y=0.1964735516372796),(x=0.11838790931989925, y=0.20906801007556675),(x=0.181360201511335, y=0.21662468513853902),(x=0.24433249370277077, y=0.2216624685138539),(x=0.30730478589420657, y=0.22921914357682618),(x=0.3702770780856423, y=0.2317380352644836),(x=0.43324937027707805, y=0.2367758186397985),(x=0.49622166246851385, y=0.24181360201511334),(x=0.5591939546599496, y=0.24433249370277077),(x=0.6221662468513853, y=0.24937027707808562),(x=0.6851385390428212, y=0.24937027707808562),(x=0.7481108312342569, y=0.2518891687657431),(x=0.8110831234256927, y=0.2518891687657431),(x=0.8740554156171284, y=0.2518891687657431),(x=0.9370277078085643, y=0.2518891687657431),(x=1, y=0.24937027707808562),(x=0.9420654911838791, y=0.2216624685138539),(x=0.8790931989924433, y=0.2040302267002519),(x=0.8161209068010076, y=0.19143576826196473),(x=0.7531486146095717, y=0.17884130982367757),(x=0.690176322418136, y=0.16624685138539042),(x=0.6272040302267002, y=0.15869017632241814),(x=0.5642317380352645, y=0.15365239294710328),(x=0.5012594458438288, y=0.1712846347607053),(x=0.47103274559193953, y=0.22921914357682618),(x=0.47103274559193953, y=0.29219143576826195),(x=0.47103274559193953, y=0.35516372795969775),(x=0.4760705289672544, y=0.4181360201511335),(x=0.4760705289672544, y=0.48110831234256923),(x=0.47858942065491183, y=0.544080604534005),(x=0.48110831234256923, y=0.6070528967254408),(x=0.48614609571788414, y=0.6700251889168766),(x=0.4937027707808564, y=0.7329974811083123)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_upsilon" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0, y=0.26936026936026936),(x=0.05387205387205387, y=0.20202020202020202),(x=0.1313131313131313, y=0.16498316498316498),(x=0.20875420875420875, y=0.19528619528619529),(x=0.2626262626262626, y=0.25925925925925924),(x=0.29966329966329963, y=0.33670033670033667),(x=0.32996632996632996, y=0.41414141414141414),(x=0.35016835016835013, y=0.4949494949494949),(x=0.367003367003367, y=0.5791245791245792),(x=0.38047138047138046, y=0.6632996632996633),(x=0.39057239057239057, y=0.7474747474747474),(x=0.4006734006734007, y=0.8316498316498316),(x=0.4074074074074074, y=0.9158249158249158),(x=0.41414141414141414, y=1),(x=0.44107744107744107, y=0.9158249158249158),(x=0.4579124579124579, y=0.8316498316498316),(x=0.46464646464646464, y=0.7474747474747474),(x=0.4781144781144781, y=0.6632996632996633),(x=0.4882154882154882, y=0.5791245791245792),(x=0.5016835016835016, y=0.4949494949494949),(x=0.5151515151515151, y=0.41077441077441074),(x=0.531986531986532, y=0.3265993265993266),(x=0.5521885521885521, y=0.2424242424242424),(x=0.5757575757575757, y=0.15824915824915825),(x=0.6127946127946128, y=0.07744107744107744),(x=0.6565656565656566, y=0),(x=0.7272727272727273, y=0.043771043771043766),(x=0.7407407407407407, y=0.12794612794612795),(x=0.7474747474747474, y=0.2121212121212121)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_phi" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0.4235294117647059, y=0.1264705882352941),(x=0.35, y=0.12058823529411765),(x=0.27647058823529413, y=0.12941176470588234),(x=0.20588235294117646, y=0.1588235294117647),(x=0.14411764705882352, y=0.2),(x=0.08823529411764705, y=0.24705882352941178),(x=0.044117647058823525, y=0.3058823529411765),(x=0.011764705882352941, y=0.3735294117647059),(x=0, y=0.44705882352941173),(x=0.008823529411764706, y=0.5205882352941177),(x=0.041176470588235294, y=0.5882352941176471),(x=0.1, y=0.6323529411764706),(x=0.17352941176470588, y=0.6529411764705882),(x=0.24705882352941178, y=0.6441176470588236),(x=0.3176470588235294, y=0.6176470588235294),(x=0.38235294117647056, y=0.5823529411764706),(x=0.4411764705882353, y=0.5411764705882353),(x=0.5, y=0.4970588235294118),(x=0.5470588235294117, y=0.4411764705882353),(x=0.5911764705882353, y=0.37941176470588234),(x=0.6294117647058823, y=0.31470588235294117),(x=0.6529411764705882, y=0.2411764705882353),(x=0.6647058823529411, y=0.1676470588235294),(x=0.65, y=0.09411764705882353),(x=0.6088235294117647, y=0.032352941176470584),(x=0.5411764705882353, y=0),(x=0.4676470588235294, y=0.01764705882352941),(x=0.4176470588235294, y=0.07352941176470588),(x=0.37941176470588234, y=0.13823529411764707),(x=0.34411764705882353, y=0.20294117647058824),(x=0.3176470588235294, y=0.27058823529411763),(x=0.29411764705882354, y=0.3411764705882353),(x=0.27352941176470585, y=0.41470588235294115),(x=0.2529411764705882, y=0.4852941176470588),(x=0.23529411764705882, y=0.5588235294117647),(x=0.21764705882352942, y=0.6323529411764706),(x=0.20294117647058824, y=0.7058823529411764),(x=0.18823529411764706, y=0.7794117647058824),(x=0.1764705882352941, y=0.8529411764705882),(x=0.17058823529411765, y=0.9264705882352942),(x=0.16470588235294117, y=1)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_chi" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0, y=0.05626598465473146),(x=0.061381074168797956, y=0.03324808184143223),(x=0.12531969309462918, y=0.020460358056265986),(x=0.18925831202046037, y=0.01790281329923274),(x=0.2531969309462916, y=0.023017902813299233),(x=0.31457800511508954, y=0.04347826086956522),(x=0.36828644501278773, y=0.07672634271099744),(x=0.411764705882353, y=0.12276214833759591),(x=0.43734015345268545, y=0.18158567774936063),(x=0.4450127877237852, y=0.24552429667519182),(x=0.4347826086956522, y=0.30946291560102307),(x=0.40153452685422, y=0.3657289002557545),(x=0.360613810741688, y=0.4143222506393862),(x=0.30946291560102307, y=0.4552429667519182),(x=0.2531969309462916, y=0.4884910485933504),(x=0.1969309462915601, y=0.5191815856777494),(x=0.1329923273657289, y=0.5421994884910486),(x=0.0690537084398977, y=0.5601023017902814),(x=0.1329923273657289, y=0.5626598465473146),(x=0.19437340153452687, y=0.5396419437340154),(x=0.25063938618925835, y=0.5089514066496164),(x=0.30434782608695654, y=0.4705882352941177),(x=0.350383631713555, y=0.4245524296675192),(x=0.38874680306905374, y=0.37340153452685426),(x=0.42710997442455245, y=0.319693094629156),(x=0.46547314578005117, y=0.2659846547314578),(x=0.5063938618925832, y=0.2173913043478261),(x=0.5473145780051152, y=0.1687979539641944),(x=0.5933503836317136, y=0.12531969309462918),(x=0.6419437340153453, y=0.08184143222506395),(x=0.6982097186700768, y=0.04859335038363172),(x=0.7570332480818415, y=0.01790281329923274),(x=0.8184143222506395, y=0),(x=0.7544757033248083, y=0.0025575447570332483),(x=0.690537084398977, y=0.020460358056265986),(x=0.6265984654731458, y=0.04347826086956522),(x=0.5703324808184144, y=0.07672634271099744),(x=0.5191815856777494, y=0.11764705882352942),(x=0.4782608695652174, y=0.16624040920716113),(x=0.44757033248081846, y=0.22506393861892585),(x=0.4347826086956522, y=0.28900255754475707),(x=0.43734015345268545, y=0.35294117647058826),(x=0.46547314578005117, y=0.411764705882353),(x=0.5063938618925832, y=0.45780051150895146),(x=0.5601023017902814, y=0.49360613810741694),(x=0.6214833759590793, y=0.5166240409207161),(x=0.6854219948849105, y=0.5242966751918159),(x=0.7493606138107417, y=0.5242966751918159),(x=0.813299232736573, y=0.5166240409207161),(x=0.8772378516624042, y=0.4987212276214834),(x=0.9386189258312021, y=0.4782608695652174),(x=1, y=0.45780051150895146)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_psi" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0, y=0.030136986301369864),(x=0.0684931506849315, y=0.0136986301369863),(x=0.136986301369863, y=0.010958904109589041),(x=0.1863013698630137, y=0.06027397260273973),(x=0.20821917808219179, y=0.12602739726027398),(x=0.2273972602739726, y=0.1917808219178082),(x=0.2602739726027397, y=0.25205479452054796),(x=0.3150684931506849, y=0.29315068493150687),(x=0.3835616438356164, y=0.31232876712328766),(x=0.452054794520548, y=0.3178082191780822),(x=0.5205479452054794, y=0.3232876712328767),(x=0.589041095890411, y=0.3232876712328767),(x=0.6575342465753424, y=0.3232876712328767),(x=0.726027397260274, y=0.32054794520547947),(x=0.7945205479452054, y=0.30684931506849317),(x=0.8547945205479452, y=0.27123287671232876),(x=0.8821917808219178, y=0.20821917808219179),(x=0.873972602739726, y=0.13972602739726028),(x=0.8356164383561644, y=0.0821917808219178),(x=0.7753424657534247, y=0.043835616438356165),(x=0.7095890410958904, y=0.016438356164383564),(x=0.6410958904109589, y=0),(x=0.5917808219178082, y=0.049315068493150684),(x=0.5643835616438356, y=0.11232876712328767),(x=0.5452054794520548, y=0.1780821917808219),(x=0.5287671232876713, y=0.24657534246575344),(x=0.5178082191780822, y=0.3150684931506849),(x=0.5068493150684932, y=0.3835616438356164),(x=0.5013698630136987, y=0.452054794520548),(x=0.4986301369863014, y=0.5205479452054794),(x=0.4931506849315069, y=0.589041095890411),(x=0.4931506849315069, y=0.6575342465753424),(x=0.4904109589041096, y=0.726027397260274),(x=0.4931506849315069, y=0.7945205479452054),(x=0.4958904109589041, y=0.863013698630137),(x=0.4986301369863014, y=0.9315068493150686),(x=0.5095890410958904, y=1)"/>
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
					<gesture_event  type="stroke_greek">
						<property ref="stroke_x"/>
						<property ref="stroke_y"/>
						<property ref="stroke_prob"/>
					</gesture_event>
				</update>
			</mapping>
		</Gesture>
		
		<Gesture id="greek_omega" type="stroke">
			<match>
				<action>
					<initial>		
						<point path_pts="(x=0, y=1),(x=0.0728862973760933, y=0.9970845481049563),(x=0.1457725947521866, y=0.9970845481049563),(x=0.21865889212827988, y=0.9970845481049563),(x=0.2915451895043732, y=1),(x=0.29737609329446063, y=0.9271137026239067),(x=0.2507288629737609, y=0.8688046647230321),(x=0.20116618075801748, y=0.8104956268221574),(x=0.15451895043731778, y=0.749271137026239),(x=0.11661807580174927, y=0.685131195335277),(x=0.08454810495626822, y=0.6151603498542274),(x=0.061224489795918366, y=0.5422740524781341),(x=0.04664723032069971, y=0.4693877551020408),(x=0.04081632653061224, y=0.3965014577259475),(x=0.04081632653061224, y=0.3236151603498542),(x=0.052478134110787174, y=0.2507288629737609),(x=0.0728862973760933, y=0.17784256559766765),(x=0.1107871720116618, y=0.11370262390670553),(x=0.1661807580174927, y=0.0641399416909621),(x=0.2303206997084548, y=0.029154518950437316),(x=0.30029154518950435, y=0.0058309037900874635),(x=0.37317784256559766, y=0),(x=0.446064139941691, y=0.008746355685131196),(x=0.5131195335276968, y=0.037900874635568516),(x=0.5743440233236151, y=0.07871720116618075),(x=0.6239067055393586, y=0.13411078717201166),(x=0.6618075801749271, y=0.19533527696793002),(x=0.6880466472303207, y=0.26239067055393583),(x=0.705539358600583, y=0.33527696793002915),(x=0.7084548104956269, y=0.40816326530612246),(x=0.705539358600583, y=0.4810495626822157),(x=0.6938775510204082, y=0.5539358600583091),(x=0.673469387755102, y=0.6268221574344023),(x=0.6501457725947521, y=0.6967930029154519),(x=0.6209912536443148, y=0.7638483965014577),(x=0.5889212827988338, y=0.8309037900874635),(x=0.5568513119533528, y=0.8979591836734694),(x=0.5364431486880467, y=0.967930029154519),(x=0.60932944606414, y=0.9766763848396501),(x=0.6822157434402333, y=0.9650145772594751),(x=0.7551020408163265, y=0.9591836734693877),(x=0.8279883381924198, y=0.956268221574344),(x=0.9008746355685131, y=0.956268221574344)"/>
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
					<gesture_event  type="stroke_greek">
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
		
			
	<Gesture_set id="stroke_letter_lowercase">
		<comment>This is a set of lowercase letters of the English alphabet</comment>
		
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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
						<property id="stroke_x" result="x"/>
						<property id="stroke_y" result="y"/>
						<property id="stroke_prob" result="prob"/>
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