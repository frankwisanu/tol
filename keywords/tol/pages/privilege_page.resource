*** Keywords ***
Select Privilege Category
    [Arguments]    ${category}
    [Documentation]    Select privilege type (GENERAL, CP_EMPLOYEE, TRUE_EMPLOYEE, FMC, NONE)
    IF    '${category}' == 'GENERAL'
        common.Click element when ready    ${PRIV.GENERAL_PUBLIC.BUTTON}
    ELSE IF    '${category}' == 'CP_EMPLOYEE'
        common.Click element when ready    ${PRIV.CP_EMPLOYEE.BUTTON}
    ELSE IF    '${category}' == 'TRUE_EMPLOYEE'
        common.Click element when ready    ${PRIV.TRUE_EMPLOYEE.BUTTON}
    ELSE IF    '${category}' == 'FMC'
        common.Click element when ready    ${PRIV.FMC_BENEFIT.BUTTON}
    ELSE
        common.Click element when ready    ${PRIV.NO_PRIVILEGE.BUTTON}
    END

Apply TrueMove H FMC Benefit
    [Arguments]    ${mobile_number}
    [Documentation]    Select active True/Dtac number to receive FMC discount
    common.Click element when ready                 ${PRIV.FMC_BENEFIT.BUTTON}
    common.Select dropdown by value when ready     ${PRIV.ELIGIBLE_NUMBER.BUTTON}    ${mobile_number}
    common.Verify element is visible when ready    ${PRIV.DISCOUNT_PERCENT.TEXT}

Apply Employee Or Friends Promo Code
    [Arguments]    ${promo_code}
    [Documentation]    Input CP Employee ID or Friends & Family voucher token
    common.Input text when ready       ${PRIV.COUPON_CODE.TEXTBOX}    ${promo_code}
    common.Click element when ready    ${PRIV.VERIFY_CODE.BUTTON}

Click Next Button On Privilege Page
    [Documentation]    Advance to Package Catalog
    common.Click element when ready    ${PRIV.NEXT.BUTTON}
