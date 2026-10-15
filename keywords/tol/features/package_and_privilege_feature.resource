*** Keywords ***
Select Package With General Public Privilege
    [Arguments]    ${media_tech}    ${offer_code}    ${waive_entry_fee}=True
    [Documentation]    Apply general public rate, filter package by technology, and choose offer
    privilege_page.Select Privilege Category                GENERAL
    privilege_page.Click Next Button On Privilege Page
    package_selection_page.Filter Package By Media Technology       ${media_tech}
    package_selection_page.Select Broadband Package By Offer Code   ${offer_code}
    package_selection_page.Configure Entry Fee Option               waive_fee=${waive_entry_fee}
    package_selection_page.Click Next Button On Package Selection

Select Package With TrueMove H FMC Privilege
    [Arguments]    ${fmc_mobile}    ${media_tech}    ${offer_code}    ${waive_entry_fee}=True
    [Documentation]    Apply FMC subscriber discount, select package, and configure entry fee
    privilege_page.Apply TrueMove H FMC Benefit             ${fmc_mobile}
    privilege_page.Click Next Button On Privilege Page
    package_selection_page.Filter Package By Media Technology       ${media_tech}
    package_selection_page.Select Broadband Package By Offer Code   ${offer_code}
    package_selection_page.Configure Entry Fee Option               waive_fee=${waive_entry_fee}
    package_selection_page.Click Next Button On Package Selection

Select Package With CP Employee Welfare
    [Arguments]    ${employee_id}    ${media_tech}    ${offer_code}
    [Documentation]    Apply corporate staff discount and choose package
    privilege_page.Select Privilege Category                CP_EMPLOYEE
    privilege_page.Apply Employee Or Friends Promo Code     ${employee_id}
    privilege_page.Click Next Button On Privilege Page
    package_selection_page.Filter Package By Media Technology       ${media_tech}
    package_selection_page.Select Broadband Package By Offer Code   ${offer_code}
    package_selection_page.Configure Entry Fee Option               waive_fee=True
    package_selection_page.Click Next Button On Package Selection
