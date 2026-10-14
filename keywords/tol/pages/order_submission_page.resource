*** Settings ***
Documentation       Page Object keywords for Order Submission Outcome & Audit
Resource            ${CURDIR}/../../../locators/order_submission_locator.resource
Resource            ${CURDIR}/../../../common/common.resource

*** Keywords ***
Wait For Order Submission Processing
    [Documentation]    Wait for background tolSubmit orchestration to complete
    common.Verify element is visible when ready        ${SUBMIT.SPINNER_LOADING}       timeout=5s
    common.Verify element is not visible when ready    ${SUBMIT.SPINNER_LOADING}       timeout=30s

Verify Order Submission Success
    [Documentation]    Ensure success screen is displayed with valid generated Order ID
    common.Verify element is visible when ready    ${SUBMIT.CONTAINER_SUCCESS}        timeout=15s
    common.Verify element is visible when ready    ${SUBMIT.BADGE_STATUS_SUCCESS}     timeout=10s
    common.Verify element is visible when ready    ${SUBMIT.LABEL_ORDER_ID}

Get Generated Customer Order ID
    [Documentation]    Extract and return the system generated Cust Order ID
    ${order_id}=    common.Get text when ready     ${SUBMIT.LABEL_ORDER_ID}
    RETURN          ${order_id}

Click Download PIE Report
    [Documentation]    Trigger customer application form PDF download
    common.Click element when ready                ${SUBMIT.BTN_DOWNLOAD_PIE_REPORT}

Click Return To Home
    [Documentation]    Return to One App main dashboard
    common.Click element when ready                ${SUBMIT.BTN_RETURN_HOME}
