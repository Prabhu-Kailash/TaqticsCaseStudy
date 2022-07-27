*** Settings ***
Documentation    Contains generic actions required
Library    SeleniumLibrary

*** Keywords ***
Start
    [Documentation]     Creates instance of browser/driver
    [Arguments]    ${BROWSER}    ${URL}
    Open Browser    ${URL}    browser=${BROWSER}
    maximize browser window

Stop
    [Documentation]     Kills all instance of browser/driver
    close browser
