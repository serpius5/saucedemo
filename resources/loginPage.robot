*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN URL}    https://www.saucedemo.com/
${BROWSER}  Chrome
${PRODUCTS_PAGE_URL}    https://www.saucedemo.com/inventory.html
${ERROR LABEL}    css=h3[data-test="error"]
${EMPTY USERNAME FIELD ERROR}    Epic sadface: Username is required
${EMPTY PASSWORD FIELD ERROR}    Epic sadface: Password is required
${USERNAME PASSWORD MISMATCH ERROR}    Epic sadface: Username and password do not match any user in this service
${ERROR_USER_LOCKED_OUT}    Epic sadface: Sorry, this user has been locked out.
${STANDART_USER}    standard_user
${INVALID_USER}    invalid_user
${LOCKED_OUT_USER}  locked_out_user
${PERFORMANCE_GLITCH_USER}  performance_glitch_user
${PROBLEM_USER}     problem_user
${PASSWORD}    secret_sauce
${INVALID_PASWORD}    invalid_sauce


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

Wait for the page with the products to load
    Wait Until Location Is  ${PRODUCTS_PAGE_URL}


Page with not the appropriate image of the product should be open
    title should be      Swag Labs
    Page Should Contain Image    //img[@src="/static/media/sl-404.168b1cce.jpg"]

Close browser
    close all browsers

Error message should be displayed
    [Arguments]    ${ERROR TEXT}
    element text should be    ${ERROR LABEL}    ${ERROR TEXT}

