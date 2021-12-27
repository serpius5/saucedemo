*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/loginPage.robot

*** Variables ***

${SORT_DROPDOWN_LIST}      //select[@class="product_sort_container"]
${PRICE_LOW_TO_HIGH}    //option[text()="Price (low to high)"]
${PRICE_HIGH_TO_LOW}    //option[text()="Price (high to low)"]
${NAME_Z_TO_A}  //option[text()="Name (Z to A)"]
${FIRST_ITEM}    //div[@class="inventory_item"][1]
${LAST_ITEM}    //div[@class="inventory_item"][last()]
${PRICE_ITEM}    //div[@class="inventory_item_price"]
${NAME_ITEM}    //div[@class="inventory_item_name"]
${ACTIVE_OPTION_SORT_ITEM}    //span[@class="active_option"]

*** Keywords ***
Login to system
    open browser    ${LOGIN URL}    ${BROWSER}
    input text    user-name   ${STANDART_USER}
    input text    password      ${PASSWORD}
    click button    login-button


Select sorting to
    [Arguments]    ${option_sort}
    wait until page contains element   ${option_sort}
    click element    ${option_sort}


Verify that items will be displayed in sort by price Name (Z to A)
    element text should be    ${ACTIVE_OPTION_SORT_ITEM}   NAME (Z TO A)
    element text should be    ${FIRST_ITEM}${NAME_ITEM}      Test.allTheThings() T-Shirt (Red)
    element text should be   ${LAST_ITEM}${NAME_ITEM}      Sauce Labs Backpack


Verify that items will be displayed in sort by price from low to high
    element text should be    ${ACTIVE_OPTION_SORT_ITEM}    PRICE (LOW TO HIGH)
    element text should be    ${FIRST_ITEM}${PRICE_ITEM}      $7.99
    element text should be   ${LAST_ITEM}${PRICE_ITEM}    $49.99


Verify that items will be displayed in sort by price from high to low
    element text should be    ${ACTIVE_OPTION_SORT_ITEM}    PRICE (HIGH TO LOW)
    element text should be    ${FIRST_ITEM}${PRICE_ITEM}      $49.99
    element text should be   ${LAST_ITEM}${PRICE_ITEM}    $7.99

