*** Settings ***
Documentation       Feature-level business flow for Customer Contact & Installation Scheduling
Resource            ../pages/customer_info_page.resource
Resource            ../pages/appointment_page.resource

*** Keywords ***
Configure Contact Details And Installation Schedule
    [Arguments]    ${primary_mobile}    ${backup_mobile}    ${bill_type}    ${bill_lang}    ${install_type}    ${slot_time}    ${email}=${EMPTY}
    [Documentation]    Provide customer info and book technician appointment
    customer_info_page.Input Contact Mobile Numbers         ${primary_mobile}    ${backup_mobile}
    customer_info_page.Configure Billing Method             ${bill_type}         ${bill_lang}     ${email}
    customer_info_page.Set Billing Address Same As Installation
    customer_info_page.Click Next Button On Customer Info
    appointment_page.Select Installation Type             ${install_type}
    appointment_page.Select Appointment Slot              ${slot_time}
    appointment_page.Handle Port Or Date Full Conflict
    appointment_page.Click Next Button On Appointment
