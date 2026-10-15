*** Settings ***
Documentation   TC_TOL_E2E_02: Register Broadband With Yellow Over-Cable Fee Approval
Resource        ${CURDIR}/../imports/imports.resource
Test Teardown   common.Default test teardown

*** Test Cases ***
TC_TOL_E2E_02: Register Broadband With Yellow Over-Cable Fee Approval
    [Documentation]    Verify Yellow Coverage scenario where customer accepts excess drop-wire fee
    [Tags]             regression    yellow_coverage    p1

    # Step 1: Open Application
    common.Open chrome browser      ${application['base_url']}

    # Step 2: SGIS Coverage Check (Yellow Tier - Private House)
    check_coverage_feature.Verify Yellow Coverage And Approve Over Cable Fee
    ...    search_address=${addresses['yellow_coverage_private']['query']}
    ...    house_type=${addresses['yellow_coverage_private']['house_type']}

    # Step 3: Select Service Type (1P Standalone)
    select_bundle_package_feature.Select Standalone 1P Broadband Online Channel

    # Step 4: Customer ID Validation (Direct Assisted KYC)
    customer_kyc_verification_feature.Verify Identity And Complete Direct Assisted Registration
    ...    doc_type=${customers['thai_citizen_eligible']['doc_type']}
    ...    id_number=${customers['thai_citizen_eligible']['id_number']}
    ...    first_name=${customers['thai_citizen_eligible']['first_name']}
    ...    last_name=${customers['thai_citizen_eligible']['last_name']}
    ...    birth_date=${customers['thai_citizen_eligible']['birth_date']}
    ...    expiry_date=${customers['thai_citizen_eligible']['expiry_date']}

    # Step 5: Package Selection & Entry Fee Waiver
    package_and_privilege_feature.Select Package With General Public Privilege
    ...    media_tech=${packages['ftth_standalone_500m']['media_tech']}
    ...    offer_code=${packages['ftth_standalone_500m']['offer_code']}
    ...    waive_entry_fee=True

    # Step 6: Contact Info & Special Installation Appointment
    installation_appointment_feature.Configure Contact Details And Installation Schedule
    ...    primary_mobile=${customers['thai_citizen_eligible']['primary_mobile']}
    ...    backup_mobile=${customers['thai_citizen_eligible']['backup_mobile']}
    ...    bill_type=${billing['email']}
    ...    bill_lang=${billing['lang_th']}
    ...    install_type=${appointments['special']['install_type']}
    ...    slot_time=${appointments['special']['slot_time']}
    ...    email=${customers['thai_citizen_eligible']['email']}

    # Step 7: Order Review & Final Submission
    ${order_id}=    order_submission_e2e_feature.Review Contract Sign And Submit Order
    ...    expected_name=${customers['thai_citizen_eligible']['first_name']} ${customers['thai_citizen_eligible']['last_name']}
    ...    expected_package=${packages['ftth_standalone_500m']['package_name']}
    ...    expected_price=${packages['ftth_standalone_500m']['monthly_price']}

    BuiltIn.Should Not Be Empty    ${order_id}
