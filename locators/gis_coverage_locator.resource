*** Variables ***
# Navigation & Webview Container
${SGIS.WEBVIEW_CONTAINER.TEXT}                     xpath=//div[contains(@class,'sgis-webview-container')]
${SGIS.BACK.BUTTON}                                xpath=//button[@id='btn-gis-back' or contains(@class,'back-arrow')]
${SGIS.CANCEL_CONFIRM.TEXT}                        xpath=//div[contains(@class,'confirm-exit-dialog')]
${SGIS.CANCEL_CONFIRM_YES.BUTTON}                  xpath=//button[contains(text(),'ต้องการ') and not(contains(text(),'ไม่'))]
${SGIS.CANCEL_CONFIRM_NO.BUTTON}                   xpath=//button[contains(text(),'ไม่ต้องการ')]

# Map & Address Search
${SGIS.SEARCH_LOCATION.TEXTBOX}                    xpath=//input[@id='input-gis-search' or @placeholder='ค้นหาที่อยู่หรือพิกัด']
${SGIS.SEARCH_SUBMIT.BUTTON}                       xpath=//button[@id='btn-search-location']
${SGIS.MAP_MARKER.BUTTON}                          xpath=//div[contains(@class,'gis-map-marker')]
${SGIS.CONFIRM_LOCATION.BUTTON}                    xpath=//button[@id='btn-confirm-location']

# Coverage Result Badges & Banners
${SGIS.COVERAGE_GREEN.TEXT}                        xpath=//div[@data-coverage='GREEN' or contains(@class,'coverage-green')]
${SGIS.COVERAGE_YELLOW.TEXT}                       xpath=//div[@data-coverage='YELLOW' or contains(@class,'coverage-yellow')]
${SGIS.COVERAGE_RED.TEXT}                          xpath=//div[@data-coverage='RED' or contains(@class,'coverage-red')]

# Over-Cable & House Type Selection
${SGIS.HOUSE_PRIVATE.BUTTON}                       xpath=//input[@name='houseType' and @value='PRIVATE']
${SGIS.HOUSE_RENTAL.BUTTON}                        xpath=//input[@name='houseType' and @value='RENTAL']
${SGIS.ACCEPT_OVERCABLE_FEE.BUTTON}                xpath=//input[@id='chk-accept-overcable']

# Action Buttons
${SGIS.REGISTER_SERVICE.BUTTON}                    xpath=//button[@id='btn-register-tol' or contains(text(),'สมัครบริการ')]
${SGIS.ENROLL_WAITING_LIST.BUTTON}                 xpath=//button[@id='btn-waiting-list' or contains(text(),'ลงชื่อสนใจบริการ')]
