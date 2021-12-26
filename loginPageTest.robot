*** Settings ***
Documentation   Simple example
Resource    resources/loginPage.robot
Test Setup        The user is logged in
Test Teardown     close browser


*** Test Cases ***
Checkout with valid data
    [Tags]    1
    the item "Sauce Labs Backpack" is added to the cart
    open the cart
    click the "Checkout" button
    input first name    ${STANDART_FIRST_NAME}
    input last name     ${USER_LAST_NAME}
    input postal code       ${POST_CODE}
    click the "Continue" button
    click the "Finish" button
    the successful message is shown on the "CHECKOUT: COMPLETE!" page

Checkout with the empty shopping cart
    [Tags]    2
    open the cart
    click the "Checkout" button
    error message should be displayed    ${EMPTY_CART_ERROR}

Go back to shopping from the "CHECKOUT: OVERVIEW" page
    [Tags]    3
    the item "Sauce Labs Backpack" is added to the cart
    open the cart
    click the "Checkout" button
    input first name    ${STANDART_FIRST_NAME}
    input last name     ${USER_LAST_NAME}
    input postal code       ${POST_CODE}
    click the "Continue" button
    click the "Cancel" button
    welcome page should be open

