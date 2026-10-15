*** Keywords ***
Select Installation Type
    [Arguments]    ${install_type}
    [Documentation]    Select STANDARD or SPECIAL installation
    IF    '${install_type}' == 'STANDARD'
        common.Click element when ready    ${APPT.INSTALL_STANDARD.BUTTON}
    ELSE
        common.Click element when ready    ${APPT.INSTALL_SPECIAL.BUTTON}
    END

Select Appointment Slot
    [Arguments]    ${slot_time}
    [Documentation]    Pick MORNING or AFTERNOON slot on first available calendar date
    common.Click element when ready        ${APPT.AVAILABLE_DATE.BUTTON}
    IF    '${slot_time}' == 'MORNING'
        common.Click element when ready    ${APPT.SLOT_MORNING.BUTTON}
    ELSE
        common.Click element when ready    ${APPT.SLOT_AFTERNOON.BUTTON}
    END

Handle Port Or Date Full Conflict
    [Documentation]    Check if port or slot full modal appears and handle reschedule
    ${is_full}=    Run Keyword And Return Status    common.Verify element is visible when ready    ${APPT.DATE_FULL.TEXT}    timeout=3s
    IF    ${is_full}
        common.Click element when ready    ${APPT.MODAL_RESCHEDULE.BUTTON}
        common.Click element when ready    ${APPT.SLOT_AFTERNOON.BUTTON}
    END

Click Next Button On Appointment
    [Documentation]    Proceed to Order Review
    common.Click element when ready        ${APPT.NEXT.BUTTON}
