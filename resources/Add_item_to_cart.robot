*** Settings ***
Library    SeleniumLibrary
Resource   loginPage.robot

*** Variables ***
${ADD_TO_CART_ONSIE}    css=button[id="add-to-cart-sauce-labs-onesie"]
${SHOPPING_CART_BEDGE}  css=span[class="shopping_cart_badge"]
${SHOPPING_CART}    css=a[class="shopping_cart_link"]
${INVENTORY_ITEM}   css=div[class="inventory_item_name"]
${INVENTORY_ITEM_BACKPACK}    //*[@id="item_4_title_link"]/div
${INVENTORY_ITEM_JACKET}    //*[@id="item_5_title_link"]/div
${SAUCE_LABS_ONESIE}    Sauce Labs Onesie
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


