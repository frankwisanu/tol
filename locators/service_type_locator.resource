*** Variables ***
# Screen Header
${SERVICE.TITLE.TEXT}                          xpath=//h1[contains(text(),'เลือกบริการที่ต้องการสมัคร')]

# Primary Service (Broadband Internet - Default & Locked)
${SERVICE.INTERNET.BUTTON}                     xpath=//input[@id='service-tol-internet' or @name='serviceInternet']
${SERVICE.CONTAINER_INTERNET.TEXT}             xpath=//div[contains(@class,'service-card-tol')]

# Additional Add-On Services
${SERVICE.MOBILE_TMH.BUTTON}                   xpath=//input[@id='service-tmh-mobile' or @name='serviceMobile']
${SERVICE.TRUEID_TV.BUTTON}                    xpath=//input[@id='service-trueid-tv' or @name='serviceTrueId']
${SERVICE.FIXED_LINE.BUTTON}                   xpath=//input[@id='service-flp-fixedline' or @name='serviceFixedLine']

# Sales Channel Selection
${SERVICE.CHANNEL_ONLINE.BUTTON}               xpath=//input[@name='salesChannel' and (@value='ONLINE' or @value='ONLIEN')]
${SERVICE.CHANNEL_DIRECT.BUTTON}               xpath=//input[@name='salesChannel' and (@value='OFFLINE_DIRECT' or @value='DIRECT')]

# Bundle Badge Indicator
${SERVICE.PLAY_TYPE.TEXT}                      xpath=//span[contains(@class,'play-type-badge')]

# Navigation
${SERVICE.NEXT.BUTTON}                         xpath=//button[@id='btn-service-next' or contains(text(),'ถัดไป')]
${SERVICE.BACK.BUTTON}                         xpath=//button[@id='btn-service-back' or contains(@class,'btn-back')]
