*** Settings ***
Documentation       Locators for Customer ID Verification, Document Selection & TMH Validation

*** Variables ***
# Screen Headers
${CUST_ID.LABEL_SCREEN_TITLE}                 xpath=//h1[contains(text(),'ตรวจสอบข้อมูลลูกค้า') or contains(text(),'Customer ID Verification')]

# Document Type Tabs / Radio Options
${CUST_ID.TAB_THAI_ID}                        xpath=//div[@role='tab' and contains(text(),'บัตรประชาชน')]
${CUST_ID.TAB_PASSPORT}                       xpath=//div[@role='tab' and contains(text(),'หนังสือเดินทาง')]
${CUST_ID.TAB_ALIEN_CARD}                     xpath=//div[@role='tab' and contains(text(),'บัตรต่างด้าว')]
${CUST_ID.TAB_WORK_PERMIT_BOOK}               xpath=//div[@role='tab' and contains(text(),'ใบอนุญาตทำงานแบบเล่ม')]
${CUST_ID.TAB_WORK_PERMIT_CARD}               xpath=//div[@role='tab' and contains(text(),'บัตรอนุญาตทำงาน')]
${CUST_ID.TAB_DRIVING_LICENSE}                xpath=//div[@role='tab' and contains(text(),'ใบขับขี่')]

# Input Fields
${CUST_ID.INPUT_CARD_NUMBER}                  xpath=//input[@id='input-card-number' or @name='idNumber']
${CUST_ID.INPUT_FIRST_NAME}                   xpath=//input[@id='input-first-name' or @name='firstName']
${CUST_ID.INPUT_LAST_NAME}                    xpath=//input[@id='input-last-name' or @name='lastName']
${CUST_ID.INPUT_BIRTH_DATE}                   xpath=//input[@id='input-birth-date' or @name='birthDate']
${CUST_ID.INPUT_EXPIRY_DATE}                  xpath=//input[@id='input-expiry-date' or @name='expiryDate']
${CUST_ID.INPUT_CONTACT_TEL}                  xpath=//input[@id='input-contact-tel' or @name='contactTel']

# Verification Triggers
${CUST_ID.BTN_SCAN_OCR}                       xpath=//button[@id='btn-scan-ocr' or contains(text(),'สแกนบัตร')]
${CUST_ID.BTN_VALIDATE_TOL}                   xpath=//button[@id='btn-validate-tol' or contains(text(),'ตรวจสอบสิทธิ์')]

# Error & Status Messages
${CUST_ID.BANNER_ERROR}                       xpath=//div[contains(@class,'alert-danger') or contains(@class,'error-banner')]
${CUST_ID.LABEL_BLACK_LIST_ERROR}             xpath=//span[contains(text(),'ไม่ผ่านการตรวจสอบ Fraud TMV')]
${CUST_ID.LABEL_DUPLICATE_ERROR}              xpath=//span[contains(text(),'มีประวัติการสมัครซ้ำ')]

# Navigation
${CUST_ID.BTN_NEXT}                           xpath=//button[@id='btn-cust-next' or contains(text(),'ถัดไป')]
