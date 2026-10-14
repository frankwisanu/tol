*** Settings ***
Documentation   TC_TOL_E2E_01: Register Standalone 1P Broadband Success with Green Coverage
Resource        ${CURDIR}/../imports/imports.resource
Test Teardown   common.Default test teardown

*** Test Cases ***
TC_TOL_E2E_01: Register Standalone 1P Broadband Success
    [Documentation]    Verify complete E2E flow for 1P Internet with Green Coverage and Thai Citizen ID
    [Tags]             smoke    regression    e2e    p0

    # Step 1: Open Application
    common.Open chrome browser      ${application['base_url']}

    # Step 2: SGIS Coverage Check (Green Tier)
    check_coverage_feature.Verify And Confirm Green Coverage Feasibility
    ...    search_address=${addresses['green_coverage']['query']}

    # Step 3: Select Service Type (1P Standalone, Online Channel)
    select_bundle_package_feature.Select Standalone 1P Broadband Online Channel

    # Step 4: Customer ID Validation and Digital KYC via QR Code
    customer_kyc_verification_feature.Verify Identity And Complete Self KYC Via QR
    ...    doc_type=${customers['thai_citizen_eligible']['doc_type']}
    ...    id_number=${customers['thai_citizen_eligible']['id_number']}
    ...    first_name=${customers['thai_citizen_eligible']['first_name']}
    ...    last_name=${customers['thai_citizen_eligible']['last_name']}
    ...    birth_date=${customers['thai_citizen_eligible']['birth_date']}
    ...    expiry_date=${customers['thai_citizen_eligible']['expiry_date']}

    # Step 5: Privilege & Package Selection (General Public, FTTH 500/500)
    package_and_privilege_feature.Select Package With General Public Privilege
    ...    media_tech=FTTH
    ...    offer_code=${packages['ftth_standalone_500m']['offer_code']}
    ...    waive_entry_fee=True

    # Step 6: Customer Info & Appointment Booking
    installation_appointment_feature.Configure Contact Details And Installation Schedule
    ...    primary_mobile=${customers['thai_citizen_eligible']['primary_mobile']}
    ...    backup_mobile=${customers['thai_citizen_eligible']['backup_mobile']}
    ...    bill_type=SMS
    ...    bill_lang=TH
    ...    install_type=${appointments['standard']['install_type']}
    ...    slot_time=${appointments['standard']['slot_time']}

    # Step 7: Order Review, Contract Sign & Final Submission
    ${order_id}=    order_submission_e2e_feature.Review Contract Sign And Submit Order
    ...    expected_name=${customers['thai_citizen_eligible']['first_name']} ${customers['thai_citizen_eligible']['last_name']}
    ...    expected_package=${packages['ftth_standalone_500m']['package_name']}
    ...    expected_price=${packages['ftth_standalone_500m']['monthly_price']}

    BuiltIn.Should Not Be Empty    ${order_id}
