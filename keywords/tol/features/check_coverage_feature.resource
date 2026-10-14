*** Settings ***
Documentation       Feature-level business flows for SGIS Coverage Verification
Resource            ../pages/gis_coverage_page.resource

*** Keywords ***
Verify And Confirm Green Coverage Feasibility
    [Arguments]    ${search_address}
    [Documentation]    E2E flow: Search address, verify green coverage, confirm and advance
    gis_coverage_page.Verify GIS Webview Displayed
    gis_coverage_page.Search Installation Address         ${search_address}
    gis_coverage_page.Confirm Geolocation Pin
    gis_coverage_page.Verify Coverage Tier Status         GREEN
    gis_coverage_page.Click Register Service Button

Verify Yellow Coverage And Approve Over Cable Fee
    [Arguments]    ${search_address}    ${house_type}=PRIVATE
    [Documentation]    E2E flow: Search address, handle yellow over-cable tier, approve fee and advance
    gis_coverage_page.Verify GIS Webview Displayed
    gis_coverage_page.Search Installation Address         ${search_address}
    gis_coverage_page.Confirm Geolocation Pin
    gis_coverage_page.Verify Coverage Tier Status         YELLOW
    gis_coverage_page.Select House Type For Over Cable    ${house_type}
    gis_coverage_page.Click Register Service Button

Verify Red Coverage Enrolls In Waiting List
    [Arguments]    ${search_address}
    [Documentation]    E2E flow: Search address, verify red unserviceable status, enroll in waiting list
    gis_coverage_page.Verify GIS Webview Displayed
    gis_coverage_page.Search Installation Address         ${search_address}
    gis_coverage_page.Confirm Geolocation Pin
    gis_coverage_page.Verify Coverage Tier Status         RED
