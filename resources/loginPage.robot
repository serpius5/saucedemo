*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN URL}    https://www.saucedemo.com/
${BROWSER}  Chrome
${STANDART_USER}    standard_user
${PASSWORD}    secret_sauce
${TWITTER_URL}    https://twitter.com/saucelabs
${FACEBOOK_URL}    https://www.facebook.com/saucelabs
${LINKEDIN_URL}    https://www.linkedin.com/company/sauce-labs/

*** Keywords ***
open browser to login page
    open browser    ${LOGIN URL}    ${BROWSER}


input username
    [Arguments]    ${USER_NAME}
    input text    user-name    ${USER_NAME}

input password
    [Arguments]    ${USER_PASS}
    input text    password      ${USER_PASS}

Submit Credentials
    click button    login-button

Welcome page should be open
    title should be    Swag Labs

Close browser
    close all browsers

Click Twitter button
    click link    ${TWITTER_URL}

Click Facebook button
    click link    ${FACEBOOK_URL}

Click Linkedin Button
     click link    ${LINKEDIN_URL}


