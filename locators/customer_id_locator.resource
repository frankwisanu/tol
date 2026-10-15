*** Variables ***
# Screen Headers
${CUST_ID.SCREEN_TITLE.TEXT}                    xpath=//h1[contains(text(),'ตรวจสอบข้อมูลลูกค้า') or contains(text(),'Customer ID Verification')]

# Document Type Tabs / Radio Options
${CUST_ID.THAI_ID.BUTTON}                       xpath=//div[@role='tab' and contains(text(),'บัตรประชาชน')]
${CUST_ID.PASSPORT.BUTTON}                      xpath=//div[@role='tab' and contains(text(),'หนังสือเดินทาง')]
${CUST_ID.ALIEN_CARD.BUTTON}                    xpath=//div[@role='tab' and contains(text(),'บัตรต่างด้าว')]
${CUST_ID.WORK_PERMIT_BOOK.BUTTON}              xpath=//div[@role='tab' and contains(text(),'ใบอนุญาตทำงานแบบเล่ม')]
${CUST_ID.WORK_PERMIT_CARD.BUTTON}              xpath=//div[@role='tab' and contains(text(),'บัตรอนุญาตทำงาน')]
${CUST_ID.DRIVING_LICENSE.BUTTON}               xpath=//div[@role='tab' and contains(text(),'ใบขับขี่')]

# Input Fields
${CUST_ID.CARD_NUMBER.TEXTBOX}                  xpath=//input[@id='input-card-number' or @name='idNumber']
${CUST_ID.FIRST_NAME.TEXTBOX}                   xpath=//input[@id='input-first-name' or @name='firstName']
${CUST_ID.LAST_NAME.TEXTBOX}                    xpath=//input[@id='input-last-name' or @name='lastName']
${CUST_ID.BIRTH_DATE.TEXTBOX}                   xpath=//input[@id='input-birth-date' or @name='birthDate']
${CUST_ID.EXPIRY_DATE.TEXTBOX}                  xpath=//input[@id='input-expiry-date' or @name='expiryDate']
${CUST_ID.CONTACT_TEL.TEXTBOX}                  xpath=//input[@id='input-contact-tel' or @name='contactTel']

# Verification Triggers
${CUST_ID.SCAN_OCR.BUTTON}                      xpath=//button[@id='btn-scan-ocr' or contains(text(),'สแกนบัตร')]
${CUST_ID.VALIDATE_TOL.BUTTON}                  xpath=//button[@id='btn-validate-tol' or contains(text(),'ตรวจสอบสิทธิ์')]

# Error & Status Messages
${CUST_ID.BANNER_ERROR.TEXT}                    xpath=//div[contains(@class,'alert-danger') or contains(@class,'error-banner')]
${CUST_ID.BLACK_LIST_ERROR.TEXT}                xpath=//span[contains(text(),'ไม่ผ่านการตรวจสอบ Fraud TMV')]
${CUST_ID.DUPLICATE_ERROR.TEXT}                 xpath=//span[contains(text(),'มีประวัติการสมัครซ้ำ')]

# Navigation
${CUST_ID.NEXT.BUTTON}                          xpath=//button[@id='btn-cust-next' or contains(text(),'ถัดไป')]
