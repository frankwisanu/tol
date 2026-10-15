*** Variables ***
# Technology Filters
${PACK.FILTER_FTTH.BUTTON}                     xpath=//button[contains(text(),'FTTH') or @data-tech='FTTH']
${PACK.FILTER_FTTB.BUTTON}                     xpath=//button[contains(text(),'FTTB') or @data-tech='FTTB']
${PACK.FILTER_FTTC.BUTTON}                     xpath=//button[contains(text(),'FTTC') or @data-tech='FTTC']

# Package Cards & Offer Codes
${PACK.CARD_CONTAINER.TEXT}                    xpath=//div[contains(@class,'package-card')]
${PACK.CARD_OFFER_PREFIX.BUTTON}               xpath=//div[contains(@data-offer-code,'{OFFER_CODE}')]
${PACK.SPEED_DOWNLOAD.TEXT}                    xpath=//span[contains(@class,'speed-download')]
${PACK.SPEED_UPLOAD.TEXT}                      xpath=//span[contains(@class,'speed-upload')]
${PACK.PRICE_REGULAR.TEXT}                     xpath=//span[contains(@class,'price-regular')]
${PACK.PRICE_DISCOUNTED.TEXT}                  xpath=//span[contains(@class,'price-discounted')]
${PACK.SELECT_PACKAGE.BUTTON}                  xpath=//button[contains(@class,'btn-choose-package') or contains(text(),'เลือกแพ็กเกจนี้')]

# Entry Fee Waiver Options
${PACK.WAIVE_ENTRY_FEE_YES.BUTTON}             xpath=//input[@name='waiveEntryFee' and @value='Y']
${PACK.WAIVE_ENTRY_FEE_NO.BUTTON}              xpath=//input[@name='waiveEntryFee' and @value='N']
${PACK.ENTRY_FEE_CODE.TEXTBOX}                 xpath=//input[@id='input-entry-fee-code']

# Navigation
${PACK.NEXT.BUTTON}                            xpath=//button[@id='btn-package-next' or contains(text(),'ถัดไป')]
${PACK.BACK.BUTTON}                            xpath=//button[@id='btn-package-back' or contains(@class,'btn-back')]
