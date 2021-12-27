*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN URL}    https://www.saucedemo.com/
${BROWSER}  Chrome
${STANDART_USER}    standard_user
${PASSWORD}    secret_sauce
${TWITTER_URL}    https://twitter.com/saucelabs
${FACEBOOK_URL}    https://www.facebook.com/saucelabs
${LINKEDIN_URL}    https://www.linkedin.com/company/sauce-labs/

*** Keywords ***


Click Twitter button
    click link    ${TWITTER_URL}

Click Facebook button
    click link    ${FACEBOOK_URL}

Click Linkedin Button
     click link    ${LINKEDIN_URL}
