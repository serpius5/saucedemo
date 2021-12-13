*** Settings ***
Library    JSONLibrary
Library     os
Library     RequestsLibrary
Library     Collections

*** Variables ***
${BASE_URL}     https://reqres.in/api
${ENDPOINT}     /users
${PARAM}        2
${UPDATE_ENDPOINT}  /users/4

*** Test Cases ***
Verify POST Request Create user with json from file
    [Tags]    4
    ${REQUEST_BODY}     load json from file     HW_POST_Body.json
    ${HEADER}       load json from file    HW_POST_headers.json

    create Session    session    ${BASE_URL}
    ${RESPONSE}     POST On Session         session   ${ENDPOINT}    json=${REQUEST_BODY}   headers=${HEADER}
    ${NAME}        get value from json     ${response.json()}     $.name
    log to console    ${NAME[0]}
    should be equal    ${NAME[0]}      morpheus
    ${STATUS_CODE}      convert to string    ${RESPONSE.status_code}
    log to console    ${STATUS_CODE}
    should be equal    ${STATUS_CODE}       201
    ${HEADERS}       get from dictionary    ${RESPONSE.headers}   Connection
    log to console    ${HEADERS}
    should be equal    ${HEADERS}    keep-alive

Verify PUT request Update user with json from file
    [Tags]    5
    ${REQUEST_BODY}     load json from file     HW_PUT_Body.json
    ${HEADER}       load json from file    HW_PUT_headers.json
    create session    test_ses2     ${BASE_URL}
    ${RESPONSE}     put on session    test_ses2     ${UPDATE_ENDPOINT}  json=${REQUEST_BODY}    headers=${HEADER}

    ${JOB}        get value from json     ${response.json()}     $.job
    log to console    ${JOB[0]}
    should be equal    ${JOB[0]}      teacher
    ${STATUS_CODE}      convert to string    ${RESPONSE.status_code}
    log to console    ${STATUS_CODE}
    should be equal    ${STATUS_CODE}       200
    ${HEADERS}       get from dictionary    ${RESPONSE.headers}   Connection
    log to console    ${HEADERS}
    should be equal    ${HEADERS}    keep-alive

