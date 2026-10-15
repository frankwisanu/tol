*** Keywords ***
Wait For Order Submission Processing
    [Documentation]    Wait for background tolSubmit orchestration to complete
    common.Verify element is visible when ready        ${SUBMIT.SPINNER_LOADING.TEXT}       timeout=5s
    common.Verify element is not visible when ready    ${SUBMIT.SPINNER_LOADING.TEXT}       timeout=30s

Verify Order Submission Success
    [Documentation]    Ensure success screen is displayed with valid generated Order ID
    common.Verify element is visible when ready    ${SUBMIT.CONTAINER_SUCCESS.TEXT}        timeout=15s
    common.Verify element is visible when ready    ${SUBMIT.STATUS_SUCCESS.TEXT}           timeout=10s
    common.Verify element is visible when ready    ${SUBMIT.ORDER_ID.TEXT}

Get Generated Customer Order ID
    [Documentation]    Extract and return the system generated Cust Order ID
    ${order_id}=    common.Get text when ready     ${SUBMIT.ORDER_ID.TEXT}
    RETURN          ${order_id}

Click Download PIE Report
    [Documentation]    Trigger customer application form PDF download
    common.Click element when ready                ${SUBMIT.DOWNLOAD_PIE_REPORT.BUTTON}

Click Return To Home
    [Documentation]    Return to One App main dashboard
    common.Click element when ready                ${SUBMIT.RETURN_HOME.BUTTON}
