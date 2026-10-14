*** Settings ***
Documentation   TC_TOL_REG_01: End-to-End TrueOnline Registration Flow with Partner Code & PDPA
Resource        ${CURDIR}/../imports/imports.resource
Test Teardown   common.Default test teardown

*** Test Cases ***
TC_TOL_REG_01: End-to-End TrueOnline Registration Lifecycle
    [Documentation]    Verify complete registration initiation, SGIS check, bundle selection, KYC, appointment, and submission
    [Tags]             registration    smoke    e2e    p0

    # Step 1: Open One App Portal
    common.Open chrome browser                          ${application['base_url']}

    # Step 2: Initiate Registration & Accept PDPA
    registration_feature.Initiate TrueOnline Registration Flow
    ...    reg_type=NEW_CUSTOMER
    ...    sale_agent_id=39027264
    ...    rtr_code=RTR-BKK-091

    # Step 3: SGIS Coverage Check
    check_coverage_feature.Verify And Confirm Green Coverage Feasibility
    ...    search_address=${addresses['green_coverage']['query']}

    # Step 4: Service Bundle Selection
    select_bundle_package_feature.Select Standalone 1P Broadband Online Channel

    # Step 5: Customer Verification & Remote QR Biometric KYC
    customer_kyc_verification_feature.Verify Identity And Complete Self KYC Via QR
    ...    doc_type=${customers['thai_citizen_eligible']['doc_type']}
    ...    id_number=${customers['thai_citizen_eligible']['id_number']}
    ...    first_name=${customers['thai_citizen_eligible']['first_name']}
    ...    last_name=${customers['thai_citizen_eligible']['last_name']}
    ...    birth_date=${customers['thai_citizen_eligible']['birth_date']}
    ...    expiry_date=${customers['thai_citizen_eligible']['expiry_date']}

    # Step 6: Package & Privilege Selection
    package_and_privilege_feature.Select Package With General Public Privilege
    ...    media_tech=FTTH
    ...    offer_code=${packages['ftth_standalone_500m']['offer_code']}
    ...    waive_entry_fee=True

    # Step 7: Customer Info & Appointment Booking
    installation_appointment_feature.Configure Contact Details And Installation Schedule
    ...    primary_mobile=${customers['thai_citizen_eligible']['primary_mobile']}
    ...    backup_mobile=${customers['thai_citizen_eligible']['backup_mobile']}
    ...    bill_type=SMS
    ...    bill_lang=TH
    ...    install_type=${appointments['standard']['install_type']}
    ...    slot_time=${appointments['standard']['slot_time']}

    # Step 8: Order Review, Contract Sign & Final Submission
    ${order_id}=    order_submission_e2e_feature.Review Contract Sign And Submit Order
    ...    expected_name=${customers['thai_citizen_eligible']['first_name']} ${customers['thai_citizen_eligible']['last_name']}
    ...    expected_package=${packages['ftth_standalone_500m']['package_name']}
    ...    expected_price=${packages['ftth_standalone_500m']['monthly_price']}

    BuiltIn.Should Not Be Empty    ${order_id}
