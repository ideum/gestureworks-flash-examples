<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
<Gesture_set>
	
	<Gesture id="tilt-3f" type="tilt">
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
		<processing>
			<multiply_filter>
					<property ref="tilt_dx" active="true" factor="1000"/>
					<property ref="tilt_dy" active="true" factor="1000"/>
			</multiply_filter>
		</processing>										
		<mapping>
			<update dispatch_type="continuous">
				<gesture_event  type="tilt">
					<property ref="tilt_dx" target=""/>
					<property ref="tilt_dy" target=""/>
				</gesture_event>
			</update>
		</mapping>
	</Gesture>
									
</Gesture_set>					
</GestureMarkupLanguage>