*** Settings ***
Documentation       Locators for TOL Package List, Speed Tiers, and Entry Fee Waiver

*** Variables ***
# Technology Filters
${PACK.FILTER_TAB_FTTH}                       xpath=//button[contains(text(),'FTTH') or @data-tech='FTTH']
${PACK.FILTER_TAB_FTTB}                       xpath=//button[contains(text(),'FTTB') or @data-tech='FTTB']
${PACK.FILTER_TAB_FTTC}                       xpath=//button[contains(text(),'FTTC') or @data-tech='FTTC']

# Package Cards & Offer Codes
${PACK.CARD_CONTAINER}                        xpath=//div[contains(@class,'package-card')]
${PACK.CARD_OFFER_PREFIX}                     xpath=//div[contains(@data-offer-code,'{OFFER_CODE}')]
${PACK.LABEL_SPEED_DOWNLOAD}                  xpath=//span[contains(@class,'speed-download')]
${PACK.LABEL_SPEED_UPLOAD}                    xpath=//span[contains(@class,'speed-upload')]
${PACK.LABEL_PRICE_REGULAR}                   xpath=//span[contains(@class,'price-regular')]
${PACK.LABEL_PRICE_DISCOUNTED}                xpath=//span[contains(@class,'price-discounted')]
${PACK.BTN_SELECT_PACKAGE}                    xpath=//button[contains(@class,'btn-choose-package') or contains(text(),'เลือกแพ็กเกจนี้')]

# Entry Fee Waiver Options
${PACK.RADIO_WAIVE_ENTRY_FEE_YES}             xpath=//input[@name='waiveEntryFee' and @value='Y']
${PACK.RADIO_WAIVE_ENTRY_FEE_NO}              xpath=//input[@name='waiveEntryFee' and @value='N']
${PACK.INPUT_ENTRY_FEE_CODE}                  xpath=//input[@id='input-entry-fee-code']

# Navigation
${PACK.BTN_NEXT}                              xpath=//button[@id='btn-package-next' or contains(text(),'ถัดไป')]
${PACK.BTN_BACK}                              xpath=//button[@id='btn-package-back' or contains(@class,'btn-back')]
