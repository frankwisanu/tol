*** Settings ***
Documentation       Page Object keywords for Privilege Selection (FMC, Employee, Coupons)
Resource            ${CURDIR}/../../../locators/privilege_locator.resource
Resource            ${CURDIR}/../../../common/common.resource

*** Keywords ***
Select Privilege Category
    [Arguments]    ${category}
    [Documentation]    Select privilege type (GENERAL, CP_EMPLOYEE, TRUE_EMPLOYEE, FMC, NONE)
    IF    '${category}' == 'GENERAL'
        common.Click element when ready    ${PRIV.RADIO_GENERAL_PUBLIC}
    ELSE IF    '${category}' == 'CP_EMPLOYEE'
        common.Click element when ready    ${PRIV.RADIO_CP_EMPLOYEE}
    ELSE IF    '${category}' == 'TRUE_EMPLOYEE'
        common.Click element when ready    ${PRIV.RADIO_TRUE_EMPLOYEE}
    ELSE IF    '${category}' == 'FMC'
        common.Click element when ready    ${PRIV.RADIO_FMC_BENEFIT}
    ELSE
        common.Click element when ready    ${PRIV.RADIO_NO_PRIVILEGE}
    END

Apply TrueMove H FMC Benefit
    [Arguments]    ${mobile_number}
    [Documentation]    Select active True/Dtac number to receive FMC discount
    common.Click element when ready                 ${PRIV.RADIO_FMC_BENEFIT}
    common.Select dropdown by value when ready     ${PRIV.SELECT_ELIGIBLE_NUMBER}    ${mobile_number}
    common.Verify element is visible when ready    ${PRIV.LABEL_DISCOUNT_PERCENT}

Apply Employee Or Friends Promo Code
    [Arguments]    ${promo_code}
    [Documentation]    Input CP Employee ID or Friends & Family voucher token
    common.Input text when ready       ${PRIV.INPUT_COUPON_CODE}    ${promo_code}
    common.Click element when ready    ${PRIV.BTN_VERIFY_CODE}

Click Next Button On Privilege Page
    [Documentation]    Advance to Package Catalog
    common.Click element when ready    ${PRIV.BTN_NEXT}
