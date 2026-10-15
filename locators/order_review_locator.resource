*** Variables ***
# Review Summary Sections
${REVIEW.CUSTOMER_NAME.TEXT}                   xpath=//span[@id='summary-customer-name']
${REVIEW.CARD_ID.TEXT}                         xpath=//span[@id='summary-card-id']
${REVIEW.INSTALL_ADDRESS.TEXT}                 xpath=//span[@id='summary-install-address']
${REVIEW.PACKAGE_NAME.TEXT}                    xpath=//span[@id='summary-package-name']
${REVIEW.MONTHLY_FEE.TEXT}                     xpath=//span[@id='summary-monthly-fee']
${REVIEW.ENTRY_FEE.TEXT}                       xpath=//span[@id='summary-entry-fee']
${REVIEW.APPOINTMENT_SCHEDULE.TEXT}            xpath=//span[@id='summary-appointment-time']

# Contract Terms & Signatures
${REVIEW.ACCEPT_TERMS.BUTTON}                  xpath=//input[@id='chk-terms-conditions']
${REVIEW.SIGNATURE_CANVAS.BUTTON}              xpath=//canvas[@id='customer-signature-canvas']
${REVIEW.CLEAR_SIGNATURE.BUTTON}               xpath=//button[@id='btn-clear-sig']

# Navigation
${REVIEW.CONFIRM_ORDER.BUTTON}                 xpath=//button[@id='btn-confirm-order' or contains(text(),'ยืนยันการสมัคร')]
${REVIEW.BACK.BUTTON}                          xpath=//button[@id='btn-review-back' or contains(@class,'btn-back')]
