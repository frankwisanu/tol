*** Settings ***
Documentation       Core Common Utilities Library for TOL Automation Standard
...                 Provides centralized, highly reusable primitives to minimize code across all modules
Library             SeleniumLibrary
Library             OperatingSystem
Library             String
Library             Collections

*** Variables ***
${headless}         ${False}
${GLOBAL_TIMEOUT}   15s

*** Keywords ***
# ---------------------------------------------------------------------------
# Browser & Session Lifecycle
# ---------------------------------------------------------------------------
Open chrome browser
    [Documentation]     Launch Chrome with optimized CI/CD switches (headless toggle supported)
    [Arguments]         ${url}    ${headless_mode}=${headless}    ${alias}=None

    ${chrome_options}=  Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    BuiltIn.Call Method     ${chrome_options}    add_argument    --disable-infobars
    BuiltIn.Call Method     ${chrome_options}    add_argument    --window-size\=1920,1080
    BuiltIn.Call Method     ${chrome_options}    add_argument    --disable-dev-shm-usage
    BuiltIn.Call Method     ${chrome_options}    add_argument    --disable-gpu
    BuiltIn.Call Method     ${chrome_options}    add_argument    --no-sandbox
    BuiltIn.Call Method     ${chrome_options}    add_argument    --ignore-certificate-errors
    BuiltIn.Call Method     ${chrome_options}    add_argument    --incognito

    IF  ${headless_mode}
        BuiltIn.Call Method    ${chrome_options}    add_argument    --headless
        BuiltIn.Call Method    ${chrome_options}    add_argument    --window-size\=1920,1080
    END

    SeleniumLibrary.Create WebDriver    Chrome    alias=${alias}    options=${chrome_options}
    SeleniumLibrary.Go To               ${url}
    SeleniumLibrary.Maximize Browser Window

Default test teardown
    [Documentation]     Automatically capture screenshot on failure and close all browsers
    BuiltIn.Run keyword if test failed    SeleniumLibrary.Capture page screenshot
    SeleniumLibrary.Close all browsers

# ---------------------------------------------------------------------------
# Element Clicks & Interactions
# ---------------------------------------------------------------------------
Click element when ready
    [Arguments]    ${locator}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
    SeleniumLibrary.Click element                    ${locator}

Click element when enable
    [Arguments]    ${locator}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
    SeleniumLibrary.Wait until element is enabled    ${locator}    ${timeout}
    SeleniumLibrary.Click element                    ${locator}

Scroll element into view when ready
    [Arguments]    ${locator}    ${retry}=4    ${timeout}=${GLOBAL_TIMEOUT}
    FOR    ${i}    IN RANGE    0    ${retry}
        SeleniumLibrary.Wait until page contains element    ${locator}    ${timeout}
        SeleniumLibrary.Scroll element into view            ${locator}
        ${is_visible}=    Run keyword and return status    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
        Exit for loop if    ${is_visible}
    END

# ---------------------------------------------------------------------------
# Inputs & Clear Actions
# ---------------------------------------------------------------------------
Input text when ready
    [Arguments]    ${locator}    ${text}    ${clear}=${True}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
    SeleniumLibrary.Input text                       ${locator}    ${text}    clear=${clear}

Clear text when ready
    [Arguments]    ${locator}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
    SeleniumLibrary.Clear element text               ${locator}

# ---------------------------------------------------------------------------
# Checkboxes, Radio & Dropdowns
# ---------------------------------------------------------------------------
Select checkbox when ready
    [Arguments]    ${locator}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
    SeleniumLibrary.Select checkbox                  ${locator}

Unselect checkbox when ready
    [Arguments]    ${locator}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
    SeleniumLibrary.Unselect checkbox                ${locator}

Select radio button when ready
    [Arguments]    ${group_name}    ${value}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until page contains element    xpath=//input[@name='${group_name}' and @value='${value}']    ${timeout}
    SeleniumLibrary.Select radio button                 ${group_name}    ${value}

Select dropdown by value when ready
    [Arguments]    ${locator}    ${value}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
    SeleniumLibrary.Select from list by value        ${locator}    ${value}

Select dropdown by label when ready
    [Arguments]    ${locator}    ${label}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
    SeleniumLibrary.Select from list by label        ${locator}    ${label}

# ---------------------------------------------------------------------------
# Assertions & Verifications
# ---------------------------------------------------------------------------
Verify element is visible when ready
    [Arguments]    ${locator}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}

Verify element is not visible when ready
    [Arguments]    ${locator}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until element is not visible    ${locator}    ${timeout}

Verify text equals when ready
    [Arguments]    ${locator}    ${expected_text}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
    SeleniumLibrary.Element text should be           ${locator}    ${expected_text}

Verify text contains when ready
    [Arguments]    ${locator}    ${expected_text}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
    SeleniumLibrary.Element should contain           ${locator}    ${expected_text}

Verify element is enabled when ready
    [Arguments]    ${locator}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
    SeleniumLibrary.Wait until element is enabled    ${locator}    ${timeout}

Checkbox should be selected when ready
    [Arguments]    ${locator}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
    SeleniumLibrary.Checkbox should be selected      ${locator}

Checkbox should not be selected when ready
    [Arguments]    ${locator}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
    SeleniumLibrary.Checkbox should not be selected  ${locator}

# ---------------------------------------------------------------------------
# Getters
# ---------------------------------------------------------------------------
Get text when ready
    [Arguments]    ${locator}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
    ${text}=       SeleniumLibrary.Get text          ${locator}
    RETURN         ${text}

Get value when ready
    [Arguments]    ${locator}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
    ${value}=      SeleniumLibrary.Get value         ${locator}
    RETURN         ${value}

Get element count when ready
    [Arguments]    ${locator}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
    ${count}=      SeleniumLibrary.Get element count ${locator}
    RETURN         ${count}

Get element attribute when ready
    [Arguments]    ${locator}    ${attribute}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
    ${attr_val}=   SeleniumLibrary.Get element attribute    ${locator}    ${attribute}
    RETURN         ${attr_val}

Get css attribute form element when ready
    [Arguments]    ${locator}    ${attribute}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until element is visible    ${locator}    ${timeout}
    ${element}=    SeleniumLibrary.Get Webelement    ${locator}
    ${css_attr}=   BuiltIn.Call Method    ${element}    value_of_css_property    ${attribute}
    RETURN         ${css_attr}

# ---------------------------------------------------------------------------
# File Upload & Frame Switching
# ---------------------------------------------------------------------------
Upload file when ready
    [Arguments]    ${locator}    ${file_path}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until page contains element    ${locator}      ${timeout}
    ${file_normalize}=    OperatingSystem.Normalize path    ${file_path}
    SeleniumLibrary.Choose File                         ${locator}      ${file_normalize}

Switch to frame when ready
    [Arguments]    ${frame_locator}    ${timeout}=${GLOBAL_TIMEOUT}
    SeleniumLibrary.Wait until page contains element    ${frame_locator}    ${timeout}
    SeleniumLibrary.Select frame                        ${frame_locator}

Switch to default content
    SeleniumLibrary.Unselect frame
