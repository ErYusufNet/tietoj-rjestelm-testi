*** Settings ***
Documentation    Functional UI tests for OrangeHRM PIM.
Resource          ../resources/pages/login_page.robot
Resource          ../resources/pages/pim_page.robot
Test Setup        Open Browser    ${BASE_URL}    chrome
Test Teardown     Close All Browsers

*** Variables ***
${BASE_URL}       https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${TEST_USERNAME}  admin
${TEST_PASSWORD}  admin123

*** Test Cases ***
Create Employee With Unique Details
    [Documentation]    Create an employee and verify the saved details.
    [Tags]    TC-005    PIM    Regression    Positive

    ${unique_suffix}=    Evaluate    uuid.uuid4().hex[:8].upper()    modules=uuid

    ${first_name}=       Set Variable    QA
    ${middle_name}=      Set Variable    Automation
    ${last_name}=        Set Variable    TC005${unique_suffix}

    Log In With Credentials    ${TEST_USERNAME}    ${TEST_PASSWORD}
    Open PIM Module
    Click Add Employee Button
    Fill Employee Details    ${first_name}    ${middle_name}    ${last_name}
    Save Employee
    Employee Details Should Match    ${first_name}    ${middle_name}    ${last_name}
Required Employee Fields Are Validated When Left Blank
    [Documentation]    Create an employee without any information and verify the required-field messages.
    [Tags]    TC-006    PIM    Regression    Validation

    Log In With Credentials    ${TEST_USERNAME}    ${TEST_PASSWORD}
    Open PIM Module
    Click Add Employee Button
    Save Employee
    Required Messages Should Be Visible
