*** Settings ***
Documentation       Locators for Installation Type, Appointment Calendar & Port Capacity Check

*** Variables ***
# Installation Type
${APPT.RADIO_INSTALL_STANDARD}                xpath=//input[@name='installType' and @value='STANDARD']
${APPT.RADIO_INSTALL_SPECIAL}                 xpath=//input[@name='installType' and @value='SPECIAL']

# Calendar & Time Slots
${APPT.CALENDAR_CONTAINER}                    xpath=//div[contains(@class,'appointment-calendar')]
${APPT.CELL_AVAILABLE_DATE}                   xpath=//td[contains(@class,'calendar-day-available')]
${APPT.RADIO_SLOT_MORNING}                    xpath=//input[@name='timeSlot' and @value='MORNING']
${APPT.RADIO_SLOT_AFTERNOON}                  xpath=//input[@name='timeSlot' and @value='AFTERNOON']
${APPT.LABEL_SELECTED_DATE}                   xpath=//span[@id='lbl-selected-date']

# Conflict & Port Full Dialog
${APPT.MODAL_PORT_FULL}                       xpath=//div[contains(@class,'modal-port-capacity-full')]
${APPT.MODAL_DATE_FULL}                       xpath=//div[contains(@class,'modal-date-slot-full')]
${APPT.BTN_MODAL_RESCHEDULE}                  xpath=//button[@id='btn-reselect-appointment' or contains(text(),'เลือกวันติดตั้งใหม่')]

# Navigation
${APPT.BTN_NEXT}                              xpath=//button[@id='btn-appointment-next' or contains(text(),'ถัดไป')]
${APPT.BTN_BACK}                              xpath=//button[@id='btn-appointment-back' or contains(@class,'btn-back')]
