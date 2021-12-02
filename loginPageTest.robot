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


User can't login because He was blocked


    input username    ${locked_user}
    input password    ${password}
    submit credentials
    error message should be displayed    ${locked_user_error}

User logged in with problems on the page

    input username    ${PROBLEM_USER}
    input password    ${PASSWORD}
    submit credentials
    page should contain image    ${PROBLEM_USER_PICTURE}

User logged in with performance failure

    input username    ${PERFORMANCE_GLITCH_USER}
    input password    ${PASSWORD}
    submit credentials
    sleep    4
    wait until page does not contain    PRODUCTS
