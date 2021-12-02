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

Login with locked out user
    input username  ${LOCKED_OUT_USER}
    input password  ${PASSWORD}
    submit credentials
    error message should be displayed    ${error_user_locked_out}

User login with glitch performance
    input username  ${PERFORMANCE_GLITCH_USER}
    input password  ${PASSWORD}
    submit credentials
    Wait for the page with the products to load
    welcome page should be open

Login with the problem user
    input username  ${problem_user}
    input password  ${PASSWORD}
    submit credentials
    Page with not the appropriate image of the product should be open
