*** Settings ***
Library    SeleniumLibrary
Resource    loginPage.robot

*** Variables ***
${CART_URL}     https://www.saucedemo.com/cart.html
${USER_FIRST_NAME}      Standart
${USER_LAST_NAME}       User
${POSTAL_CODE}      29000
${EMPTY_CART_ERROR}     Epic sadface: Your cart is empty

*** Keywords ***
user is logged in
    open browser    ${LOGIN URL}    ${BROWSER}
    title should be      Swag Labs
    input username    ${STANDART_USER}
    input password    ${PASSWORD}
    Submit Credentials
    Welcome page should be open

open cart
    go to     ${CART_URL}

input first name
    [Arguments]    ${USER_FIRST_NAME}
    input text    firstName    ${USER_FIRST_NAME}

input last name
    [Arguments]    ${USER_LAST_NAME}
    input text    lastName    ${USER_LAST_NAME}

input postal code
    [Arguments]    ${POSTAL_CODE}
    input text    postalCode    ${POSTAL_CODE}

click "Checkout" button
    click button    css=[data-test="checkout"]

item "Sauce Labs Backpack" is added to the cart
    click button    css=[data-test="add-to-cart-sauce-labs-backpack"]

click "Continue" button
    click button    continue

click "Finish" button
    click button    finish

successful message is shown on the "CHECKOUT: COMPLETE!" page
    page should contain     THANK YOU FOR YOUR ORDER

click "Cancel" button
    click button    cancel

products page should be shown
    title should be    Swag Labs