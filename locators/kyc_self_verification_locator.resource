*** Variables ***
# Staff Screen View
${KYC.STAFF_CONTAINER.TEXT}                        xpath=//div[contains(@class,'staff-kyc-container')]
${KYC.QR_CODE.TEXT}                                xpath=//img[@id='qr-code-verification' or contains(@class,'kyc-qr')]
${KYC.REF_CODE.TEXT}                               xpath=//span[@id='lbl-ref-code']
${KYC.COUNTDOWN_TIMER.TEXT}                         xpath=//span[@id='lbl-qr-timer']
${KYC.GENERATE_QR.BUTTON}                           xpath=//button[@id='btn-generate-qr']
${KYC.BYPASS_NO_QR.BUTTON}                          xpath=//button[contains(text(),'สมัครบริการโดยไม่ใช้ QR Code')]
${KYC.STAFF_STATUS.TEXT}                            xpath=//div[contains(@class,'kyc-status-indicator')]

# Customer Screen View (Mobile Web View)
${KYC.CUST_CONTAINER.TEXT}                          xpath=//div[contains(@class,'customer-kyc-container')]
${KYC.START_CAMERA.BUTTON}                          xpath=//button[@id='btn-start-camera']
${KYC.VIDEO_LIVENESS.TEXT}                          xpath=//video[@id='camera-stream']
${KYC.PROMPT_LIVENESS_ACTION.TEXT}                  xpath=//div[contains(@class,'liveness-instruction-prompt')]
${KYC.FACE_MATCH_SCORE.TEXT}                        xpath=//span[@id='lbl-face-match-score']

# Manual KYC & Fallback Actions
${KYC.FALLBACK_MANUAL_KYC.BUTTON}                   xpath=//button[@id='btn-fallback-manual-kyc']
${KYC.UPLOAD_EXTRA_PHOTO.BUTTON}                    xpath=//input[@type='file' and @id='upload-more-photo']
${KYC.SUBMIT_KYC.BUTTON}                            xpath=//button[@id='btn-submit-kyc' or contains(text(),'ยืนยันตัวตน')]
