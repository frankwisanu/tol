*** Settings ***
Documentation       Locators for Customer Privilege (FMC, CP Employee, True Employee, F&F)

*** Variables ***
# Privilege Category Selectors
${PRIV.RADIO_GENERAL_PUBLIC}                  xpath=//input[@name='privilegeGroup' and @value='GENERAL']
${PRIV.RADIO_CP_EMPLOYEE}                     xpath=//input[@name='privilegeGroup' and @value='CPemp']
${PRIV.RADIO_TRUE_EMPLOYEE}                   xpath=//input[@name='privilegeGroup' and @value='TRUEemp']
${PRIV.RADIO_FMC_BENEFIT}                     xpath=//input[@name='privilegeGroup' and @value='FMC_TRUE_DTAC']
${PRIV.RADIO_NO_PRIVILEGE}                    xpath=//input[@name='privilegeGroup' and @value='NONE']

# Mobile Number Linking for FMC
${PRIV.SELECT_ELIGIBLE_NUMBER}                xpath=//select[@id='sel-fmc-mobile-number']
${PRIV.LIST_ELIGIBLE_NUMBERS}                 xpath=//div[contains(@class,'eligible-number-item')]
${PRIV.LABEL_DISCOUNT_PERCENT}                xpath=//span[contains(@class,'discount-percent-badge')]

# Corporate & Friends-and-Family Inputs
${PRIV.INPUT_EMPLOYEE_ID}                     xpath=//input[@id='input-employee-id']
${PRIV.INPUT_COUPON_CODE}                     xpath=//input[@id='input-coupon-code']
${PRIV.BTN_VERIFY_CODE}                       xpath=//button[@id='btn-verify-privilege-code']

# Navigation
${PRIV.BTN_NEXT}                              xpath=//button[@id='btn-privilege-next' or contains(text(),'ถัดไป')]
${PRIV.BTN_BACK}                              xpath=//button[@id='btn-privilege-back' or contains(@class,'btn-back')]
