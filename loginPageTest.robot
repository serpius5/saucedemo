*** Settings ***
Documentation   Simple example
Resource    resources/loginPage.robot
Test Setup        open browser to login page
Test Teardown     close browser


*** Test Cases ***

Valid Login
    input username    ${STANDART_USER}
    input password    ${PASSWORD}
    submit credentials
    welcome page should be open

User can't login with empty fields
    submit credentials
    error message should be displayed    ${EMPTY USERNAME FIELD ERROR}

User can't login with empty password field
    input username    ${STANDART_USER}
    submit credentials
    error message should be displayed    ${EMPTY PASSWORD FIELD ERROR}

User can't login with invalid user password data
    input username    ${STANDART_USER}
    input password    ${INVALID_PASWORD}
    submit credentials
    error message should be displayed    ${USERNAME PASSWORD MISMATCH ERROR}

Login when locked out user
    input username    ${locked_user}
    input password    ${password}
    submit credentials
    error message should be displayed    ${LOCKED_USER_ERROR_MESSAGE}

Login with problem user
    input username  ${problem_user}
    input password  ${PASSWORD}
    submit credentials
    open page with problem image    ${IMG_PROBLEM}

Delay in authorization with perfomance glitch user
    input username  ${PERFOMANCE_GLITCH_USER}
    input password  ${PASSWORD}
    submit credentials
    welcome page should be open
