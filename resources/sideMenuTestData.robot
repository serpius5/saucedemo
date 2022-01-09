*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ABOUT_LINK}    xpath://a[text()='About']
${LOGOUT_LINK}    xpath://a[text()='Logout']

*** Keywords ***
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

wait until page contains LOGIN button
    wait until page contains element    login-button

wait until ABOUT link is visible
    wait until element is visible    ${ABOUT_LINK}

wait until LOGOUT link is visible
    wait until element is visible    ${LOGOUT_LINK}

