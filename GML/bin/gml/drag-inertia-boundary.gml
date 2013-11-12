<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
<Gesture_set>
				
	<Gesture id="drag-inertia-boundary" type="drag">
		<comment></comment>
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
		</processing>
		<mapping>
			<update dispatch_type="continuous">
				<gesture_event type="drag">
					<property ref="drag_dx" target="x" min="10" max="1200" />
					<property ref="drag_dy" target="y" min="10" max="650" />
				</gesture_event>
			</update>
		</mapping>
	</Gesture>
					
</Gesture_set>				
</GestureMarkupLanguage>