*** Keywords ***
Verify Registration Hub Displayed
    [Documentation]    Verify presence of TrueOnline registration entry screen
    common.Verify element is visible when ready    ${REGISTRATION.HEADER.TEXT}

Navigate To Registration Menu
    common.Click element when ready                ${REGISTRATION.MENU_ENTRY.BUTTON}
    common.Verify element is visible when ready    ${REGISTRATION.HEADER.TEXT}

Select Registration Type
    [Arguments]    ${reg_type}=NEW_CUSTOMER
    [Documentation]    Select NEW_CUSTOMER, EXISTING_ADDON, or MIGRATION_CVG
    IF    '${reg_type}' == 'NEW_CUSTOMER'
        common.Click element when ready    ${REGISTRATION.NEW_CUSTOMER.BUTTON}
    ELSE IF    '${reg_type}' == 'EXISTING_ADDON'
        common.Click element when ready    ${REGISTRATION.EXISTING_ADDON.BUTTON}
    ELSE
        common.Click element when ready    ${REGISTRATION.MIGRATION_CVG.BUTTON}
    END

Input Sales Partner Credentials
    [Arguments]    ${sale_agent_id}    ${rtr_code}    ${dtr_code}=${EMPTY}    ${channel}=ONLINE
    [Documentation]    Input sales agent ID, retail partner RTR code, and DMS DTR code
    common.Input text when ready    ${REGISTRATION.SALE_AGENT_ID.TEXTBOX}    ${sale_agent_id}
    common.Input text when ready    ${REGISTRATION.RTR_CODE.TEXTBOX}         ${rtr_code}
    IF    '${dtr_code}' != '${EMPTY}'
        common.Input text when ready    ${REGISTRATION.DTR_CODE.TEXTBOX}     ${dtr_code}
    END

Accept Registration PDPA And Terms
    [Documentation]    Check mandatory PDPA consent and registration agreement
    common.Select checkbox when ready    ${REGISTRATION.PDPA_CONSENT.BUTTON}
    common.Select checkbox when ready    ${REGISTRATION.REGISTRATION_TERMS.BUTTON}

Click Start Registration Button
    [Documentation]    Advance from registration hub to SGIS Coverage Check
    common.Click element when ready    ${REGISTRATION.START_REGISTRATION.BUTTON}

Click Resume Registration Button
    [Documentation]    Resume an incomplete or pending draft registration
    common.Click element when ready    ${REGISTRATION.RESUME_REGISTRATION.BUTTON}

Click Check Status Button
    [Documentation]    Query registration tracking and order status
    common.Click element when ready    ${REGISTRATION.CHECK_STATUS.BUTTON}

Verify Active Registration Step
    [Arguments]    ${step_name}
    [Documentation]    Assert active breadcrumb step in the registration stepper
    IF    '${step_name}' == 'COVERAGE'
        common.Verify element is visible when ready    ${REGISTRATION.STEP_COVERAGE.TEXT}
    ELSE IF    '${step_name}' == 'SERVICE'
        common.Verify element is visible when ready    ${REGISTRATION.STEP_SERVICE.TEXT}
    ELSE IF    '${step_name}' == 'KYC'
        common.Verify element is visible when ready    ${REGISTRATION.STEP_KYC.TEXT}
    ELSE IF    '${step_name}' == 'PACKAGE'
        common.Verify element is visible when ready    ${REGISTRATION.STEP_PACKAGE.TEXT}
    ELSE IF    '${step_name}' == 'APPOINTMENT'
        common.Verify element is visible when ready    ${REGISTRATION.STEP_APPOINTMENT.TEXT}
    ELSE IF    '${step_name}' == 'REVIEW'
        common.Verify element is visible when ready    ${REGISTRATION.STEP_REVIEW.TEXT}
    END
