*** Settings ***
Documentation       Locators for SGIS Check Coverage Webview and Map components in One App

*** Variables ***
# Navigation & Webview Container
${SGIS.WEBVIEW_CONTAINER}                     xpath=//div[contains(@class,'sgis-webview-container')]
${SGIS.BTN_BACK}                              xpath=//button[@id='btn-gis-back' or contains(@class,'back-arrow')]
${SGIS.MODAL_CANCEL_CONFIRM}                  xpath=//div[contains(@class,'confirm-exit-dialog')]
${SGIS.BTN_CANCEL_CONFIRM_YES}                xpath=//button[contains(text(),'ต้องการ') and not(contains(text(),'ไม่'))]
${SGIS.BTN_CANCEL_CONFIRM_NO}                 xpath=//button[contains(text(),'ไม่ต้องการ')]

# Map & Address Search
${SGIS.INPUT_SEARCH_LOCATION}                 xpath=//input[@id='input-gis-search' or @placeholder='ค้นหาที่อยู่หรือพิกัด']
${SGIS.BTN_SEARCH_SUBMIT}                     xpath=//button[@id='btn-search-location']
${SGIS.PIN_MAP_MARKER}                        xpath=//div[contains(@class,'gis-map-marker')]
${SGIS.BTN_CONFIRM_LOCATION}                  xpath=//button[@id='btn-confirm-location']

# Coverage Result Badges & Banners
${SGIS.BADGE_COVERAGE_GREEN}                  xpath=//div[@data-coverage='GREEN' or contains(@class,'coverage-green')]
${SGIS.BADGE_COVERAGE_YELLOW}                 xpath=//div[@data-coverage='YELLOW' or contains(@class,'coverage-yellow')]
${SGIS.BADGE_COVERAGE_RED}                    xpath=//div[@data-coverage='RED' or contains(@class,'coverage-red')]

# Over-Cable & House Type Selection
${SGIS.RADIO_HOUSE_PRIVATE}                   xpath=//input[@name='houseType' and @value='PRIVATE']
${SGIS.RADIO_HOUSE_RENTAL}                    xpath=//input[@name='houseType' and @value='RENTAL']
${SGIS.CHECKBOX_ACCEPT_OVERCABLE_FEE}         xpath=//input[@id='chk-accept-overcable']

# Action Buttons
${SGIS.BTN_REGISTER_SERVICE}                  xpath=//button[@id='btn-register-tol' or contains(text(),'สมัครบริการ')]
${SGIS.BTN_ENROLL_WAITING_LIST}               xpath=//button[@id='btn-waiting-list' or contains(text(),'ลงชื่อสนใจบริการ')]
