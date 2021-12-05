*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN URL}    https://www.saucedemo.com/
${BROWSER}  Chrome
${ERROR LABEL}    css=h3[data-test="error"]
${EMPTY USERNAME FIELD ERROR}    Epic sadface: Username is required
${EMPTY PASSWORD FIELD ERROR}    Epic sadface: Password is required
${USERNAME PASSWORD MISMATCH ERROR}    Epic sadface: Username and password do not match any user in this service
${STANDART_USER}    standard_user
${INVALID_USER}    invalid_user
${PASSWORD}    secret_sauce
${INVALID_PASWORD}    invalid_sauce
${LOCKED_USER}      locked_out_user
${LOCKED_USER_ERROR_MESSAGE}    Epic sadface: Sorry, this user has been locked out.
${PROBLEM_USER}     problem_user
${PERFOMANCE_GLITCH_USER}   performance_glitch_user
${IMG_PROBLEM}        static/media/sl-404.168b1cce.jpg


*** Keywords ***
open browser to login page
    open browser    ${LOGIN URL}    ${BROWSER}
    title should be      Swag Labs

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

Error message should be displayed
    [Arguments]    ${ERROR TEXT}
    element text should be    ${ERROR LABEL}    ${ERROR TEXT}

