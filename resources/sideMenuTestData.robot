*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}    https://www.saucedemo.com/
${BROWSER}  Chrome
${STANDARD_LOGIN}    standard_user
${PROBLEM_LOGIN}    problem_user
${PASSWORD}    secret_sauce
${ABOUT_LINK}    xpath://a[text()='About']
${LOGOUT_LINK}    xpath://a[text()='Logout']

*** Keywords ***
open browser to login page
    open browser    ${LOGIN_URL}    ${BROWSER}
    title should be    Swag Labs

input username
    [Arguments]    ${USER_NAME}
    input text    user-name    ${USER_NAME}

input password
    input text  password    ${PASSWORD}

submit credentials
    click button    login-button

inventory page should be opened
    title should be    Swag Labs

click the left hamburger menu icon
    click button    react-burger-menu-btn

click the ABOUT link
    click link    ${ABOUT_LINK}

check if the official page opened
    title should be    Cross Browser Testing, Selenium Testing, Mobile Testing | Sauce Labs

click the LOGOUT link
    click link    ${LOGOUT_LINK}

check if the user is logged out
    page should contain button    login-button

check if the page containe error message
    title should be    Error 404 | Sauce Labs

wait until page contains ABOUT link
    wait until page contains element    ${ABOUT_LINK}

wait until page contains LOGOUT link
    wait until page contains element    ${LOGOUT_LINK}

wait until page contains LOGIN button
    wait until page contains element    login-button

