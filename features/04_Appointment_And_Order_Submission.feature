@OrderSubmission @Epic_THL_1089 @Epic_THL_1092
Feature: Appointment Scheduling and End-to-End Order Submission
  As an Omnichannel Sales Agent
  I need to lock a technician appointment slot and submit the signed customer contract
  So that the order is seamlessly fulfilled in iOM and archived for audit compliance

  Background:
    Given the package configuration and billing profile have been selected

  @Positive @Smoke @TC_ON_REVIEW_01 @TC_SM_E2E_01
  Scenario: Successful Order Submission with Morning Technician Slot
    When the agent selects "ติดตั้งแบบมาตรฐาน (Standard Installation)"
    And chooses an available morning slot ("08:30 - 12:00")
    And proceeds to "Review Order and Confirm"
    Then the contract summary reflects customer details, selected FTTH package, and appointment slot
    When the customer signs the digital signature canvas
    And the agent clicks "ยืนยันการสมัคร (Confirm Submission)"
    Then the system executes "tolSubmit" API payload to Backend Core
    And returns a unique Customer Order ID (e.g. "2601301414A1TO2P8D15")
    And uploads customer ID documents to AWS S3
    And displays the "ส่งคำขอสำเร็จ" success screen with PIE report download button

  @Negative @ConflictHandling @TC_CHK_PORT_02
  Scenario: Automatic Rescheduling When Selected Technician Slot Is Fully Booked
    Given a concurrent booking exhausts the selected morning slot quota
    When the system checks port capacity and technician availability in Module 20
    Then a conflict dialog appears: "วันและเวลาที่เลือกเต็มแล้ว กรุณาเลือกวันติดตั้งใหม่"
    When the agent clicks "เลือกวันติดตั้งใหม่"
    And selects an available afternoon slot ("13:00 - 17:00")
    Then the system successfully locks the new reservation hold
