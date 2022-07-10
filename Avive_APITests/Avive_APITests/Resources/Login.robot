*** Settings ***
Documentation  API TEST SAMPLE
Library    RequestsLibrary  
Library    Collections  
Library    JSONLibrary
Library    String

*** Variables ***
${URL}  https://devlabmgtbe.avivefuture.com 
${USERNAME}  joe@citrus.com
${PASSWORD}  1f3aEF4c1qw
${API}  api
&{HEADER}  content-type=application/json
${SUCCESS}  200
${AUTH-SESSION}
${respCookies}

*** Keywords ***

Login
    [Arguments]    ${username}    ${password}    ${expectedStatus}
    ${payload}=    Create Dictionary  email=${USERNAME}    password=${password}
    Create Session    LoginSession    url=${URL}  headers=${HEADER}  verify=true
    ${response}=  POST On Session    LoginSession    ${API}/login/    json=${payload}  expected_status=${expectedStatus}
    [Return]    ${response}
Authenticate User    
    ${response}=    Login   ${USERNAME}    ${PASSWORD}    200
    ${csrftoken}   Get From Dictionary    ${response.cookies}    csrftoken
    ${sessionid}   Get From Dictionary    ${response.cookies}    sessionid
    ${respCookies} =    Create Dictionary     csrftoken=${csrftoken}   sessionid=${sessionid}
    Set Suite Variable    ${respCookies}
Invalid User
    [Arguments]    ${scenario}    ${user}    ${pwd}    ${expectedStatus}
    ${response}=    Login   ${user}    ${pwd}    ${expectedStatus}
    
    
    
