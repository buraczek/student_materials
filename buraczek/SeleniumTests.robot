*** Settings ***
Test Setup        Run Keywords    Open Browser    ${SITE1}
...               AND    Maximize Browser Window
Test Teardown     Close All Browsers
Test Template     Get to Wiki Article
Library           SeleniumLibrary
Library           String
Library           Collections
Resource          WikipediaMainPageActions.robot

*** Variables ***
${SITE1}          https://www.wikipedia.org/    # Wikipedia Url
${PAGE_DELAY}     200ms
${TRANSITION_DELAY}    2s

*** Test Cases ***    INCORRECT PHRASE    LANGUAGE    TIP
TemplateTest-01       HP Lovecraft        pl          Lovecraft

TemplateTest-02       Franko Revenge      pl          Franko

TemplateTest-03       Genisys             pl          Genisys

*** Keywords ***
Check If Number Of Pages Matches Description
    ${results}    Get Element Count    //*[@class="mw-search-result"]
    ${expected_number_of_results}    Get Text    //*[@id="mw-search-top-table"]/*//strong
    @{expected_number_of_results}    Split String    ${expected_number_of_results}    -
    ${expected_number_of_results}    Get From List    ${expected_number_of_results}    -1
    Should Be Equal As Integers    ${results}    ${expected_number_of_results}

Get to Wiki article
    [Arguments]    ${incorrect_phrase}    ${language}    ${tip}
    Search For Article In Given Language    ${incorrect_phrase}    ${language}
    Check If Number Of Pages Matches Description
    Wait And Click Element    //span[@class="searchmatch" and text()="${tip}"]
    Sleep    1s
