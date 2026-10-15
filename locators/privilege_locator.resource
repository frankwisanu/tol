*** Variables ***
# Privilege Category Selectors
${PRIV.GENERAL_PUBLIC.BUTTON}                   xpath=//input[@name='privilegeGroup' and @value='GENERAL']
${PRIV.CP_EMPLOYEE.BUTTON}                      xpath=//input[@name='privilegeGroup' and @value='CPemp']
${PRIV.TRUE_EMPLOYEE.BUTTON}                    xpath=//input[@name='privilegeGroup' and @value='TRUEemp']
${PRIV.FMC_BENEFIT.BUTTON}                      xpath=//input[@name='privilegeGroup' and @value='FMC_TRUE_DTAC']
${PRIV.NO_PRIVILEGE.BUTTON}                     xpath=//input[@name='privilegeGroup' and @value='NONE']

# Mobile Number Linking for FMC
${PRIV.ELIGIBLE_NUMBER.BUTTON}                  id='sel-fmc-mobile-number'
${PRIV.ELIGIBLE_NUMBERS.BUTTON}                 xpath=//div[contains(@class,'eligible-number-item')]
${PRIV.DISCOUNT_PERCENT.TEXT}                   xpath=//span[contains(@class,'discount-percent-badge')]

# Corporate & Friends-and-Family Inputs
${PRIV.EMPLOYEE_ID.TEXTBOX}                     id='input-employee-id'
${PRIV.COUPON_CODE.TEXTBOX}                     id='input-coupon-code'
${PRIV.VERIFY_CODE.BUTTON}                      id='btn-verify-privilege-code'

# Navigation
${PRIV.NEXT.BUTTON}                             xpath=//button[@id='btn-privilege-next' or contains(text(),'ถัดไป')]
${PRIV.BACK.BUTTON}                             xpath=//button[@id='btn-privilege-back' or contains(@class,'btn-back')]
