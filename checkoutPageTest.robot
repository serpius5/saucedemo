*** Settings ***
Documentation   Simple example
Resource    resources/checkoutPage.robot
Test Setup        user is logged in
Test Teardown     close browser


*** Test Cases ***
Checkout with valid data
    add item "Sauce Labs Backpack" to the cart
    open cart
    click "Checkout" button
    input first name        ${USER_FIRST_NAME}
    input last name         ${USER_LAST_NAME}
    input postal code       ${POSTAL_CODE}
    click "Continue" button
    click "Finish" button
    successful message is shown on the "CHECKOUT: COMPLETE!" page

Checkout with empty "Last Name" field in the "CHECKOUT: YOUR INFORMATION" form
    add item "Sauce Labs Backpack" to the cart
    open cart
    click "Checkout" button
    input first name        ${USER_FIRST_NAME}
    input postal code       ${POSTAL_CODE}
    click "Continue" button
    message "Error: Last Name is required" is shown


Go back to shopping from the "CHECKOUT: OVERVIEW" page
    add item "Sauce Labs Backpack" to the cart
    open cart
    click "Checkout" button
    input first name        ${USER_FIRST_NAME}
    input last name      ${USER_LAST_NAME}
    input postal code       ${POSTAL_CODE}
    click "Continue" button
    click "Cancel" button
    products page should be shown








