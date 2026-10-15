*** Variables ***
# Installation Type
${APPT.INSTALL_STANDARD.BUTTON}                 xpath=//input[@name='installType' and @value='STANDARD']
${APPT.INSTALL_SPECIAL.BUTTON}                  xpath=//input[@name='installType' and @value='SPECIAL']

# Calendar & Time Slots
${APPT.CALENDAR_CONTAINER.TEXT}                 xpath=//div[contains(@class,'appointment-calendar')]
${APPT.AVAILABLE_DATE.BUTTON}                   xpath=//td[contains(@class,'calendar-day-available')]
${APPT.SLOT_MORNING.BUTTON}                     xpath=//input[@name='timeSlot' and @value='MORNING']
${APPT.SLOT_AFTERNOON.BUTTON}                   xpath=//input[@name='timeSlot' and @value='AFTERNOON']
${APPT.SELECTED_DATE.TEXT}                      xpath=//span[@id='lbl-selected-date']

# Conflict & Port Full Dialog
${APPT.PORT_FULL.TEXT}                          xpath=//div[contains(@class,'modal-port-capacity-full')]
${APPT.DATE_FULL.TEXT}                          xpath=//div[contains(@class,'modal-date-slot-full')]
${APPT.MODAL_RESCHEDULE.BUTTON}                 xpath=//button[@id='btn-reselect-appointment' or contains(text(),'เลือกวันติดตั้งใหม่')]

# Navigation
${APPT.NEXT.BUTTON}                             xpath=//button[@id='btn-appointment-next' or contains(text(),'ถัดไป')]
${APPT.BACK.BUTTON}                             xpath=//button[@id='btn-appointment-back' or contains(@class,'btn-back')]
