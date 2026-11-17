*** Settings ***
Documentation    Page Object resource for OrangeHRM PIM page interactions.
Library    SeleniumLibrary

*** Variables ***
${PIM_MENU_LINK}          xpath://a[.//span[normalize-space()="PIM"]]
${PIM_PAGE_HEADER}        xpath://h6[normalize-space()="PIM"]
${ADD_EMPLOYEE_BUTTON}    xpath://button[contains(@class,"oxd-button--secondary") and normalize-space(.)="Add"]
${ADD_EMPLOYEE_HEADER}    xpath://h6[normalize-space(.)="Add Employee"]

${FIRST_NAME_INPUT}       css:input[name="firstName"]
${MIDDLE_NAME_INPUT}      css:input[name="middleName"]
${LAST_NAME_INPUT}        css:input[name="lastName"]

${SAVE_BUTTON}            xpath://button[@type="submit" and normalize-space(.)="Save"]

*** Keywords ***
Open PIM Module
    [Documentation]    Open the PIM module and verify its page header.
    Wait Until Element Is Visible    ${PIM_MENU_LINK}    timeout=20s
    Click Element    ${PIM_MENU_LINK}
    Wait Until Element Is Visible    ${PIM_PAGE_HEADER}    timeout=20s

Click Add Employee Button
    [Documentation]    Open the Add Employee form.
    Wait Until Element Is Visible    ${ADD_EMPLOYEE_BUTTON}    timeout=20s
    Click Element    ${ADD_EMPLOYEE_BUTTON}
    Wait Until Element Is Visible    ${ADD_EMPLOYEE_HEADER}    timeout=20s

Fill Employee Details
    [Arguments]    ${first_name}    ${middle_name}    ${last_name}
    [Documentation]    Fill the employee first, middle, and last names.
    Wait Until Element Is Visible    ${FIRST_NAME_INPUT}    timeout=20s
    Input Text    ${FIRST_NAME_INPUT}     ${first_name}
    Input Text    ${MIDDLE_NAME_INPUT}    ${middle_name}
    Input Text    ${LAST_NAME_INPUT}      ${last_name}


Save Employee
    [Documentation]    Save the employee record.
    Click Button    ${SAVE_BUTTON}

Employee Details Should Match
    [Arguments]    ${first_name}    ${middle_name}    ${last_name}
    [Documentation]    Verify the saved employee details.
    Wait Until Element Is Visible    ${FIRST_NAME_INPUT}    timeout=20s
    Textfield Value Should Be    ${FIRST_NAME_INPUT}     ${first_name}
    Textfield Value Should Be    ${MIDDLE_NAME_INPUT}    ${middle_name}
    Textfield Value Should Be    ${LAST_NAME_INPUT}      ${last_name}
