@CoverageCheck @Epic_THL_1089 @Epic_THL_1090
Feature: SGIS Network Coverage Feasibility Check
  As a One App Sales Agent
  I need to check physical network availability at the customer's installation premises
  So that I only offer valid packages and handle excess cable approvals upfront

  Background:
    Given the sales agent is logged into One App with partner code "10015591"
    And navigates to "ลงทะเบียนทรูออนไลน์" under "บริการอื่นๆ"

  @Positive @Smoke @TC_ON_GIS_01
  Scenario: Green Tier - Unrestricted Fiber Coverage Available
    When the agent searches installation address "Premio Condo ตึก2 ดินแดง กรุงเทพมหานคร"
    And confirms the map marker coordinates
    Then the SGIS system returns "GREEN" coverage tier
    And the "TC Approve Flag" is set to "None"
    When the agent clicks "สมัครบริการ"
    Then the system successfully transitions to the Service Selection screen

  @Positive @OverCable @TC_ON_GIS_05
  Scenario: Yellow Tier - Over-Cable Limit Exceeded for Private House
    When the agent searches installation address "19/22 หมู่ 4 ต.บ้านบึง อ.บ้านบึง ชลบุรี"
    And confirms the map marker coordinates
    Then the SGIS system returns "YELLOW" coverage tier with notice "ทางสายเกิน"
    When the agent selects property type "บ้านส่วนตัว" (Private House)
    And marks the agreement to pay excess drop wire charges
    And clicks "สมัครบริการ"
    Then the order proceeds with "TC Approve Flag" set to "N"

  @Negative @TC_ON_GIS_07
  Scenario: Red Tier - Location Outside True Network Coverage
    When the agent searches installation address "เกาะห่างไกล อ.เมือง ระยอง"
    And confirms the map marker coordinates
    Then the SGIS system returns "RED" coverage tier ("พื้นที่ไม่สามารถให้บริการได้")
    And displays the "ลงชื่อสนใจบริการ (Waiting List)" button
    And the "สมัครบริการ" button remains disabled
