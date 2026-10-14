*** Settings ***
Documentation       Common Modal and Alert Dialog Handlers

*** Variables ***
${MODAL.CONTAINER}                            xpath=//div[contains(@class,'modal-dialog') or contains(@class,'ant-modal')]
${MODAL.TITLE}                                xpath=//div[contains(@class,'modal-title') or contains(@class,'ant-modal-title')]
${MODAL.BODY_TEXT}                            xpath=//div[contains(@class,'modal-body') or contains(@class,'ant-modal-body')]
${MODAL.BTN_CONFIRM}                          xpath=//button[contains(@class,'btn-modal-confirm') or contains(text(),'ตกลง')]
${MODAL.BTN_CANCEL}                           xpath=//button[contains(@class,'btn-modal-cancel') or contains(text(),'ยกเลิก')]

*** Keywords ***
Handle Confirmation Dialog
    [Arguments]    ${action}=CONFIRM
    [Documentation]    Click confirm or cancel on popup modal
    Wait Until Element Is Visible    ${MODAL.CONTAINER}    timeout=5s
    IF    '${action}' == 'CONFIRM'
        Click Element    ${MODAL.BTN_CONFIRM}
    ELSE
        Click Element    ${MODAL.BTN_CANCEL}
    END
