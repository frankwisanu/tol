*** Keywords ***
Filter Package By Media Technology
    [Arguments]    ${media_tech}
    [Documentation]    Select technology filter tab (FTTH, FTTB, FTTC)
    IF    '${media_tech}' == 'FTTH'
        common.Click element when ready    ${PACK.FILTER_FTTH.BUTTON}
    ELSE IF    '${media_tech}' == 'FTTB'
        common.Click element when ready    ${PACK.FILTER_FTTB.BUTTON}
    ELSE IF    '${media_tech}' == 'FTTC'
        common.Click element when ready    ${PACK.FILTER_FTTC.BUTTON}
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
        common.Click element when ready    ${PACK.WAIVE_ENTRY_FEE_YES.BUTTON}
    ELSE
        common.Click element when ready    ${PACK.WAIVE_ENTRY_FEE_NO.BUTTON}
        IF    '${promo_code}' != '${EMPTY}'
            common.Input text when ready   ${PACK.ENTRY_FEE_CODE.TEXTBOX}    ${promo_code}
        END
    END

Click Next Button On Package Selection
    [Documentation]    Proceed to Customer Info
    common.Click element when ready        ${PACK.NEXT.BUTTON}
