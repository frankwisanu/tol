*** Settings ***
Documentation       Page Object keywords for True Online (TOL) Registration Hub and Onboarding Lifecycle
Resource            ${CURDIR}/../../../locators/registration_locator.resource
Resource            ${CURDIR}/../../../common/common.resource

*** Keywords ***
Verify Registration Hub Displayed
    [Documentation]    Verify presence of TrueOnline registration entry screen
    common.Verify element is visible when ready    ${REGISTRATION.LBL_HEADER}

Navigate To Registration Menu
    [Documentation]    Click registration entry menu from One App dashboard
    common.Click element when ready                ${REGISTRATION.MENU_ENTRY}
    common.Verify element is visible when ready    ${REGISTRATION.LBL_HEADER}

Select Registration Type
    [Arguments]    ${reg_type}=NEW_CUSTOMER
    [Documentation]    Select NEW_CUSTOMER, EXISTING_ADDON, or MIGRATION_CVG
    IF    '${reg_type}' == 'NEW_CUSTOMER'
        common.Click element when ready    ${REGISTRATION.RADIO_NEW_CUSTOMER}
    ELSE IF    '${reg_type}' == 'EXISTING_ADDON'
        common.Click element when ready    ${REGISTRATION.RADIO_EXISTING_ADDON}
    ELSE
        common.Click element when ready    ${REGISTRATION.RADIO_MIGRATION_CVG}
    END

Input Sales Partner Credentials
    [Arguments]    ${sale_agent_id}    ${rtr_code}    ${dtr_code}=${EMPTY}    ${channel}=ONLINE
    [Documentation]    Input sales agent ID, retail partner RTR code, and DMS DTR code
    common.Input text when ready    ${REGISTRATION.INPUT_SALE_AGENT_ID}    ${sale_agent_id}
    common.Input text when ready    ${REGISTRATION.INPUT_RTR_CODE}         ${rtr_code}
    IF    '${dtr_code}' != '${EMPTY}'
        common.Input text when ready    ${REGISTRATION.INPUT_DTR_CODE}     ${dtr_code}
    END

Accept Registration PDPA And Terms
    [Documentation]    Check mandatory PDPA consent and registration agreement
    common.Select checkbox when ready    ${REGISTRATION.CHK_PDPA_CONSENT}
    common.Select checkbox when ready    ${REGISTRATION.CHK_REGISTRATION_TERMS}

Click Start Registration Button
    [Documentation]    Advance from registration hub to SGIS Coverage Check
    common.Click element when ready    ${REGISTRATION.BTN_START_REGISTRATION}

Click Resume Registration Button
    [Documentation]    Resume an incomplete or pending draft registration
    common.Click element when ready    ${REGISTRATION.BTN_RESUME_REGISTRATION}

Click Check Status Button
    [Documentation]    Query registration tracking and order status
    common.Click element when ready    ${REGISTRATION.BTN_CHECK_STATUS}

Verify Active Registration Step
    [Arguments]    ${step_name}
    [Documentation]    Assert active breadcrumb step in the registration stepper
    IF    '${step_name}' == 'COVERAGE'
        common.Verify element is visible when ready    ${REGISTRATION.STEP_COVERAGE}
    ELSE IF    '${step_name}' == 'SERVICE'
        common.Verify element is visible when ready    ${REGISTRATION.STEP_SERVICE}
    ELSE IF    '${step_name}' == 'KYC'
        common.Verify element is visible when ready    ${REGISTRATION.STEP_KYC}
    ELSE IF    '${step_name}' == 'PACKAGE'
        common.Verify element is visible when ready    ${REGISTRATION.STEP_PACKAGE}
    ELSE IF    '${step_name}' == 'APPOINTMENT'
        common.Verify element is visible when ready    ${REGISTRATION.STEP_APPOINTMENT}
    ELSE IF    '${step_name}' == 'REVIEW'
        common.Verify element is visible when ready    ${REGISTRATION.STEP_REVIEW}
    END
