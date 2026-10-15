*** Variables ***
# One App Native Android Elements
${ONEAPP.TAB_OTHER_SERVICES.BUTTON}          xpath=//android.widget.TextView[@text='บริการอื่นๆ' or contains(@resource-id,'tab_other_services')]
${ONEAPP.MENU_TOL_REGISTRATION.BUTTON}       xpath=//android.widget.TextView[@text='ลงทะเบียนทรูออนไลน์' or contains(@resource-id,'menu_tol_registration')]
${ONEAPP.BTN_ALLOW_PERMISSION.BUTTON}        xpath=//android.widget.Button[@text='ALLOW' or @text='อนุญาต' or contains(@resource-id,'permission_allow_button')]
${ONEAPP.WEBVIEW_CONTAINER.TEXT}             xpath=//android.webkit.WebView
