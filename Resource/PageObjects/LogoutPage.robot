*** Settings ***
Documentation    Contains all the Logout Web Elements/Objects
Library    SeleniumLibrary

*** Keywords ***
Verify Search Field
    [Documentation]     Verifies if Search field is accessible
    Page Should Contain Textfield     class:ant-input

Click Settings Dropdown
    [Documentation]     Enables dropdown which consist logout/profile option
    Click Element    class:ant-dropdown-trigger

Click Logout
    [Documentation]     Clicks Logout option
    Click Element    xPath://li[@class="ant-dropdown-menu-item"][2]
    Sleep   2