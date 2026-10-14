@ServiceAndKYC @Epic_THL_1089 @Epic_THL_1091 @Epic_THL_1093
Feature: Multi-Play Service Configuration and Customer Digital KYC
  As an Omnichannel Sales Agent
  I need to configure customer bundle options and verify customer identity digitally
  So that customer records are authenticated without paperwork and fraud risks are mitigated

  Background:
    Given the agent has completed SGIS coverage check with "GREEN" status

  @Positive @Smoke @TC_ON_SEV_04
  Scenario: Standalone 1P Broadband with Online Channel Selection
    Given the Service Selection screen is displayed
    Then "อินเทอร์เน็ต (TOL)" is pre-checked and locked
    When the agent selects sales channel "ออนไลน์ (Online Channel)"
    And clicks "ถัดไป"
    Then the system navigates to "Customer ID Verification"

  @Positive @Biometrics @TC_ON_CUS_INFO_01
  Scenario: Customer Self-Verification QR and Biometric Liveness Match
    Given the agent inputs Thai National ID "1103701234567"
    And applicant passes Fraud TMV screening
    When the agent clicks "ถัดไป" on the Customer ID screen
    Then the Staff Screen displays an encrypted QR Code and Ref Code
    When the customer scans the QR Code on their smartphone
    And captures a photo of their Thai National ID
    And performs facial liveness detection (head turn and blink)
    Then the face match score is confirmed at >= 85%
    And the Staff Screen status automatically updates to "ยืนยันตัวตนสำเร็จ"
    And the agent is allowed to proceed to Privilege Selection

  @Negative @FraudCheck @TC_ON_TOL_VAL_02
  Scenario: Customer Blocked Due to Outstanding Debt or Fraud TMV Flag
    Given the agent inputs Thai National ID flagged for telecom debt
    When the agent clicks "ตรวจสอบสิทธิ์ (Validate)"
    Then the system triggers "SMARTUI-validateTMVFraudAndBlackList"
    And displays error banner: "ไม่ผ่านการตรวจสอบ Fraud TMV เนื่องจากมียอดค้างชำระ"
    And prevents continuation to KYC or order generation
