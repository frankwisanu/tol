*** Keywords ***
Open TOL Registration From One App Hub
    [Documentation]    Navigate through One App native home screen into TrueOnline registration
    common.Click mobile element when ready    ${ONEAPP.TAB_OTHER_SERVICES.BUTTON}
    common.Click mobile element when ready    ${ONEAPP.MENU_TOL_REGISTRATION.BUTTON}

Grant Required Permissions If Prompted
    [Documentation]    Automatically grant Android runtime permissions (Location, Camera) if system dialog appears
    ${is_prompted}=    Run Keyword And Return Status    common.Click mobile element when ready    ${ONEAPP.BTN_ALLOW_PERMISSION.BUTTON}    timeout=3s
