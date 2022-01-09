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

Add one item from products list to cart
    click button    ${ADD_TO_CART_ONSIE}
    element should contain    ${SHOPPING_CART_BEDGE}    1
    click element    ${CART}
    element should contain    ${INVENTORY_ITEM}    ${ONESIE}

Add one item from product page to cart
    click element    ${SAUCE_LABS_BIKE_LIGHT}
    location should be    ${BIKE_LIGHT_PAGE}
    click element    ${ADD_TO_CART_BIKE_LIGHT}
    element should contain    ${SHOPPING_CART_BEDGE}    1
    click element    ${CART}
    element should contain    ${INVENTORY_ITEM}    ${SAUCE_LABS_BIKE_LIGHT_NAME}

Add two items from products list to cart
    click button    ${ADD_TO_CART_BACKPACK}
    element should contain    ${SHOPPING_CART_BEDGE}    1
    click button    ${ADD_TO_CART_JACKET}
    element should contain    ${SHOPPING_CART_BEDGE}    2
    click element    ${CART}
    element should contain    ${INVENTORY_ITEM_BACKPACK}    ${BACKPACK}
    element should contain    ${INVENTORY_ITEM_JACKET}  ${JACKET}




