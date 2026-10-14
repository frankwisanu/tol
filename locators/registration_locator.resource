*** Settings ***
Documentation       Locators for True Online (TOL) Registration Hub and Onboarding Lifecycle in One App

*** Variables ***
# Navigation & Registration Hub
${REGISTRATION.MENU_ENTRY}                       xpath=//div[@id='menu-tol-registration' or contains(text(),'ลงทะเบียนทรูออนไลน์')]
${REGISTRATION.LBL_HEADER}                       xpath=//h1[contains(text(),'ลงทะเบียนทรูออนไลน์') or contains(text(),'TrueOnline Registration')]
${REGISTRATION.BTN_START_REGISTRATION}           xpath=//button[@id='btn-start-registration' or contains(text(),'เริ่มลงทะเบียนใหม่')]
${REGISTRATION.BTN_RESUME_REGISTRATION}          xpath=//button[@id='btn-resume-registration' or contains(text(),'ทำรายการต่อ')]
${REGISTRATION.BTN_CHECK_STATUS}                 xpath=//button[@id='btn-check-status' or contains(text(),'ตรวจสอบสถานะการสมัคร')]

# Sales Partner & Dealer Credentials
${REGISTRATION.INPUT_SALE_AGENT_ID}              xpath=//input[@id='input-sale-agent-id' or @name='saleAgentId']
${REGISTRATION.INPUT_RTR_CODE}                   xpath=//input[@id='input-rtr-code' or @name='rtrCode']
${REGISTRATION.INPUT_DTR_CODE}                   xpath=//input[@id='input-dtr-code' or @name='dtrCode']
${REGISTRATION.SELECT_SALES_CHANNEL}             xpath=//select[@id='sel-sales-channel' or @name='salesChannel']

# Registration Type Radios
${REGISTRATION.RADIO_NEW_CUSTOMER}               xpath=//input[@name='registrationType' and @value='NEW_CUSTOMER']
${REGISTRATION.RADIO_EXISTING_ADDON}             xpath=//input[@name='registrationType' and @value='EXISTING_ADDON']
${REGISTRATION.RADIO_MIGRATION_CVG}              xpath=//input[@name='registrationType' and @value='MIGRATION_CVG']

# PDPA Consent & Terms
${REGISTRATION.CHK_PDPA_CONSENT}                 xpath=//input[@id='chk-pdpa-consent']
${REGISTRATION.CHK_REGISTRATION_TERMS}           xpath=//input[@id='chk-registration-terms']
${REGISTRATION.BTN_ACCEPT_AND_PROCEED}           xpath=//button[@id='btn-accept-proceed' or contains(text(),'ยอมรับและดำเนินการต่อ')]

# Workflow Stepper Items
${REGISTRATION.STEP_COVERAGE}                    xpath=//div[contains(@class,'stepper-item') and contains(@class,'step-coverage')]
${REGISTRATION.STEP_SERVICE}                     xpath=//div[contains(@class,'stepper-item') and contains(@class,'step-service')]
${REGISTRATION.STEP_KYC}                         xpath=//div[contains(@class,'stepper-item') and contains(@class,'step-kyc')]
${REGISTRATION.STEP_PACKAGE}                     xpath=//div[contains(@class,'stepper-item') and contains(@class,'step-package')]
${REGISTRATION.STEP_APPOINTMENT}                 xpath=//div[contains(@class,'stepper-item') and contains(@class,'step-appointment')]
${REGISTRATION.STEP_REVIEW}                      xpath=//div[contains(@class,'stepper-item') and contains(@class,'step-review')]
