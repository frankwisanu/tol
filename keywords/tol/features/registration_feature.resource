*** Settings ***
Documentation       Feature-level business flow for True Online (TOL) Registration & Stepper Lifecycle
Resource            ../pages/registration_page.resource

*** Keywords ***
Initiate TrueOnline Registration Flow
    [Arguments]    ${reg_type}=NEW_CUSTOMER    ${sale_agent_id}=${EMPTY}    ${rtr_code}=${EMPTY}    ${dtr_code}=${EMPTY}
    [Documentation]    Open registration hub, select registration type, fill partner info, accept PDPA, and start
    registration_page.Verify Registration Hub Displayed
    registration_page.Select Registration Type              ${reg_type}
    IF    '${sale_agent_id}' != '${EMPTY}'
        registration_page.Input Sales Partner Credentials   ${sale_agent_id}    ${rtr_code}    ${dtr_code}
    END
    registration_page.Accept Registration PDPA And Terms
    registration_page.Click Start Registration Button
    registration_page.Verify Active Registration Step       COVERAGE

Verify Registration Stepper Progress
    [Arguments]    ${step_name}
    [Documentation]    Verify current active milestone in registration progress bar
    registration_page.Verify Active Registration Step       ${step_name}

Resume Pending Registration Draft
    [Arguments]    ${draft_id}
    [Documentation]    Resume an incomplete order draft by transaction ID
    registration_page.Click Resume Registration Button
