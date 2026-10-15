*** Settings ***
Documentation       TC_TOL_MOBILE_01: End-to-End TrueOnline Registration Flow on Android AVD Emulator with One App
Resource            ${CURDIR}/../imports/imports.resource
Test Teardown       common.Default mobile test teardown

*** Test Cases ***
TC_TOL_MOBILE_01: Register Standalone 1P On Android AVD Emulator
    [Documentation]    Verify complete 1P FTTH broadband registration on Android AVD with One App
    [Tags]             mobile    android    avd    p1

    # 1. Launch One App on Android AVD Emulator via Appium
    common.Open mobile application on android

    # 2. Grant permissions & Open TOL Registration from One App Native Home
    oneapp_native_page.Grant Required Permissions If Prompted
    oneapp_native_page.Open TOL Registration From One App Hub

    # 3. Switch to TOL WebView context (All standard TOL keywords & locators execute seamlessly)
    common.Switch to TOL webview context

    # 4. Check SGIS Coverage
    check_coverage_feature.Verify And Confirm Green Coverage Feasibility
    ...    search_address=${addresses['green_coverage']['query']}

    # 5. Service Selection (1P Standalone, Online Channel)
    select_bundle_package_feature.Select Standalone 1P Broadband Online Channel

    # 6. Customer Identification & Digital KYC via QR
    customer_kyc_verification_feature.Verify Identity And Complete Self KYC Via QR
    ...    doc_type=${customers['thai_citizen_eligible']['doc_type']}
    ...    id_number=${customers['thai_citizen_eligible']['id_number']}
    ...    first_name=${customers['thai_citizen_eligible']['first_name']}
    ...    last_name=${customers['thai_citizen_eligible']['last_name']}
    ...    birth_date=${customers['thai_citizen_eligible']['birth_date']}
    ...    expiry_date=${customers['thai_citizen_eligible']['expiry_date']}

    # 7. Package & Privilege Selection
    package_and_privilege_feature.Select Package With General Public Privilege
    ...    media_tech=${packages['ftth_standalone_500m']['media_tech']}
    ...    offer_code=${packages['ftth_standalone_500m']['offer_code']}
    ...    waive_entry_fee=True

    # 8. Contact & Installation Appointment Scheduling
    installation_appointment_feature.Configure Contact Details And Installation Schedule
    ...    primary_mobile=${customers['thai_citizen_eligible']['primary_mobile']}
    ...    backup_mobile=${customers['thai_citizen_eligible']['backup_mobile']}
    ...    bill_type=${billing['sms']}
    ...    bill_lang=${billing['lang_th']}
    ...    install_type=${appointments['standard']['install_type']}
    ...    slot_time=${appointments['standard']['slot_time']}

    # 9. Order Review, Contract Sign & Final Submission
    ${order_id}=    order_submission_e2e_feature.Review Contract Sign And Submit Order
    ...    expected_name=${customers['thai_citizen_eligible']['first_name']} ${customers['thai_citizen_eligible']['last_name']}
    ...    expected_package=${packages['ftth_standalone_500m']['package_name']}
    ...    expected_price=${packages['ftth_standalone_500m']['monthly_price']}

    BuiltIn.Should Not Be Empty    ${order_id}
