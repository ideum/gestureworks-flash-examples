<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
<Gesture_set>
				
	<Gesture id="rotate" type="rotate">
	<comment>The 'rotate' gesture can be activated by any number of touch points between 2 and 10. When two or more touch points are recognized on a touch object the relative orientation
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
			
</Gesture_set>				
</GestureMarkupLanguage>