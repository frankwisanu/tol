*** Variables ***
# Submission Progress & Spinner
${SUBMIT.SPINNER_LOADING.TEXT}                 xpath=//div[contains(@class,'spinner-submitting')]

# Success Screen Elements
${SUBMIT.CONTAINER_SUCCESS.TEXT}               xpath=//div[contains(@class,'order-success-screen')]
${SUBMIT.ORDER_ID.TEXT}                        xpath=//span[@id='lbl-submitted-order-id']
${SUBMIT.TRANSACTION_ID.TEXT}                  xpath=//span[@id='lbl-transaction-id']
${SUBMIT.SUBMIT_TIMESTAMP.TEXT}                xpath=//span[@id='lbl-submit-timestamp']
${SUBMIT.STATUS_SUCCESS.TEXT}                  xpath=//div[contains(text(),'ส่งคำขอสำเร็จ') or contains(@class,'badge-success')]

# Action Buttons
${SUBMIT.VIEW_TRANSACTION_HISTORY.BUTTON}      xpath=//button[@id='btn-view-history' or contains(text(),'ดูประวัติการทำรายการ')]
${SUBMIT.DOWNLOAD_PIE_REPORT.BUTTON}           xpath=//button[@id='btn-download-pie' or contains(text(),'ดาวน์โหลดใบคำขอ')]
${SUBMIT.RETURN_HOME.BUTTON}                   xpath=//button[@id='btn-return-home' or contains(text(),'กลับสู่หน้าหลัก')]
