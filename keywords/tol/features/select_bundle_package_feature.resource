*** Keywords ***
Select Standalone 1P Broadband Online Channel
    [Arguments]    ${channel}=ONLINE
    [Documentation]    Configure 1P TOL internet only via online channel
    service_type_page.Verify Service Selection Page Displayed
    service_type_page.Verify Internet Service Is Mandatory And Preselected
    service_type_page.Select Sale Channel                    ${channel}
    service_type_page.Click Next Button On Service Selection

Select Convergence 2P Bundle With Mobile SIM
    [Arguments]    ${channel}=ONLINE
    [Documentation]    Configure 2POTT (Internet + TMH Mobile)
    service_type_page.Verify Service Selection Page Displayed
    service_type_page.Verify Internet Service Is Mandatory And Preselected
    service_type_page.Configure Addon Services               include_tmh=True
    service_type_page.Select Sale Channel                    ${channel}
    service_type_page.Click Next Button On Service Selection

Select Convergence 4POTT Full Play
    [Arguments]    ${channel}=ONLINE
    [Documentation]    Configure 4POTT (Internet + TMH + TrueID TV + FLP)
    service_type_page.Verify Service Selection Page Displayed
    service_type_page.Verify Internet Service Is Mandatory And Preselected
    service_type_page.Configure Addon Services               include_tmh=True    include_trueid=True    include_flp=True
    service_type_page.Select Sale Channel                    ${channel}
    service_type_page.Click Next Button On Service Selection
