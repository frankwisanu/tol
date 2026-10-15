*** Variables ***
# Navigation & Registration Hub
${REGISTRATION.MENU_ENTRY.BUTTON}                       xpath=//div[@id='menu-tol-registration' or contains(text(),'ลงทะเบียนทรูออนไลน์')]
${REGISTRATION.HEADER.TEXT}                             xpath=//h1[contains(text(),'ลงทะเบียนทรูออนไลน์') or contains(text(),'TrueOnline Registration')]
${REGISTRATION.START_REGISTRATION.BUTTON}               xpath=//button[@id='btn-start-registration' or contains(text(),'เริ่มลงทะเบียนใหม่')]
${REGISTRATION.RESUME_REGISTRATION.BUTTON}              xpath=//button[@id='btn-resume-registration' or contains(text(),'ทำรายการต่อ')]
${REGISTRATION.CHECK_STATUS.BUTTON}                     xpath=//button[@id='btn-check-status' or contains(text(),'ตรวจสอบสถานะการสมัคร')]

# Sales Partner & Dealer Credentials
${REGISTRATION.SALE_AGENT_ID.TEXTBOX}                   xpath=//input[@id='input-sale-agent-id' or @name='saleAgentId']
${REGISTRATION.RTR_CODE.TEXTBOX}                        xpath=//input[@id='input-rtr-code' or @name='rtrCode']
${REGISTRATION.DTR_CODE.TEXTBOX}                        xpath=//input[@id='input-dtr-code' or @name='dtrCode']
${REGISTRATION.SALES_CHANNEL.BUTTON}                    xpath=//select[@id='sel-sales-channel' or @name='salesChannel']

# Registration Type Radios
${REGISTRATION.NEW_CUSTOMER.BUTTON}                     xpath=//input[@name='registrationType' and @value='NEW_CUSTOMER']
${REGISTRATION.EXISTING_ADDON.BUTTON}                   xpath=//input[@name='registrationType' and @value='EXISTING_ADDON']
${REGISTRATION.MIGRATION_CVG.BUTTON}                    xpath=//input[@name='registrationType' and @value='MIGRATION_CVG']

# PDPA Consent & Terms
${REGISTRATION.PDPA_CONSENT.BUTTON}                     xpath=//input[@id='chk-pdpa-consent']
${REGISTRATION.REGISTRATION_TERMS.BUTTON}               xpath=//input[@id='chk-registration-terms']
${REGISTRATION.ACCEPT_AND_PROCEED.BUTTON}               xpath=//button[@id='btn-accept-proceed' or contains(text(),'ยอมรับและดำเนินการต่อ')]

# Workflow Stepper Items
${REGISTRATION.STEP_COVERAGE.TEXT}                      xpath=//div[contains(@class,'stepper-item') and contains(@class,'step-coverage')]
${REGISTRATION.STEP_SERVICE.TEXT}                       xpath=//div[contains(@class,'stepper-item') and contains(@class,'step-service')]
${REGISTRATION.STEP_KYC.TEXT}                           xpath=//div[contains(@class,'stepper-item') and contains(@class,'step-kyc')]
${REGISTRATION.STEP_PACKAGE.TEXT}                       xpath=//div[contains(@class,'stepper-item') and contains(@class,'step-package')]
${REGISTRATION.STEP_APPOINTMENT.TEXT}                   xpath=//div[contains(@class,'stepper-item') and contains(@class,'step-appointment')]
${REGISTRATION.STEP_REVIEW.TEXT}                        xpath=//div[contains(@class,'stepper-item') and contains(@class,'step-review')]
