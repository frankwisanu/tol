*** Settings ***
Documentation       Locators for Customer Self-Verification QR, Biometric Liveness & Manual KYC

*** Variables ***
# Staff Screen View
${KYC.STAFF_CONTAINER}                        xpath=//div[contains(@class,'staff-kyc-container')]
${KYC.IMG_QR_CODE}                            xpath=//img[@id='qr-code-verification' or contains(@class,'kyc-qr')]
${KYC.LABEL_REF_CODE}                         xpath=//span[@id='lbl-ref-code']
${KYC.LABEL_COUNTDOWN_TIMER}                  xpath=//span[@id='lbl-qr-timer']
${KYC.BTN_GENERATE_QR}                        xpath=//button[@id='btn-generate-qr']
${KYC.BTN_BYPASS_NO_QR}                       xpath=//button[contains(text(),'สมัครบริการโดยไม่ใช้ QR Code')]
${KYC.BADGE_STAFF_STATUS}                     xpath=//div[contains(@class,'kyc-status-indicator')]

# Customer Screen View (Mobile Web View)
${KYC.CUST_CONTAINER}                         xpath=//div[contains(@class,'customer-kyc-container')]
${KYC.BTN_START_CAMERA}                       xpath=//button[@id='btn-start-camera']
${KYC.VIDEO_LIVENESS}                         xpath=//video[@id='camera-stream']
${KYC.PROMPT_LIVENESS_ACTION}                 xpath=//div[contains(@class,'liveness-instruction-prompt')]
${KYC.BADGE_FACE_MATCH_SCORE}                 xpath=//span[@id='lbl-face-match-score']

# Manual KYC & Fallback Actions
${KYC.BTN_FALLBACK_MANUAL_KYC}                xpath=//button[@id='btn-fallback-manual-kyc']
${KYC.INPUT_UPLOAD_EXTRA_PHOTO}               xpath=//input[@type='file' and @id='upload-more-photo']
${KYC.BTN_SUBMIT_KYC}                         xpath=//button[@id='btn-submit-kyc' or contains(text(),'ยืนยันตัวตน')]
