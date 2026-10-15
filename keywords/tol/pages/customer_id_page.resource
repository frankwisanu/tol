*** Keywords ***
Select Identity Document Tab
    [Arguments]    ${doc_type}
    [Documentation]    Select ID card type (THAI_ID, PASSPORT, ALIEN, WORK_PERMIT_BOOK, WORK_PERMIT_CARD, DRIVING_LICENSE)
    IF    '${doc_type}' == 'THAI_ID'
        common.Click element when ready    ${CUST_ID.THAI_ID.BUTTON}
    ELSE IF    '${doc_type}' == 'PASSPORT'
        common.Click element when ready    ${CUST_ID.PASSPORT.BUTTON}
    ELSE IF    '${doc_type}' == 'ALIEN'
        common.Click element when ready    ${CUST_ID.ALIEN_CARD.BUTTON}
    ELSE IF    '${doc_type}' == 'WORK_PERMIT_BOOK'
        common.Click element when ready    ${CUST_ID.WORK_PERMIT_BOOK.BUTTON}
    ELSE IF    '${doc_type}' == 'WORK_PERMIT_CARD'
        common.Click element when ready    ${CUST_ID.WORK_PERMIT_CARD.BUTTON}
    ELSE IF    '${doc_type}' == 'DRIVING_LICENSE'
        common.Click element when ready    ${CUST_ID.DRIVING_LICENSE.BUTTON}
    END

Input Customer Identification Details
    [Arguments]    ${id_number}    ${first_name}    ${last_name}    ${birth_date}    ${expiry_date}
    [Documentation]    Input customer identification fields
    common.Input text when ready    ${CUST_ID.CARD_NUMBER.TEXTBOX}    ${id_number}
    common.Input text when ready    ${CUST_ID.FIRST_NAME.TEXTBOX}     ${first_name}
    common.Input text when ready    ${CUST_ID.LAST_NAME.TEXTBOX}      ${last_name}
    common.Input text when ready    ${CUST_ID.BIRTH_DATE.TEXTBOX}     ${birth_date}
    common.Input text when ready    ${CUST_ID.EXPIRY_DATE.TEXTBOX}    ${expiry_date}

Click Validate Customer Eligibility
    [Documentation]    Trigger TOL customer validation & Fraud check
    common.Click element when ready    ${CUST_ID.VALIDATE_TOL.BUTTON}

Verify Eligibility Passed
    [Documentation]    Ensure no error banner is displayed and Next button is active
    common.Verify element is not visible when ready    ${CUST_ID.BANNER_ERROR.TEXT}
    common.Verify element is enabled when ready        ${CUST_ID.NEXT.BUTTON}

Click Next To KYC Step
    [Documentation]    Proceed to Customer Self-Verification QR
    common.Click element when ready    ${CUST_ID.NEXT.BUTTON}
