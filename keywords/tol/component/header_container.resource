*** Settings ***
Documentation       Common Header and Progress Bar Component for One App

*** Variables ***
${HEADER.LABEL_USER_AGENT_CODE}               xpath=//span[@id='header-agent-code']
${HEADER.LABEL_CURRENT_STEP}                  xpath=//span[contains(@class,'step-indicator-active')]
${HEADER.BTN_GLOBAL_BACK}                     xpath=//button[@id='btn-global-nav-back']
${HEADER.BTN_LOGOUT}                          xpath=//button[@id='btn-global-logout']

*** Keywords ***
Verify Sales Agent Session Active
    [Arguments]    ${expected_agent_code}
    [Documentation]    Verify agent ID in top header bar
    Element Should Contain    ${HEADER.LABEL_USER_AGENT_CODE}    ${expected_agent_code}

Verify Registration Step Indicator
    [Arguments]    ${step_name}
    [Documentation]    Assert current step on top registration stepper
    Element Should Contain    ${HEADER.LABEL_CURRENT_STEP}    ${step_name}
