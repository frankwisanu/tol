*** Settings ***
Documentation       Page Object keywords for Customer Details & Billing Preferences
Resource            ${CURDIR}/../../../locators/customer_info_locator.resource
Resource            ${CURDIR}/../../../common/common.resource

*** Keywords ***
Input Contact Mobile Numbers
    [Arguments]    ${primary_mobile}    ${backup_mobile}
    [Documentation]    Provide primary and mandatory secondary contact telephone
    common.Input text when ready    ${CUST_INFO.INPUT_PRIMARY_MOBILE}    ${primary_mobile}
    common.Input text when ready    ${CUST_INFO.INPUT_BACKUP_MOBILE}     ${backup_mobile}

Configure Billing Method
    [Arguments]    ${delivery_format}    ${bill_language}    ${email}=${EMPTY}
    [Documentation]    Set bill delivery to SMS or EMAIL with language TH/EN
    IF    '${delivery_format}' == 'SMS'
        common.Click element when ready    ${CUST_INFO.RADIO_BILL_FORMAT_SMS}
    ELSE IF    '${delivery_format}' == 'EMAIL'
        common.Click element when ready    ${CUST_INFO.RADIO_BILL_FORMAT_EMAIL}
        common.Input text when ready       ${CUST_INFO.INPUT_EMAIL}    ${email}
    END

    IF    '${bill_language}' == 'TH'
        common.Click element when ready    ${CUST_INFO.RADIO_BILL_LANG_TH}
    ELSE
        common.Click element when ready    ${CUST_INFO.RADIO_BILL_LANG_EN}
    END

Set Billing Address Same As Installation
    [Documentation]    Checkbox to copy installation address into billing address
    common.Select checkbox when ready     ${CUST_INFO.CHK_SAME_AS_INSTALL_ADDRESS}

Click Next Button On Customer Info
    [Documentation]    Proceed to Installation and Appointment scheduling
    common.Click element when ready       ${CUST_INFO.BTN_NEXT}
