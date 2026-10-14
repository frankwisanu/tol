*** Settings ***
Documentation       Page Object keywords for Installation Type, Appointment & Port Check
Resource            ${CURDIR}/../../../locators/appointment_locator.resource
Resource            ${CURDIR}/../../../common/common.resource

*** Keywords ***
Select Installation Type
    [Arguments]    ${install_type}
    [Documentation]    Select STANDARD or SPECIAL installation
    IF    '${install_type}' == 'STANDARD'
        common.Click element when ready    ${APPT.RADIO_INSTALL_STANDARD}
    ELSE
        common.Click element when ready    ${APPT.RADIO_INSTALL_SPECIAL}
    END

Select Appointment Slot
    [Arguments]    ${slot_time}
    [Documentation]    Pick MORNING or AFTERNOON slot on first available calendar date
    common.Click element when ready        ${APPT.CELL_AVAILABLE_DATE}
    IF    '${slot_time}' == 'MORNING'
        common.Click element when ready    ${APPT.RADIO_SLOT_MORNING}
    ELSE
        common.Click element when ready    ${APPT.RADIO_SLOT_AFTERNOON}
    END

Handle Port Or Date Full Conflict
    [Documentation]    Check if port or slot full modal appears and handle reschedule
    ${is_full}=    Run Keyword And Return Status    common.Verify element is visible when ready    ${APPT.MODAL_DATE_FULL}    timeout=3s
    IF    ${is_full}
        common.Click element when ready    ${APPT.BTN_MODAL_RESCHEDULE}
        common.Click element when ready    ${APPT.RADIO_SLOT_AFTERNOON}
    END

Click Next Button On Appointment
    [Documentation]    Proceed to Order Review
    common.Click element when ready        ${APPT.BTN_NEXT}
