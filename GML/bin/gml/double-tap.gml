<?xml version="1.0" encoding="UTF-8"?>
<GestureMarkupLanguage>
<Gesture_set>	
	
	<Gesture id="double-tap" type="double-tap">
	  <match>
		  <action>
			  <initial>
				  <point event_duration_max="300" interevent_duration_max="300" translation_max="20"/>
				  <cluster point_number="0"/>
				  <event gesture_event="tap"/>
			  </initial>
		  </action>
	  </match>	
	  <analysis>
		  <algorithm class="temporalmetric" type="discrete">
			  <library module="double_tap"/>
			  <returns>
				  <property id="double_tap_x" result="x"/>
				  <property id="double_tap_y" result="y"/>
				  <property id="double_tap_n" result="n"/>
			  </returns>
		  </algorithm>
	  </analysis>	
	  <mapping>
		  <update dispatch_type="discrete" dispatch_mode="batch" dispatch_interval="200">
			  <gesture_event  type="double_tap">
				  <property ref="double_tap_x"/>
				  <property ref="double_tap_y"/>
				  <property ref="double_tap_n"/>
			  </gesture_event>
		  </update>
	  </mapping>
	</Gesture>
		
</Gesture_set>	
</GestureMarkupLanguage>