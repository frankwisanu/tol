*** Settings ***
Documentation       Locators for Customer Personal Info, Addresses & Contact Channels

*** Variables ***
# Contact Mobile & Email
${CUST_INFO.INPUT_PRIMARY_MOBILE}             xpath=//input[@id='input-primary-mobile' or @name='mobileNo']
${CUST_INFO.INPUT_BACKUP_MOBILE}              xpath=//input[@id='input-backup-mobile' or @name='secondaryMobile']
${CUST_INFO.INPUT_EMAIL}                      xpath=//input[@id='input-email' or @name='email']

# Billing Format Options
${CUST_INFO.RADIO_BILL_FORMAT_SMS}            xpath=//input[@name='billDelivery' and @value='SMS']
${CUST_INFO.RADIO_BILL_FORMAT_EMAIL}          xpath=//input[@name='billDelivery' and @value='EMAIL']
${CUST_INFO.RADIO_BILL_LANG_TH}               xpath=//input[@name='billLang' and @value='TH']
${CUST_INFO.RADIO_BILL_LANG_EN}               xpath=//input[@name='billLang' and @value='EN']

# Address Sections
${CUST_INFO.CHK_SAME_AS_INSTALL_ADDRESS}      xpath=//input[@id='chk-same-as-install-address']
${CUST_INFO.INPUT_BILLING_STREET}             xpath=//input[@id='input-billing-street']
${CUST_INFO.INPUT_BILLING_SUBDISTRICT}        xpath=//input[@id='input-billing-subdistrict']
${CUST_INFO.INPUT_BILLING_DISTRICT}           xpath=//input[@id='input-billing-district']
${CUST_INFO.INPUT_BILLING_PROVINCE}           xpath=//input[@id='input-billing-province']
${CUST_INFO.INPUT_BILLING_POSTCODE}           xpath=//input[@id='input-billing-postcode']

# Navigation
${CUST_INFO.BTN_NEXT}                         xpath=//button[@id='btn-cust-info-next' or contains(text(),'ถัดไป')]
${CUST_INFO.BTN_BACK}                         xpath=//button[@id='btn-cust-info-back' or contains(@class,'btn-back')]
