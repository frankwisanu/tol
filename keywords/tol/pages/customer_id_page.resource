*** Settings ***
Documentation       Page Object keywords for Customer ID Verification & TOL Validation
Resource            ${CURDIR}/../../../locators/customer_id_locator.resource
Resource            ${CURDIR}/../../../common/common.resource

*** Keywords ***
Select Identity Document Tab
    [Arguments]    ${doc_type}
    [Documentation]    Select ID card type (THAI_ID, PASSPORT, ALIEN, WORK_PERMIT_BOOK, WORK_PERMIT_CARD, DRIVING_LICENSE)
    IF    '${doc_type}' == 'THAI_ID'
        common.Click element when ready    ${CUST_ID.TAB_THAI_ID}
    ELSE IF    '${doc_type}' == 'PASSPORT'
        common.Click element when ready    ${CUST_ID.TAB_PASSPORT}
    ELSE IF    '${doc_type}' == 'ALIEN'
        common.Click element when ready    ${CUST_ID.TAB_ALIEN_CARD}
    ELSE IF    '${doc_type}' == 'WORK_PERMIT_BOOK'
        common.Click element when ready    ${CUST_ID.TAB_WORK_PERMIT_BOOK}
    ELSE IF    '${doc_type}' == 'WORK_PERMIT_CARD'
        common.Click element when ready    ${CUST_ID.TAB_WORK_PERMIT_CARD}
    ELSE IF    '${doc_type}' == 'DRIVING_LICENSE'
        common.Click element when ready    ${CUST_ID.TAB_DRIVING_LICENSE}
    END

Input Customer Identification Details
    [Arguments]    ${id_number}    ${first_name}    ${last_name}    ${birth_date}    ${expiry_date}
    [Documentation]    Input customer identification fields
    common.Input text when ready    ${CUST_ID.INPUT_CARD_NUMBER}    ${id_number}
    common.Input text when ready    ${CUST_ID.INPUT_FIRST_NAME}     ${first_name}
    common.Input text when ready    ${CUST_ID.INPUT_LAST_NAME}      ${last_name}
    common.Input text when ready    ${CUST_ID.INPUT_BIRTH_DATE}     ${birth_date}
    common.Input text when ready    ${CUST_ID.INPUT_EXPIRY_DATE}    ${expiry_date}

Click Validate Customer Eligibility
    [Documentation]    Trigger TOL customer validation & Fraud check
    common.Click element when ready    ${CUST_ID.BTN_VALIDATE_TOL}

Verify Eligibility Passed
    [Documentation]    Ensure no error banner is displayed and Next button is active
    common.Verify element is not visible when ready    ${CUST_ID.BANNER_ERROR}
    common.Verify element is enabled when ready        ${CUST_ID.BTN_NEXT}

Click Next To KYC Step
    [Documentation]    Proceed to Customer Self-Verification QR
    common.Click element when ready    ${CUST_ID.BTN_NEXT}
