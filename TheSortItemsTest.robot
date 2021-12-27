*** Settings ***
Library    SeleniumLibrary
Resource    resources/SortItems.robot


Suite Setup      Login to system
Suite Teardown    close browser


*** Test Cases ***
Sort items by name from Z to A
    click element     ${SORT_DROPDOWN_LIST}
    Select sorting to    ${NAME_Z_TO_A}
    Verify that items will be displayed in sort by price Name (Z to A)

Sort items by price from low to high
    click element     ${SORT_DROPDOWN_LIST}
    Select sorting to    ${PRICE_LOW_TO_HIGH}
    Verify that items will be displayed in sort by price from low to high

Sort items by price from high to low
    click element     ${SORT_DROPDOWN_LIST}
    Select sorting to    ${PRICE_HIGH_TO_LOW}
    Verify that items will be displayed in sort by price from high to low
