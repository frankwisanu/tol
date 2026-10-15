*** Keywords ***
Input Contact Mobile Numbers
    [Arguments]    ${primary_mobile}    ${backup_mobile}
    [Documentation]    Provide primary and mandatory secondary contact telephone
    common.Input text when ready    ${CUST_INFO.PRIMARY_MOBILE.TEXTBOX}    ${primary_mobile}
    common.Input text when ready    ${CUST_INFO.BACKUP_MOBILE.TEXTBOX}     ${backup_mobile}

Configure Billing Method
    [Arguments]    ${delivery_format}    ${bill_language}    ${email}=${EMPTY}
    [Documentation]    Set bill delivery to SMS or EMAIL with language TH/EN
    IF    '${delivery_format}' == 'SMS'
        common.Click element when ready    ${CUST_INFO.BILL_FORMAT_SMS.BUTTON}
    ELSE IF    '${delivery_format}' == 'EMAIL'
        common.Click element when ready    ${CUST_INFO.BILL_FORMAT_EMAIL.BUTTON}
        common.Input text when ready       ${CUST_INFO.EMAIL.TEXTBOX}    ${email}
    END

    IF    '${bill_language}' == 'TH'
        common.Click element when ready    ${CUST_INFO.BILL_LANG_TH.BUTTON}
    ELSE
        common.Click element when ready    ${CUST_INFO.BILL_LANG_EN.BUTTON}
    END

Set Billing Address Same As Installation
    [Documentation]    Checkbox to copy installation address into billing address
    common.Select checkbox when ready     ${CUST_INFO.SAME_AS_INSTALL_ADDRESS.BUTTON}

Select Custom Billing Address
    [Arguments]    ${street}    ${province}    ${district}    ${subdistrict}    ${postcode}=${EMPTY}
    [Documentation]    Select alternative billing address when different from installation
    common.Input text when ready              ${CUST_INFO.BILLING_STREET.TEXTBOX}    ${street}
    common.Select dropdown by label when ready    ${CUST_INFO.BILLING_PROVINCE.BUTTON}   ${province}
    common.Select dropdown by label when ready    ${CUST_INFO.BILLING_DISTRICT.BUTTON}   ${district}
    common.Select dropdown by label when ready    ${CUST_INFO.BILLING_SUBDISTRICT.BUTTON}    ${subdistrict}
    IF    '${postcode}' != '${EMPTY}'
        common.Select dropdown by value when ready    ${CUST_INFO.BILLING_POSTCODE.BUTTON}   ${postcode}
    END

Click Next Button On Customer Info
    [Documentation]    Proceed to Installation and Appointment scheduling
    common.Click element when ready       ${CUST_INFO.NEXT.BUTTON}
