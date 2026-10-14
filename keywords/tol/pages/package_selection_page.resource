*** Settings ***
Documentation       Page Object keywords for TOL Package List and Entry Fee
Resource            ${CURDIR}/../../../locators/package_selection_locator.resource
Resource            ${CURDIR}/../../../common/common.resource

*** Keywords ***
Filter Package By Media Technology
    [Arguments]    ${media_tech}
    [Documentation]    Select technology filter tab (FTTH, FTTB, FTTC)
    IF    '${media_tech}' == 'FTTH'
        common.Click element when ready    ${PACK.FILTER_TAB_FTTH}
    ELSE IF    '${media_tech}' == 'FTTB'
        common.Click element when ready    ${PACK.FILTER_TAB_FTTB}
    ELSE IF    '${media_tech}' == 'FTTC'
        common.Click element when ready    ${PACK.FILTER_TAB_FTTC}
    END

Select Broadband Package By Offer Code
    [Arguments]    ${offer_code}
    [Documentation]    Choose package matching offer code
    ${btn_xpath}=    Set Variable    xpath=//div[contains(@data-offer-code,'${offer_code}')]//button[contains(@class,'btn-choose-package') or contains(text(),'เลือกแพ็กเกจนี้')]
    common.Click element when ready    ${btn_xpath}

Configure Entry Fee Option
    [Arguments]    ${waive_fee}=True    ${promo_code}=${EMPTY}
    [Documentation]    Apply entry fee waiver or discount voucher
    IF    ${waive_fee}
        common.Click element when ready    ${PACK.RADIO_WAIVE_ENTRY_FEE_YES}
    ELSE
        common.Click element when ready    ${PACK.RADIO_WAIVE_ENTRY_FEE_NO}
        IF    '${promo_code}' != '${EMPTY}'
            common.Input text when ready   ${PACK.INPUT_ENTRY_FEE_CODE}    ${promo_code}
        END
    END

Click Next Button On Package Selection
    [Documentation]    Proceed to Customer Info
    common.Click element when ready        ${PACK.BTN_NEXT}
