*** Settings ***
Documentation       Locators for Order Review, Contract Confirmation, and Terms Acceptance

*** Variables ***
# Review Summary Sections
${REVIEW.LABEL_CUSTOMER_NAME}                 xpath=//span[@id='summary-customer-name']
${REVIEW.LABEL_CARD_ID}                       xpath=//span[@id='summary-card-id']
${REVIEW.LABEL_INSTALL_ADDRESS}               xpath=//span[@id='summary-install-address']
${REVIEW.LABEL_PACKAGE_NAME}                  xpath=//span[@id='summary-package-name']
${REVIEW.LABEL_MONTHLY_FEE}                   xpath=//span[@id='summary-monthly-fee']
${REVIEW.LABEL_ENTRY_FEE}                     xpath=//span[@id='summary-entry-fee']
${REVIEW.LABEL_APPOINTMENT_SCHEDULE}          xpath=//span[@id='summary-appointment-time']

# Contract Terms & Signatures
${REVIEW.CHK_ACCEPT_TERMS}                    xpath=//input[@id='chk-terms-conditions']
${REVIEW.PAD_SIGNATURE_CANVAS}                xpath=//canvas[@id='customer-signature-canvas']
${REVIEW.BTN_CLEAR_SIGNATURE}                 xpath=//button[@id='btn-clear-sig']

# Navigation
${REVIEW.BTN_CONFIRM_ORDER}                   xpath=//button[@id='btn-confirm-order' or contains(text(),'ยืนยันการสมัคร')]
${REVIEW.BTN_BACK}                            xpath=//button[@id='btn-review-back' or contains(@class,'btn-back')]
