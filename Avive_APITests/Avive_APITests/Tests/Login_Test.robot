*** Settings ***
Resource    ../Resources/Login.robot

*** Test Cases ***
Authenticate session
    #login with valid user
    Authenticate User

Invalid Login
    [Template]    Invalid User
    
    #test scenario, username, pasword, expected response-code
    Invalid username and valid password    abc@citrus.com    1f3aEF4c1qw    401
    Valid username and invalid password    joe@citrus.com    23jhjk$#1qw    401
    Empty username and valid password    ${EMPTY}    1f3aEF4c1qw    400     
    Valid username and empty password    "joe@citrus.com"    ${EMPTY}    400
    Empty username and empty password    ${EMPTY}    ${EMPTY}    400

    
    

    