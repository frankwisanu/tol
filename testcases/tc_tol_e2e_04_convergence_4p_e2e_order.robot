*** Settings ***
Documentation   TC_TOL_E2E_04: Register Full Convergence 4POTT Quad-Play Bundle
Resource        ${CURDIR}/../imports/imports.resource
Test Teardown   common.Default test teardown

*** Test Cases ***
TC_TOL_E2E_04: Register Full Convergence 4POTT Quad-Play Bundle
    [Documentation]    Verify complete 4POTT Quadruple Play convergence flow with all four services
    [Tags]             convergence    4pott    full_play    p0

    # Step 1: Open Application
    common.Open chrome browser      ${application['base_url']}

    # Step 2: SGIS Coverage Check
    check_coverage_feature.Verify And Confirm Green Coverage Feasibility
    ...    search_address=${addresses['green_coverage']['query']}

    # Step 3: Select Full 4POTT Service Bundle
    select_bundle_package_feature.Select Convergence 4POTT Full Play

    # Step 4: Customer Verification & Remote QR Biometric KYC
    customer_kyc_verification_feature.Verify Identity And Complete Self KYC Via QR
    ...    doc_type=${customers['thai_citizen_eligible']['doc_type']}
    ...    id_number=${customers['thai_citizen_eligible']['id_number']}
    ...    first_name=${customers['thai_citizen_eligible']['first_name']}
    ...    last_name=${customers['thai_citizen_eligible']['last_name']}
    ...    birth_date=${customers['thai_citizen_eligible']['birth_date']}
    ...    expiry_date=${customers['thai_citizen_eligible']['expiry_date']}

    # Step 5: Privilege & Package Selection (4POTT Smart Box 500/500 Mbps)
    package_and_privilege_feature.Select Package With General Public Privilege
    ...    media_tech=${packages['ftth_4pott_smart_box']['media_tech']}
    ...    offer_code=${packages['ftth_4pott_smart_box']['offer_code']}
    ...    waive_entry_fee=True

    # Step 6: Customer Info & Appointment Booking
    installation_appointment_feature.Configure Contact Details And Installation Schedule
    ...    primary_mobile=${customers['thai_citizen_eligible']['primary_mobile']}
    ...    backup_mobile=${customers['thai_citizen_eligible']['backup_mobile']}
    ...    bill_type=${billing['sms']}
    ...    bill_lang=${billing['lang_th']}
    ...    install_type=${appointments['standard']['install_type']}
    ...    slot_time=${appointments['standard']['slot_time']}

    # Step 7: Order Review, Contract Sign & Final Submission
    ${order_id}=    order_submission_e2e_feature.Review Contract Sign And Submit Order
    ...    expected_name=${customers['thai_citizen_eligible']['first_name']} ${customers['thai_citizen_eligible']['last_name']}
    ...    expected_package=${packages['ftth_4pott_smart_box']['package_name']}
    ...    expected_price=${packages['ftth_4pott_smart_box']['monthly_price']}

    BuiltIn.Should Not Be Empty    ${order_id}
