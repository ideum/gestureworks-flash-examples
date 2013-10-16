<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
<Gesture_set>
				
	<Gesture id="scale" type="scale">			
		<comment>The 'scale' gesture can be activated by any number of touch points between 2 and 10. When two or more touch points are recognized on a touch object the relative separation
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
</GestureMarkupLanguage>