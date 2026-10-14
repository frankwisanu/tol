*** Settings ***
Documentation       Feature-level business flow for Customer Identification & QR Biometric KYC
Resource            ../pages/customer_id_page.resource
Resource            ../pages/kyc_self_verification_page.resource

*** Keywords ***
Verify Identity And Complete Self KYC Via QR
    [Arguments]    ${doc_type}    ${id_number}    ${first_name}    ${last_name}    ${birth_date}    ${expiry_date}
    [Documentation]    Validate ID fields, generate QR code, simulate remote customer scan & liveness
    customer_id_page.Select Identity Document Tab              ${doc_type}
    customer_id_page.Input Customer Identification Details     ${id_number}    ${first_name}    ${last_name}    ${birth_date}    ${expiry_date}
    customer_id_page.Click Validate Customer Eligibility
    customer_id_page.Verify Eligibility Passed
    customer_id_page.Click Next To KYC Step
    kyc_self_verification_page.Generate Staff Verification QR Code
    kyc_self_verification_page.Simulate Customer Mobile Scan And Liveness Verification    mock_match_score=94
    kyc_self_verification_page.Complete KYC And Proceed

Verify Identity And Complete Direct Assisted Registration
    [Arguments]    ${doc_type}    ${id_number}    ${first_name}    ${last_name}    ${birth_date}    ${expiry_date}
    [Documentation]    Validate ID and bypass QR code for direct assisted KYC
    customer_id_page.Select Identity Document Tab              ${doc_type}
    customer_id_page.Input Customer Identification Details     ${id_number}    ${first_name}    ${last_name}    ${birth_date}    ${expiry_date}
    customer_id_page.Click Validate Customer Eligibility
    customer_id_page.Verify Eligibility Passed
    customer_id_page.Click Next To KYC Step
    kyc_self_verification_page.Bypass QR Self Verification
    kyc_self_verification_page.Complete KYC And Proceed
