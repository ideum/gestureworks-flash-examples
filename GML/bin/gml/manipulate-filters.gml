<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
<Gesture_set>
				
	<Gesture id="manipulate-filters" type="manipulate">
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
				<property ref="dx" active="true" boundary_min="200" boundary_max="1080"/>
				<property ref="dy" active="true" boundary_min="200" boundary_max="520"/>
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
</GestureMarkupLanguage>