*** Settings ***
Documentation       Page Object keywords for Order Review, Terms Acceptance & Signature
Resource            ${CURDIR}/../../../locators/order_review_locator.resource
Resource            ${CURDIR}/../../../common/common.resource

*** Keywords ***
Verify Order Summary Details
    [Arguments]    ${expected_name}    ${expected_package}    ${expected_price}
    [Documentation]    Verify customer name, selected package, and monthly charge on review screen
    common.Verify element is visible when ready    ${REVIEW.LABEL_CUSTOMER_NAME}
    common.Verify text equals when ready           ${REVIEW.LABEL_PACKAGE_NAME}     ${expected_package}
    common.Verify text contains when ready         ${REVIEW.LABEL_MONTHLY_FEE}      ${expected_price}

Accept Contract Terms And Conditions
    [Documentation]    Check terms and conditions checkbox
    common.Select checkbox when ready              ${REVIEW.CHK_ACCEPT_TERMS}

Draw Customer Electronic Signature
    [Documentation]    Simulate signing customer contract canvas
    common.Click element when ready                ${REVIEW.PAD_SIGNATURE_CANVAS}

Submit Final Order Confirmation
    [Documentation]    Confirm and submit E2E registration
    common.Click element when ready                ${REVIEW.BTN_CONFIRM_ORDER}
