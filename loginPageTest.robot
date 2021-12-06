*** Settings ***
Documentation   Simple example
Resource    resources/loginPage.robot
Test Setup        open browser to login page
Test Teardown     close browser


*** Test Cases ***

Valid Login
    [Tags]    1
    input username    ${STANDART_USER}
    input password    ${PASSWORD}
    submit credentials
    welcome page should be open

User can't login with empty fields
    [Tags]    2
    submit credentials
    error message should be displayed    ${EMPTY USERNAME FIELD ERROR}

User can't login with empty password field
    [Tags]    3
    input username    ${STANDART_USER}
    submit credentials
    error message should be displayed    ${EMPTY PASSWORD FIELD ERROR}

User can't login with invalid user password data
    [Tags]    4
    input username    ${STANDART_USER}
    input password    ${INVALID_PASWORD}
    submit credentials
    error message should be displayed    ${USERNAME PASSWORD MISMATCH ERROR}

User can't login with locked out username
    [Tags]    5
    input username    ${LOCKED_OUT_USER}
    input password    ${PASSWORD}
    submit credentials
    error message should be displayed    ${USER LOCKED OUT ERROR}

Problem User Login
    [Tags]    6
    input username    ${PROBLEM_USER}
    input password    ${PASSWORD}
    submit credentials
    welcome page should be open
    item's image should be

Performance User Login
    [Tags]    7
    input username    ${PERFORMANCE_USER}
    input password    ${PASSWORD}
    submit credentials
    wait until element contains    css=span.title  PRODUCTS    timeout=20