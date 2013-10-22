<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
<Gesture_set>
				
	<Gesture id="tap" type="tap">
		<match>
			<action>
				<initial>
					<point event_duration_max="200" translation_max="10"/>
					<cluster point_number="0" point_number_min="1" point_number_max="10"/>
					<event touch_event="gwTouchEnd"/>
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
			
</Gesture_set>					
</GestureMarkupLanguage>