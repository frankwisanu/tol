*** Settings ***
Documentation   Page Object keywords for SGIS Coverage Check (Minimal Code)
Resource        ${CURDIR}/../../../locators/gis_coverage_locator.resource
Resource        ${CURDIR}/../../../common/common.resource

*** Keywords ***
Verify GIS Webview Displayed
    common.Verify element is visible when ready    ${SGIS.WEBVIEW_CONTAINER}

Search Installation Address
    [Arguments]    ${query}
    common.Input text when ready       ${SGIS.INPUT_SEARCH_LOCATION}    ${query}
    common.Click element when ready    ${SGIS.BTN_SEARCH_SUBMIT}
    common.Verify element is visible when ready    ${SGIS.PIN_MAP_MARKER}

Confirm Geolocation Pin
    common.Click element when ready    ${SGIS.BTN_CONFIRM_LOCATION}

Verify Coverage Tier Status
    [Arguments]    ${tier}
    common.Verify element is visible when ready    xpath=//div[@data-coverage='${tier}']

Select House Type For Over Cable
    [Arguments]    ${type}
    common.Click element when ready    xpath=//input[@name='houseType' and @value='${type}']
    Run Keyword If    '${type}' == 'PRIVATE'    common.Click element when ready    ${SGIS.CHECKBOX_ACCEPT_OVERCABLE_FEE}

Click Register Service Button
    common.Click element when ready    ${SGIS.BTN_REGISTER_SERVICE}

Click Back Arrow Button
    common.Click element when ready    ${SGIS.BTN_BACK}
