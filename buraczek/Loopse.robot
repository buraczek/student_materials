*** Settings ***
Library    Collections

*** Test Cases ***
CombinationsUsingRFSyntax
    @{lowercase}=    Create list    a    b    c
    @{uppercase}=    Create list    A    B    C
    @{numbers}=    Create list    1    2    3
    # Glueing two lists together
    ${temp}=   Create combination of two lists    ${lowercase}    ${uppercase}
    ${output}=   Create combination of two lists    ${temp}    ${numbers}  
    Log list    ${output}

CombinationsUsingPython
    @{lowercase}=    Create list    a    b    c
    @{uppercase}=    Create list    A    B    C
    @{numbers}=    Create list    1    2    3
    ${output}=  Evaluate   [a+b+c for a in ${lowercase} for b in ${uppercase} for c in ${numbers}]
    Log list    ${output}   
    

*** Keywords ***
Apend Prefix to every item on the list
    [Arguments]    ${prefix}   ${list}
    @{output}=    Create List   @{EMPTY} 
    : FOR    ${item}    IN    @{list}
    \    Log    ${item}
    \    Append to List  ${output}    ${prefix}${item}
    [Return]    ${output}
      
Create combination of two lists
    [Arguments]    ${list1}     ${list2}
    @{output}=    Create List   @{EMPTY}
    : FOR    ${item}    IN    @{list1}
    \    ${tmp}=   Apend Prefix to every item on the list    ${item}    ${list2}
    \    Append to list    ${output}    @{tmp}
    [Return]    ${output}
    
