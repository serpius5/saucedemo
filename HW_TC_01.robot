*** Settings ***
Library     RequestsLibrary
Library     Collections

*** Variables ***
${BASE_URL}     https://reqres.in/api
${ENDPOINT}     /users
${PARAM}        2
${REGISTER_ENDPOINT}        /register
${UPDATE_ENDPOINT}  /users/2

*** Test Cases ***
Verify GET USER request
    [Tags]    1
    Create Session    test_session      ${BASE_URL}
    ${RESPONSE}     get on session    test_session      ${ENDPOINT}     ${PARAM}

    ${BODY}     convert to string    ${response.content}
    log to console    ${BODY}
    should contain      ${BODY}    janet.weaver@reqres.in
    ${STATUS_CODE}      convert to string    ${RESPONSE.status_code}
    log to console    ${STATUS_CODE}
    should be equal    ${STATUS_CODE}       200
    ${HEADER}       get from dictionary    ${RESPONSE.headers}   Connection
    log to console    ${HEADER}
    should be equal    ${HEADER}    keep-alive


Verify POST Register request
    [Tags]    2
    ${REQUEST_BODY}     create dictionary        email=eve.holt@reqres.in    password=pistol
    ${HEADER}       create dictionary       Content-Type=application/json
    create session    test_ses  ${BASE_URL}
    ${RESPONSE}     post on session    test_ses     ${REGISTER_ENDPOINT}    json=${REQUEST_BODY}    headers=${HEADER}

    ${STATUS_CODE}      convert to string    ${RESPONSE.status_code}
    log to console    ${STATUS_CODE}
    should be equal    ${STATUS_CODE}   200
    ${HEADER}   get from dictionary    ${RESPONSE.headers}      Server
    log to console    ${HEADER}
    should be equal    ${HEADER}    cloudflare
    ${BODY}     convert to string    ${RESPONSE.content}
    log to console    ${BODY}
    should contain    ${BODY}   QpwL5tke4Pnpja7X4

Verify PUT Update request
    [Tags]    3
    ${REQUEST_BODY}     create dictionary    name=morpheus  job=zion resident
    ${HEADER}       create dictionary       Content-Type=application/json
    create session    test_ses2     ${BASE_URL}
    ${RESPONSE}     put on session    test_ses2     ${UPDATE_ENDPOINT}  json=${REQUEST_BODY}    headers=${HEADER}

    ${STATUS_CODE}      convert to string    ${RESPONSE.status_code}
    log to console    ${STATUS_CODE}
    should be equal    ${STATUS_CODE}   200
    ${HEADER}   get from dictionary    ${RESPONSE.headers}      Connection
    log to console    ${HEADER}
    should be equal    ${HEADER}    keep-alive
    ${BODY}     convert to string    ${RESPONSE.content}
    log to console    ${BODY}
    should contain    ${BODY}   morpheus
