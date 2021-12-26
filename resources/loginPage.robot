*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${LOGIN_URL}    https://www.saucedemo.com/
${CART_URL}     https://www.saucedemo.com/cart.html
${BROWSER}  Chrome
${STANDART_USER}    standard_user
${PASSWORD}    secret_sauce
${EMPTY_CART_ERROR}     Epic sadface: Your Cart is Empty
${STANDART_FIRST_NAME}      Standard
${USER_LAST_NAME}       User
${POST_CODE}    29000
${ERROR LABEL}    css=h3[data-test="error"]
${EMPTY USERNAME FIELD ERROR}    Epic sadface: Username is required

*** Keywords ***
The user is logged in
    open browser    ${LOGIN_URL}    ${BROWSER}
    input username    ${STANDART_USER}
    input password    ${PASSWORD}
    submit credentials
    welcome page should be open

the item "Sauce Labs Backpack" is added to the cart
    click button    css=[data-test="add-to-cart-sauce-labs-backpack"]

open the cart
    go to    ${CART_URL}

click the "Checkout" button
    click button    css=[data-test="checkout"]

input first name
    [Arguments]    ${FIRST_NAME}
    input text    firstName    ${FIRST_NAME}
input last name
    [Arguments]    ${LAST_NAME}
    input text    lastName    ${LAST_NAME}
input postal code
    [Arguments]    ${POSTAL_CODE}
    input text    postalCode    ${POSTAL_CODE}

click the "Continue" button
    click button    continue

click the "Finish" button
    click button    finish

click the "Cancel" button
    click button    cancel

the successful message is shown on the "CHECKOUT: COMPLETE!" page
    page should contain    THANK YOU FOR YOUR ORDER

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



