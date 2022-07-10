*** Settings ***
Resource    ../Resources/Login.robot
Resource    ../Resources/Aed.robot

Suite Setup     Run Keywords
...             Authenticate User

*** Test Cases ***

Get AEDs of an organization
    [Template]   Get the AEDs of an organization
    #scenario, organization-id, expected response-status
    Valid Organization-Id    1    200
    Valid Organization-Id    2    200
    Wrong Organization-Id    100    404
    Empty Organization-Id    ${EMPTY}    400

Get an AED
    [Template]   Get an AED
    #scenario, organization-id, AED-id, expected response-status
    Valid organization-Id and valid AED-id    1    1    200
    Valid organization-Id and invalid AED-id    1    2    404
    Valid organization-Id and empty AED-id    1    ${EMPTY}    400
    Empty organization-Id and empty AED-id    ${EMPTY}    1    400