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


*** Keywords ***
The user is logged in and open to inventory page
    open browser    ${LOGIN URL}    ${BROWSER}
    input username    ${STANDART_USER}
    input password    ${PASSWORD}
    submit credentials
    title should be      Swag Labs

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