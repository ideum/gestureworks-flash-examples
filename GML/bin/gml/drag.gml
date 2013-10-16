<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
<Gesture_set>
	
	<Gesture id="drag" type="drag">
		<comment>The 'drag' gesture can be activated by any number of touch points between 1 and 10. When a touch down is recognized on a touch object the position
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
		
</Gesture_set>					
</GestureMarkupLanguage>