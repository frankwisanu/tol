*** Keywords ***
Generate Staff Verification QR Code
    [Documentation]    Generate encrypted QR code for customer on Staff Screen
    common.Click element when ready               ${KYC.GENERATE_QR.BUTTON}
    common.Verify element is visible when ready   ${KYC.QR_CODE.TEXT}
    common.Verify element is visible when ready   ${KYC.REF_CODE.TEXT}

Simulate Customer Mobile Scan And Liveness Verification
    [Arguments]    ${mock_match_score}=95
    [Documentation]    Simulate successful mobile KYC liveness flow and face compare
    common.Verify element is visible when ready   ${KYC.STAFF_STATUS.TEXT}

Bypass QR Self Verification
    [Documentation]    Proceed without QR code (Direct assisted registration)
    common.Click element when ready               ${KYC.BYPASS_NO_QR.BUTTON}

Upload Supplementary Document Photos
    [Arguments]    ${file_path}
    [Documentation]    Upload supplemental document in More Photo module
    common.Upload file when ready                 ${KYC.UPLOAD_EXTRA_PHOTO.BUTTON}    ${file_path}

Complete KYC And Proceed
    [Documentation]    Confirm KYC and advance to Privilege selection
    common.Click element when ready               ${KYC.SUBMIT_KYC.BUTTON}
