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

Locked out user can't login
    input username    ${LOCKED_OUT_USER}
    input password    ${PASSWORD}
    submit credentials
    error message should be displayed    ${USER HAS BEEN LOCKED OUT ERROR}

Problem user gets wrong item images
    input username    ${PROBLEM_USER}
    input password    ${PASSWORD}
    submit credentials
    Item images should all be photos of a dog

Performance glitch user waits longer
    input username    ${PERFORMANCE_GLITCH_USER}
    input password    ${PASSWORD}
    submit credentials
    wait until element contains    css=span.title    PRODUCTS   10 seconds
