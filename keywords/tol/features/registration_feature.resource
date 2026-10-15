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


