<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
<Gesture_set>
	
	<Gesture id="n-hold" type="hold">
		<match>
			<action>
				<initial>
					<point event_duration_min="2000" translation_max="2"/>
					<cluster point_number="0" point_number_min="1" point_number_max="5"/>
				</initial>
			</action>
		</match>	
		<analysis>
			<algorithm class="temporalmetric" type="discrete">
				<library  module="hold"/>
				<returns>
					<property id="hold_x" result="x"/>
					<property id="hold_y" result="y"/>
					<property id="hold_n" result="n"/>
				</returns>
			</algorithm>
		</analysis>	
		<mapping>
			<update dispatch_type="discrete" dispatch_reset="cluster_remove">
				<gesture_event  type="hold">
					<property ref="hold_x"/>
					<property ref="hold_y"/>
					<property ref="hold_n"/>
				</gesture_event>
			</update>
		</mapping>
	</Gesture>
			
	</Gesture_set>				
</GestureMarkupLanguage>