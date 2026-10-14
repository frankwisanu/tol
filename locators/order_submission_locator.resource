*** Settings ***
Documentation       Locators for Order Submission Status, PIE Report and Transaction History

*** Variables ***
# Submission Progress & Spinner
${SUBMIT.SPINNER_LOADING}                     xpath=//div[contains(@class,'spinner-submitting')]

# Success Screen Elements
${SUBMIT.CONTAINER_SUCCESS}                   xpath=//div[contains(@class,'order-success-screen')]
${SUBMIT.LABEL_ORDER_ID}                      xpath=//span[@id='lbl-submitted-order-id']
${SUBMIT.LABEL_TRANSACTION_ID}                xpath=//span[@id='lbl-transaction-id']
${SUBMIT.LABEL_SUBMIT_TIMESTAMP}              xpath=//span[@id='lbl-submit-timestamp']
${SUBMIT.BADGE_STATUS_SUCCESS}                xpath=//div[contains(text(),'ส่งคำขอสำเร็จ') or contains(@class,'badge-success')]

# Action Buttons
${SUBMIT.BTN_VIEW_TRANSACTION_HISTORY}        xpath=//button[@id='btn-view-history' or contains(text(),'ดูประวัติการทำรายการ')]
${SUBMIT.BTN_DOWNLOAD_PIE_REPORT}             xpath=//button[@id='btn-download-pie' or contains(text(),'ดาวน์โหลดใบคำขอ')]
${SUBMIT.BTN_RETURN_HOME}                     xpath=//button[@id='btn-return-home' or contains(text(),'กลับสู่หน้าหลัก')]
