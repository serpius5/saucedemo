*** Settings ***
Documentation   Simple example
Resource    resources/checkoutPage.robot
Test Setup        user is logged in
Test Teardown     close browser


*** Test Cases ***
Checkout with valid data
    item "Sauce Labs Backpack" is added to the cart
    open cart
    click "Checkout" button
    input first name        ${USER_FIRST_NAME}
    input last name         ${USER_LAST_NAME}
    input postal code       ${POSTAL_CODE}
    click "Continue" button
    click "Finish" button
    successful message is shown on the "CHECKOUT: COMPLETE!" page

Checkout with empty the "Last Name" field in the "CHECKOUT: YOUR INFORMATION" form
    item "Sauce Labs Backpack" is added to the cart
    open cart
    click "Checkout" button
    input first name        ${USER_FIRST_NAME}
    input postal code       ${POSTAL_CODE}
    click "Continue" button
    message "Error: Last Name is required" is shown


Go back to shopping from the "CHECKOUT: OVERVIEW" page
    item "Sauce Labs Backpack" is added to the cart
    open cart
    click "Checkout" button
    input first name        ${USER_FIRST_NAME}
    input last name      ${USER_LAST_NAME}
    input postal code       ${POSTAL_CODE}
    click "Continue" button
    click "Cancel" button
    products page should be shown








