*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/loginPage.robot

*** Variables ***
${CART_URL}     https://www.saucedemo.com/cart.html
${SELECT_CONTAINER}    css=[data-test="product_sort_container"]
${SORT_Z_A}      za
${SORT_LOW_HIDH}    lohi
${CART}     css=[class="shopping_cart_link"]
${CART_LIST}   css=div[class="cart_list"]
${ONESIE}   Sauce Labs Onesie
${ADD_ONESIE}    add-to-cart-sauce-labs-onesie
${REMOVE_ONESIE}    remove-sauce-labs-onesie
${JACKET}   Sauce Labs Fleece Jacket
${ADD_JACKET}   add-to-cart-sauce-labs-fleece-jacket
${TSHIRT}       Sauce Labs Bolt T-Shirt
${ADD_THSIRT}   add-to-cart-sauce-labs-bolt-t-shirt
${ADD_TO_CART_ONSIE}    css=button[id="add-to-cart-sauce-labs-onesie"]
${SHOPPING_CART_BEDGE}  css=span[class="shopping_cart_badge"]
${CART}    css=a[class="shopping_cart_link"]
${INVENTORY_ITEM}   css=div[class="inventory_item_name"]
${INVENTORY_ITEM_BACKPACK}    //*[@id="item_4_title_link"]/div
${INVENTORY_ITEM_JACKET}    //*[@id="item_5_title_link"]/div
${ONESIE}    Sauce Labs Onesie
${SAUCE_LABS_BIKE_LIGHT_NAME}    Sauce Labs Bike Light
${SAUCE_LABS_BIKE_LIGHT}    css=a[id="item_0_title_link"]
${BIKE_LIGHT_PAGE}    https://www.saucedemo.com/inventory-item.html?id=0
${ADD_TO_CART_BIKE_LIGHT}   css=button[id="add-to-cart-sauce-labs-bike-light"]
${ADD_TO_CART_BACKPACK}    css=button[id="add-to-cart-sauce-labs-backpack"]
${ADD_TO_CART_JACKET}   css=button[id="add-to-cart-sauce-labs-fleece-jacket"]
${BACKPACK}    Sauce Labs Backpack
${JACKET}   Sauce Labs Fleece Jacket

*** Keywords ***
Open browser to inventory page
    open browser    ${LOGIN URL}    ${BROWSER}
    input username    ${STANDART_USER}
    input password    ${PASSWORD}
    submit credentials
    title should be    Swag Labs

sorting items
    [Arguments]    ${SORT_BY}
    select from list by value    ${SELECT_CONTAINER}    ${SORT_BY}

add item to the cart
    [Arguments]    ${ITEM}
    click button    ${ITEM}

remove item from the cart
    [Arguments]    ${ITEM}
    click button    ${ITEM}

open the cart
    go to    ${CART_URL}