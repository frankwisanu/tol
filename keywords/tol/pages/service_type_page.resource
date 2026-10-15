*** Keywords ***
Verify Service Selection Page Displayed
    [Documentation]    Verify presence of Service Selection screen
    common.Verify element is visible when ready    ${SERVICE.TITLE.TEXT}

Verify Internet Service Is Mandatory And Preselected
    [Documentation]    Validate that TOL internet is checked by default and cannot be unchecked
    common.Verify element is visible when ready    ${SERVICE.INTERNET.BUTTON}
    common.Checkbox should be selected when ready  ${SERVICE.INTERNET.BUTTON}

Configure Addon Services
    [Arguments]    ${include_tmh}=False    ${include_trueid}=False    ${include_flp}=False
    [Documentation]    Select optional services (Mobile TMH, TrueID TV, Fixed Line Plus)
    IF    ${include_tmh}
        common.Select checkbox when ready    ${SERVICE.MOBILE_TMH.BUTTON}
    END
    IF    ${include_trueid}
        common.Select checkbox when ready    ${SERVICE.TRUEID_TV.BUTTON}
    END
    IF    ${include_flp}
        common.Select checkbox when ready    ${SERVICE.FIXED_LINE.BUTTON}
    END

Select Sale Channel
    [Arguments]    ${channel}=ONLINE
    [Documentation]    Select 'ONLINE' or 'OFFLINE_DIRECT' (supports both ONLINE and ONLIEN)
    IF    '${channel}' == 'ONLINE' or '${channel}' == 'ONLIEN'
        common.Click element when ready    ${SERVICE.CHANNEL_ONLINE.BUTTON}
    ELSE
        common.Click element when ready    ${SERVICE.CHANNEL_DIRECT.BUTTON}
    END

Select Sales Channel
    [Arguments]    ${channel}=ONLINE
    [Documentation]    Alias for Select Sale Channel
    Select Sale Channel    ${channel}

Click Next Button On Service Selection
    [Documentation]    Proceed to customer identity validation
    common.Click element when ready    ${SERVICE.NEXT.BUTTON}
