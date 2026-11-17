*** Settings ***
Documentation    Page Object resource for OrangeHRM login page interactions.
Library    SeleniumLibrary

*** Variables ***
${USERNAME_INPUT}      css:input[name="username"]
${PASSWORD_INPUT}      css:input[name="password"]
${LOGIN_BUTTON}        css:button[type="submit"]
${DASHBOARD_HEADER}    xpath://h6[normalize-space()="Dashboard"]
${INVALID_MESSAGE}     css:p.oxd-alert-content-text
${REQUIRED_MESSAGES}   css:span.oxd-input-field-error-message
${MENU_BUTTON}         css:i.oxd-userdropdown-icon
${LOGOUT_BUTTON}       css:a.oxd-userdropdown-link[href="/web/index.php/auth/logout"]

*** Keywords ***
Login Form Should Be Visible
    [Documentation]    Wait for the username, password, and login controls to appear.
    Wait Until Element Is Visible    ${USERNAME_INPUT}    timeout=10s
    Wait Until Element Is Visible    ${PASSWORD_INPUT}    timeout=10s
    Wait Until Element Is Visible    ${LOGIN_BUTTON}      timeout=10s

Enter Username
    [Arguments]    ${username}
    [Documentation]    Enter a username in the login form.
    Login Form Should Be Visible
    Input Text    ${USERNAME_INPUT}    ${username}

Enter Password
    [Arguments]    ${password}
    [Documentation]    Enter a password in the login form.
    Input Password    ${PASSWORD_INPUT}    ${password}

Submit Login Form
    [Documentation]    Submit the login form after its controls are visible.
    Login Form Should Be Visible
    Click Button    ${LOGIN_BUTTON}

Dashboard Should Be Visible
    [Documentation]    Verify that the authenticated user can see the Dashboard.
    Wait Until Element Is Visible    ${DASHBOARD_HEADER}    timeout=20s

Log In With Credentials
    [Arguments]    ${username}    ${password}
    [Documentation]    Log in with supplied credentials and verify the Dashboard.
    Enter Username    ${username}
    Enter Password    ${password}
    Submit Login Form
    Dashboard Should Be Visible

Invalid Login Message Should Be Visible
    [Documentation]    Verify that the invalid-credentials message appears.
    Wait Until Element Is Visible    ${INVALID_MESSAGE}    timeout=20s

Required Messages Should Be Visible
    [Documentation]    Verify that both required-field messages appear.
    Wait Until Element Is Visible    ${REQUIRED_MESSAGES}    timeout=10s
    ${message_count}=    Get Element Count    ${REQUIRED_MESSAGES}
    Should Be Equal As Integers    ${message_count}    2

Logout
    [Documentation]    Open the user menu, log out, and verify the login form returns.
    Click Element    ${MENU_BUTTON}
    Wait Until Element Is Visible    ${LOGOUT_BUTTON}    timeout=10s
    Click Element    ${LOGOUT_BUTTON}
    Login Form Should Be Visible
