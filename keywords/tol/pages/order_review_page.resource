*** Keywords ***
Verify Order Summary Details
    [Arguments]    ${expected_name}    ${expected_package}    ${expected_price}
    [Documentation]    Verify customer name, selected package, and monthly charge on review screen
    common.Verify element is visible when ready    ${REVIEW.CUSTOMER_NAME.TEXT}
    common.Verify text equals when ready           ${REVIEW.PACKAGE_NAME.TEXT}     ${expected_package}
    common.Verify text contains when ready         ${REVIEW.MONTHLY_FEE.TEXT}      ${expected_price}

Accept Contract Terms And Conditions
    [Documentation]    Check terms and conditions checkbox
    common.Select checkbox when ready              ${REVIEW.ACCEPT_TERMS.BUTTON}

Draw Customer Electronic Signature
    [Documentation]    Simulate signing customer contract canvas
    common.Click element when ready                ${REVIEW.SIGNATURE_CANVAS.BUTTON}

Submit Final Order Confirmation
    [Documentation]    Confirm and submit E2E registration
    common.Click element when ready                ${REVIEW.CONFIRM_ORDER.BUTTON}
