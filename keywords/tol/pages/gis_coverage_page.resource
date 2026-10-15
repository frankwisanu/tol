*** Keywords ***
Verify GIS Webview Displayed
    common.Verify element is visible when ready    ${SGIS.WEBVIEW_CONTAINER.TEXT}

Search Installation Address
    [Arguments]    ${query}
    common.Input text when ready       ${SGIS.SEARCH_LOCATION.TEXTBOX}    ${query}
    common.Click element when ready    ${SGIS.SEARCH_SUBMIT.BUTTON}
    common.Verify element is visible when ready    ${SGIS.MAP_MARKER.BUTTON}

Confirm Geolocation Pin
    common.Click element when ready    ${SGIS.CONFIRM_LOCATION.BUTTON}

Verify Coverage Tier Status
    [Arguments]    ${tier}
    common.Verify element is visible when ready    xpath=//div[@data-coverage='${tier}']

Select House Type For Over Cable
    [Arguments]    ${type}
    common.Click element when ready    xpath=//input[@name='houseType' and @value='${type}']
    Run Keyword If    '${type}' == 'PRIVATE'    common.Click element when ready    ${SGIS.ACCEPT_OVERCABLE_FEE.BUTTON}

Click Register Service Button
    common.Click element when ready    ${SGIS.REGISTER_SERVICE.BUTTON}

Click Back Arrow Button
    common.Click element when ready    ${SGIS.BACK.BUTTON}
