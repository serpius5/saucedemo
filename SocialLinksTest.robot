*** Settings ***
Documentation   Simple example
Resource    resources/loginPage.robot
Resource    resources/SocialLinksResources.robot
Test Setup        open browser to login page
Test Teardown     close browser

*** Test Cases ***

Test Twitter link
    [Tags]    SocialLinks
    input username    ${STANDART_USER}
    input password    ${PASSWORD}
    submit credentials
    welcome page should be open
    Click Twitter button
    page should contain link    ${TWITTER_URL}


Test Facebook link
    [Tags]    SocialLinks
    input username    ${STANDART_USER}
    input password    ${PASSWORD}
    submit credentials
    welcome page should be open
    Click Facebook button
    page should contain link    ${FACEBOOK_URL}


Test Linkedin link
    [Tags]    SocialLinks
    input username    ${STANDART_USER}
    input password    ${PASSWORD}
    submit credentials
    welcome page should be open
    Click Linkedin Button
    page should contain link    ${LINKEDIN_URL}
