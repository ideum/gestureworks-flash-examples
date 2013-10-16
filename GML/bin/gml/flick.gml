<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
<Gesture_set>
		
	<Gesture id="flick" type="flick">
		<comment>The 'flick' gesture can be activated by any number of touch points. When a touch down is recognized on a touch object, the velocity and 
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
		
</Gesture_set>					
</GestureMarkupLanguage>