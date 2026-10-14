*** Settings ***
Documentation       Locators for Service Selection and Sales Channel format (1P, 2P, 3P, 4POTT)

*** Variables ***
# Screen Header
${SERVICE.LABEL_TITLE}                        xpath=//h1[contains(text(),'เลือกบริการที่ต้องการสมัคร')]

# Primary Service (Broadband Internet - Default & Locked)
${SERVICE.CHK_INTERNET}                       xpath=//input[@id='service-tol-internet' or @name='serviceInternet']
${SERVICE.CONTAINER_INTERNET}                 xpath=//div[contains(@class,'service-card-tol')]

# Additional Add-On Services
${SERVICE.CHK_MOBILE_TMH}                     xpath=//input[@id='service-tmh-mobile' or @name='serviceMobile']
${SERVICE.CHK_TRUEID_TV}                      xpath=//input[@id='service-trueid-tv' or @name='serviceTrueId']
${SERVICE.CHK_FIXED_LINE}                     xpath=//input[@id='service-flp-fixedline' or @name='serviceFixedLine']

# Sales Channel Selection
${SERVICE.RADIO_CHANNEL_ONLINE}               xpath=//input[@name='salesChannel' and @value='ONLINE']
${SERVICE.RADIO_CHANNEL_DIRECT}               xpath=//input[@name='salesChannel' and @value='OFFLINE_DIRECT']

# Bundle Badge Indicator
${SERVICE.BADGE_PLAY_TYPE}                    xpath=//span[contains(@class,'play-type-badge')]

# Navigation
${SERVICE.BTN_NEXT}                           xpath=//button[@id='btn-service-next' or contains(text(),'ถัดไป')]
${SERVICE.BTN_BACK}                           xpath=//button[@id='btn-service-back' or contains(@class,'btn-back')]
