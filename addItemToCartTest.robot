*** Settings ***
Documentation   Simple example
Resource    resources/addItemToCart.robot
Resource    resources/loginPage.robot
Test Setup    The user is logged in and open to inventory page
Test Teardown   Close browser


*** Test Cases ***
Adding an item to the cart after sorting items by price (low to high)
    [Tags]    1
    sorting items    ${SORT_LOW_HIDH}
    add item to the cart    ${ADD_ONESIE}
    element should contain      ${CART}     1
    open the cart
    element should contain  ${CART_LIST}  ${ONESIE}

Adding two items to cart after sorting items by name(Z to A)
    [Tags]    2
    sorting items    ${SORT_Z_A}
    add item to the cart    ${ADD_JACKET}
    element should contain      ${CART}     1
    add item to the cart    ${ADD_THSIRT}
    element should contain      ${CART}     2
    open the cart
    element should contain  ${CART_LIST}  ${JACKET}
    element should contain  ${CART_LIST}  ${TSHIRT}

Re-adding the same product to the cart after removing it
    [Tags]    3
    add item to the cart    ${ADD_ONESIE}
    element should contain      ${CART}     1
    remove item from the cart    ${REMOVE_ONESIE}
    element should not contain     ${CART}     1
    add item to the cart    ${ADD_ONESIE}
    element should contain      ${CART}     1
    open the cart
    element should contain  ${CART_LIST}  ${ONESIE}

