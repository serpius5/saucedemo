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

Locked out user login
    input username    ${LOCKED_OUT_USER}
    input password    ${PASSWORD}
    submit credentials
    error message should be displayed    ${LOCKED_OUT_USER_MESSAGE}

Login with perfomance glitch user
    input username    ${PERFORMANCE_GLITCH_USER}
    input password    ${PASSWORD}
    submit credentials
    welcome page should be open

Login with problem user
    input username    ${PROBLEM_USER}
    input password    ${PASSWORD}
    submit credentials
    page with inappropriate products' images should be open
