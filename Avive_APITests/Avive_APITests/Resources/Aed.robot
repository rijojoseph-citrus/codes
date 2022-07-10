*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections
Library    JSONLibrary
Resource    Login.robot
*** Variables ***
${AED-API}    api/aed

*** Keywords ***
Get the AEDs of an organization
    [Arguments]    ${scenario}    ${orgId}    ${expectedStatus}

    ${param}=   Create Dictionary  org_id=${orgId}
    ${response}=    GET  ${URL}/${AED-API}  params=${param}  cookies=${respCookies}    expected_status=${expectedStatus}
    ${actualStatus}=    Convert To String    ${response.status_code}
    Should Be Equal    ${actualStatus}    ${expectedStatus}

Get an AED
    [Arguments]    ${scenario}    ${org-Id}    ${aed-Id}    ${expectedStatus}
    
    ${param}=   Create Dictionary  org_id=${org-Id}
    ${response}=    GET  ${URL}/${AED-API}/${aed-Id}   params=${param}  cookies=${respCookies}    expected_status=${expectedStatus}
    ${actualStatus}=    Convert To String    ${response.status_code}
    Should Be Equal    ${actualStatus}    ${expectedStatus}