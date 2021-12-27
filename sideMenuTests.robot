*** Settings ***
Documentation    HW_saucedemo
Resource    resources/sideMenuTestData.robot
Resource    resources/loginPage.robot
Test Setup    open browser to login page
Test Teardown    close browser


*** Test Cases ***
Check if the "About" button redirects to the official page
    [Tags]    SideMenu
    input username    ${STANDART_USER}
    input password    ${PASSWORD}
    submit credentials
    inventory page should be opened
    click the left hamburger menu icon
    wait until page contains ABOUT link
    click the ABOUT link
    check if the official page opened

Check if the button "Logout" signs out user
    [Tags]    SideMenu
    input username    ${STANDART_USER}
    input password    ${PASSWORD}
    submit credentials
    inventory page should be opened
    click the left hamburger menu icon
    wait until page contains LOGOUT link
    click the LOGOUT link
    wait until page contains LOGIN button
    check if the user is logged out

Check if the "About" button redirects to the page with the error message
    [Tags]    SideMenu
    input username    ${PROBLEM_USER}
    input password    ${PASSWORD}
    submit credentials
    inventory page should be opened
    click the left hamburger menu icon
    wait until page contains ABOUT link
    click the ABOUT link
    check if the page containe error message

