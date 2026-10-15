*** Variables ***
# Contact Mobile & Email
${CUST_INFO.PRIMARY_MOBILE.TEXTBOX}             xpath=//input[@id='input-primary-mobile' or @name='mobileNo']
${CUST_INFO.BACKUP_MOBILE.TEXTBOX}              xpath=//input[@id='input-backup-mobile' or @name='secondaryMobile']
${CUST_INFO.EMAIL.TEXTBOX}                      xpath=//input[@id='input-email' or @name='email']

# Billing Format Options
${CUST_INFO.BILL_FORMAT_SMS.BUTTON}             xpath=//input[@name='billDelivery' and @value='SMS']
${CUST_INFO.BILL_FORMAT_EMAIL.BUTTON}           xpath=//input[@name='billDelivery' and @value='EMAIL']
${CUST_INFO.BILL_LANG_TH.BUTTON}                xpath=//input[@name='billLang' and @value='TH']
${CUST_INFO.BILL_LANG_EN.BUTTON}                xpath=//input[@name='billLang' and @value='EN']

# Address Sections
${CUST_INFO.SAME_AS_INSTALL_ADDRESS.BUTTON}     xpath=//input[@id='chk-same-as-install-address']
${CUST_INFO.BILLING_STREET.TEXTBOX}             xpath=//input[@id='input-billing-street']
${CUST_INFO.BILLING_PROVINCE.BUTTON}            xpath=//select[@id='sel-billing-province']
${CUST_INFO.BILLING_DISTRICT.BUTTON}            xpath=//select[@id='sel-billing-district']
${CUST_INFO.BILLING_SUBDISTRICT.BUTTON}         xpath=//select[@id='sel-billing-subdistrict']
${CUST_INFO.BILLING_POSTCODE.BUTTON}            xpath=//select[@id='sel-billing-postcode']

# Navigation
${CUST_INFO.NEXT.BUTTON}                         xpath=//button[@id='btn-cust-info-next' or contains(text(),'ถัดไป')]
${CUST_INFO.BACK.BUTTON}                         xpath=//button[@id='btn-cust-info-back' or contains(@class,'btn-back')]
