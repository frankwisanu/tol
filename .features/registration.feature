@Registration @Epic_THL_1089 @Epic_THL_1095
Feature: True Online (TOL) Registration & Customer Onboarding Lifecycle
  As a Sales Agent, Retail Dealer, or Partner in One App
  I want to initiate and execute TrueOnline service registration
  So that customer requests are validated, bundled, contracted, and provisioned straight through to fulfillment

  Background:
    Given the user opens One App and navigates to the Registration Hub

  @Positive @Smoke @TC_REG_01
  Scenario: Initiate New Customer Standalone Registration with Valid PDPA Consent
    When the agent selects registration type "NEW_CUSTOMER"
    And inputs sales agent code "39027264" and partner code "10015591"
    And accepts the mandatory PDPA data privacy consent and registration terms
    And clicks "เริ่มลงทะเบียนใหม่"
    Then the system initializes the registration session
    And advances the workflow stepper to the "SGIS Coverage Check" step

  @Positive @PartnerChannel @TC_REG_02
  Scenario: Retail Dealer (DLR / CODO) Assisted Registration with RTR Code
    When the agent selects registration type "NEW_CUSTOMER"
    And inputs sales agent code "39027264", RTR code "RTR-BKK-091", and DTR code "DTR-9982"
    And accepts the mandatory PDPA data privacy consent
    And clicks "เริ่มลงทะเบียนใหม่"
    Then the system binds the registration to the retail partner outlet
    And records partner attribution in the registration metadata

  @Negative @Validation @TC_REG_03
  Scenario: Registration Prevented When PDPA Data Privacy Is Not Accepted
    When the agent selects registration type "NEW_CUSTOMER"
    And inputs sales agent code "39027264" and partner code "10015591"
    And leaves the PDPA consent checkbox unchecked
    Then the "เริ่มลงทะเบียนใหม่" button remains disabled
    And an inline validation indicates "กรุณายอมรับเงื่อนไขความยินยอมข้อมูลส่วนบุคคล (PDPA)"

  @Positive @ResumeDraft @TC_REG_04
  Scenario: Resume Draft Incomplete Registration Order
    When the agent selects "ทำรายการต่อ (Resume Draft)"
    And provides customer identification number "1100400123456"
    Then the system retrieves the pending draft session
    And resumes registration at the last saved stepper milestone
