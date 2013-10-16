<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
<Gesture_set>			
	
	<Gesture id="pivot" type="pivot">
		<match>
			<action>
				<initial>
					<cluster point_number="1"/>
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
				<property ref="pivot_dtheta" active="true" delta_min="0.0001" delta_max="1"/>
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

</Gesture_set>					
</GestureMarkupLanguage>