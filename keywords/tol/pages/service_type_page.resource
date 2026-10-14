*** Settings ***
Documentation       Page Object keywords for Service Selection and Sales Channel
Resource            ${CURDIR}/../../../locators/service_type_locator.resource
Resource            ${CURDIR}/../../../common/common.resource

*** Keywords ***
Verify Service Selection Page Displayed
    [Documentation]    Verify presence of Service Selection screen
    common.Verify element is visible when ready    ${SERVICE.LABEL_TITLE}

Verify Internet Service Is Mandatory And Preselected
    [Documentation]    Validate that TOL internet is checked by default and cannot be unchecked
    common.Verify element is visible when ready    ${SERVICE.CHK_INTERNET}
    common.Checkbox should be selected when ready  ${SERVICE.CHK_INTERNET}

Configure Addon Services
    [Arguments]    ${include_tmh}=False    ${include_trueid}=False    ${include_flp}=False
    [Documentation]    Select optional services (Mobile TMH, TrueID TV, Fixed Line Plus)
    IF    ${include_tmh}
        common.Select checkbox when ready    ${SERVICE.CHK_MOBILE_TMH}
    END
    IF    ${include_trueid}
        common.Select checkbox when ready    ${SERVICE.CHK_TRUEID_TV}
    END
    IF    ${include_flp}
        common.Select checkbox when ready    ${SERVICE.CHK_FIXED_LINE}
    END

Select Sales Channel
    [Arguments]    ${channel_type}
    [Documentation]    Select 'ONLINE' or 'OFFLINE_DIRECT'
    IF    '${channel_type}' == 'ONLINE'
        common.Click element when ready    ${SERVICE.RADIO_CHANNEL_ONLINE}
    ELSE
        common.Click element when ready    ${SERVICE.RADIO_CHANNEL_DIRECT}
    END

Click Next Button On Service Selection
    [Documentation]    Proceed to customer identity validation
    common.Click element when ready    ${SERVICE.BTN_NEXT}
