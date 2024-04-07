*** Settings ***
Library    SeleniumLibrary
#Test Timeout        1 seconds
*** Variables ***
${BROWSER}      chrome

*** Keywords ***

Open Website
    Open Browser        about:blank   ${BROWSER}
    Maximize Browser Window

Close Website
    Capture Page Screenshot
    Close Browser
    
Simulate waiting for a test
    [Arguments]     ${TIME}
    Sleep           ${TIME}
