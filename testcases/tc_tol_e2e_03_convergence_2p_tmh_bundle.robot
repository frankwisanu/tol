*** Settings ***
Documentation   TC_TOL_E2E_03: Register Convergence 2P Bundle with TrueMove H FMC Discount
Resource        ${CURDIR}/../imports/imports.resource
Test Teardown   common.Default test teardown

*** Test Cases ***
TC_TOL_E2E_03: Register Convergence 2P With FMC Discount
    [Documentation]    Verify 2P Bundle (TOL + TMH) with active TrueMove H mobile number discount
    [Tags]             convergence    fmc    2p    p0

    # Step 1: Open Application
    common.Open chrome browser      ${application['base_url']}

    # Step 2: SGIS Coverage Check
    check_coverage_feature.Verify And Confirm Green Coverage Feasibility
    ...    search_address=${addresses['green_coverage']['query']}

    # Step 3: Select 2P Service Type (Internet + TMH Mobile)
    select_bundle_package_feature.Select Convergence 2P Bundle With Mobile SIM

    # Step 4: Customer Verification & Remote QR Biometric KYC
    customer_kyc_verification_feature.Verify Identity And Complete Self KYC Via QR
    ...    doc_type=${customers['thai_citizen_eligible']['doc_type']}
    ...    id_number=${customers['thai_citizen_eligible']['id_number']}
    ...    first_name=${customers['thai_citizen_eligible']['first_name']}
    ...    last_name=${customers['thai_citizen_eligible']['last_name']}
    ...    birth_date=${customers['thai_citizen_eligible']['birth_date']}
    ...    expiry_date=${customers['thai_citizen_eligible']['expiry_date']}

    # Step 5: Privilege Selection (Apply FMC Discount with Mobile Number)
    package_and_privilege_feature.Select Package With TrueMove H FMC Privilege
    ...    fmc_mobile=${customers['fmc_subscriber']['fmc_mobile']}
    ...    media_tech=${packages['ftth_standalone_500m']['media_tech']}
    ...    offer_code=${packages['ftth_standalone_500m']['offer_code']}
    ...    waive_entry_fee=True

    # Step 6: Customer Info & Appointment Booking
    installation_appointment_feature.Configure Contact Details And Installation Schedule
    ...    primary_mobile=${customers['thai_citizen_eligible']['primary_mobile']}
    ...    backup_mobile=${customers['thai_citizen_eligible']['backup_mobile']}
    ...    bill_type=${billing['sms']}
    ...    bill_lang=${billing['lang_th']}
    ...    install_type=${appointments['standard']['install_type']}
    ...    slot_time=${appointments['standard']['slot_time']}

    # Step 7: Order Review & Final Submission
    ${order_id}=    order_submission_e2e_feature.Review Contract Sign And Submit Order
    ...    expected_name=${customers['thai_citizen_eligible']['first_name']} ${customers['thai_citizen_eligible']['last_name']}
    ...    expected_package=${packages['ftth_standalone_500m']['package_name']}
    ...    expected_price=${packages['ftth_standalone_500m']['monthly_price']}

    BuiltIn.Should Not Be Empty    ${order_id}
