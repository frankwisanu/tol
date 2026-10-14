@PackageAndPrivilege @Epic_THL_1087 @Epic_THL_1089 @Epic_THL_1095
Feature: Privilege Discount Calculation and Package Selection
  As a Customer or Sales Partner
  I want to apply eligible FMC convergence discounts or employee welfare
  So that the monthly recurring charges reflect appropriate promotional rates

  Background:
    Given the customer has successfully passed digital KYC authentication

  @Positive @FMC @TC_ON_PRI_VER_11
  Scenario: TrueMove H Convergence Benefit Application (xT FMC Discount)
    When the user navigates to the "Privilege" screen
    And selects "สิทธิ์เบอร์ TRUE / DTAC"
    Then the system invokes "tolGetTmhEligibility" and returns active postpaid number "0642270234"
    When the user selects number "0642270234"
    Then the system applies a 20% recurring discount badge
    When the user clicks "ถัดไป"
    Then the package catalog filters FTTH packages with discounted prices displayed

  @Positive @PackageSelection @TC_ON_TOL_SIT_PACK_21
  Scenario: Select FTTH 500/500 Package and Apply Entry Fee Waiver
    Given the package list is displayed for FTTH technology
    When the user selects offer "FTOT409-500" ("True Gigatex Fiber 500/500 Mbps")
    And selects "Waive TOL Entry Fee = Yes" (890 THB waived)
    And clicks "ถัดไป"
    Then the Product Summary displays Monthly Fee as "499.00 THB" and Entry Fee as "0.00 THB"
