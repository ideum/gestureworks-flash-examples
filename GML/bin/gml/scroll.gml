<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
<Gesture_set>
				
	<Gesture id="scroll" type="scroll">
		<comment>The 'scroll' gesture can be activated by any number of touch points. When a touch down is recognized on a touch object, 
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
</GestureMarkupLanguage>