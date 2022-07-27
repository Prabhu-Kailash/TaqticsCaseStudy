*** Settings ***
Documentation    Contains all the Login Web Elements/Objects
Library    SeleniumLibrary

*** Keywords ***
Enter Text Into Email Field
    [Documentation]     Enters text into email field on login page
    [Arguments]    ${input_text}
    Input Text    id:email    ${input_text}

Enter Text Into Password Field
    [Documentation]     Enters text into password field on login page
    [Arguments]    ${input_text}
    Input Text    id:password    ${input_text}

Click Login Button
    [Documentation]     Clicks login button
    Click Button    tag:button
    Sleep   2

Verify Logo On Login Page
    [Documentation]     Verifies if logo is found on login page
    Page Should Contain Image   /static/media/authLogo.c88a7b32.svg

Verify Invalid Credentials Alert
    [Documentation]     Verifies ivalid email alert notification
    Page Should Contain Element     class:ant-form-item-explain-error

Verify Not Found Email alert
    [Documentation]     Verifies Un-Registered email alert notification
    Wait Until Element Is Visible     css:.ant-message-notice-content      timeout=10