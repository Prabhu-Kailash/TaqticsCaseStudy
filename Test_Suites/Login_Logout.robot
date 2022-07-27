*** Settings ***
Documentation    Test Suite for Login and Logout feature

Resource    ../Resource/PageObjects/LoginPage.robot
Resource    ../Resource/PageObjects/LogoutPage.robot
Resource    ../Resource/params.robot

Variables   ../Variables/UserCredentials.py 

Test Setup    Start    ${BROWSER}    ${URL}
Test Teardown    Stop

*** Variables ***
${BROWSER} =    headlesschrome    # Supports all browser i.e., headlesschrome, chrome, firefox etc.,
${URL} =    https://landmark.taqtics.co:3000/

*** Test Cases ***
TC1 - Site accessibility
    [Documentation]  Site Accessibility Test
    [Tags]  Smoke
    Verify Logo On Login Page

TC2 - Successful Login
    [Documentation]  Logs into the application
    [Tags]  Login   Positive
    Enter Text Into Email Field     ${LOGIN["email"]}
    Enter Text Into Password Field  ${LOGIN["password"]}
    Click Login Button
    Verify Search Field

TC3 - Invalid Email
    [Documentation]  Tries to login with invalid email
    [Tags]  Login   Negative
    Enter Text Into Email Field     ${INVALID_LOGIN["email"]}
    Verify Invalid Credentials Alert

TC4 - Valid Unregistered Email
    [Documentation]  Tries to login with valid email which isn't registered/found in DB
    [Tags]  Login   Negative
    Enter Text Into Email Field     ${UNREGISTERED_LOGIN["email"]}
    Enter Text Into Password Field  ${UNREGISTERED_LOGIN["password"]}
    Click Login Button
    Verify Not Found Email alert

TC5 - Empty Password Field
    [Documentation]  Tries to login with empty password field
    [Tags]  Login   Negative
    Enter Text Into Email Field     ${LOGIN["email"]}
    Click Login Button
    Verify Invalid Credentials Alert

TC6 - Invalid Password
    [Documentation]  Tries to login with invalid password
    [Tags]  Login   Negative
    Enter Text Into Email Field     ${LOGIN["email"]}
    Enter Text Into Password Field  ${INVALID_LOGIN["password"]}
    Click Login Button
    Verify Not Found Email alert

TC7 - Successful Logout
    [Documentation]  Logs out of the application
    [Tags]  Logout   Positive
    Enter Text Into Email Field     ${LOGIN["email"]}
    Enter Text Into Password Field  ${LOGIN["password"]}
    Click Login Button
    Verify Search Field
    Click Settings Dropdown
    Click Logout
    Verify Logo On Login Page
    