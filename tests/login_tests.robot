*** Settings ***
Documentation    Functional UI tests for OrangeHRM authentication.
Library           SeleniumLibrary
Resource          ../resources/pages/login_page.robot
Test Setup        Open Browser    ${BASE_URL}    chrome
Test Teardown     Close All Browsers

*** Variables ***
${BASE_URL}       https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${TEST_USERNAME}  admin
${TEST_PASSWORD}  admin123

*** Test Cases ***
Valid User Can Log In
    [Documentation]    Verify a valid user can log in and see the Dashboard.
    [Tags]    TC-001    Login    Smoke    Regression    Positive
    Log In With Credentials    ${TEST_USERNAME}    ${TEST_PASSWORD}

Invalid User Cannot Log In
    [Documentation]    Verify that invalid credentials are rejected.
    [Tags]    TC-002    Login    Regression    Negative
    Enter Username    invalid_user
    Enter Password    invalid_pass
    Submit Login Form
    Invalid Login Message Should Be Visible

Login Is Rejected When Required Fields Are Empty
    [Documentation]    Verify that both required-field messages appear for an empty form.
    [Tags]    TC-003    Login    Regression    Validation
    Submit Login Form
    Required Messages Should Be Visible

Logout After Successful Login
    [Documentation]    Verify that a user can log out and return to the login form.
    [Tags]    TC-004    Login    Regression    Positive
    Log In With Credentials    ${TEST_USERNAME}    ${TEST_PASSWORD}
    Logout
