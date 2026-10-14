*** Settings ***
Documentation       Page Object keywords for Staff QR & Customer Biometric KYC
Resource            ${CURDIR}/../../../locators/kyc_self_verification_locator.resource
Resource            ${CURDIR}/../../../common/common.resource

*** Keywords ***
Generate Staff Verification QR Code
    [Documentation]    Generate encrypted QR code for customer on Staff Screen
    common.Click element when ready               ${KYC.BTN_GENERATE_QR}
    common.Verify element is visible when ready   ${KYC.IMG_QR_CODE}
    common.Verify element is visible when ready   ${KYC.LABEL_REF_CODE}

Simulate Customer Mobile Scan And Liveness Verification
    [Arguments]    ${mock_match_score}=95
    [Documentation]    Simulate successful mobile KYC liveness flow and face compare
    common.Verify element is visible when ready   ${KYC.BADGE_STAFF_STATUS}

Bypass QR Self Verification
    [Documentation]    Proceed without QR code (Direct assisted registration)
    common.Click element when ready               ${KYC.BTN_BYPASS_NO_QR}

Upload Supplementary Document Photos
    [Arguments]    ${file_path}
    [Documentation]    Upload supplemental document in More Photo module
    common.Upload file when ready                 ${KYC.INPUT_UPLOAD_EXTRA_PHOTO}    ${file_path}

Complete KYC And Proceed
    [Documentation]    Confirm KYC and advance to Privilege selection
    common.Click element when ready               ${KYC.BTN_SUBMIT_KYC}
