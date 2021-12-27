*** Settings ***
Documentation   Simple example
Resource    resources/Add_item_to_cart.robot
Test Setup    open browser to inventory page
Test Teardown    close browser

*** Test Cases ***
Add one item from products list to cart
    click button    ${ADD_TO_CART_ONSIE}
    element should contain    ${SHOPPING_CART_BEDGE}    1
    click element    ${SHOPPING_CART}
    element should contain    ${INVENTORY_ITEM}    ${SAUCE_LABS_ONESIE}

Add one item from product page to cart
    click element    ${SAUCE_LABS_BIKE_LIGHT}
    location should be    ${BIKE_LIGHT_PAGE}
    click element    ${ADD_TO_CART_BIKE_LIGHT}
    element should contain    ${SHOPPING_CART_BEDGE}    1
    click element    ${SHOPPING_CART}
    element should contain    ${INVENTORY_ITEM}    ${SAUCE_LABS_BIKE_LIGHT_NAME}

Add two items from products list to cart
    click button    ${ADD_TO_CART_BACKPACK}
    element should contain    ${SHOPPING_CART_BEDGE}    1
    click button    ${ADD_TO_CART_JACKET}
    element should contain    ${SHOPPING_CART_BEDGE}    2
    click element    ${SHOPPING_CART}
    element should contain    ${INVENTORY_ITEM_BACKPACK}    ${BACKPACK}
    element should contain    ${INVENTORY_ITEM_JACKET}  ${JACKET}




