*** Keywords ***
Search For Article In Given Language
    [Arguments]    ${phrase}    ${language}
    Wait And Click Element    //*[@class="hide-arrow"]
    Select From List By Value    //*[@id="searchLanguage"]    ${language}    # instead of locator searchLanguage can be used as id is default attibute expected by the keyword
    Wait And Input    //*[@id="searchInput"]    ${phrase}
    Wait And Click Element    //*[text()='Search']

Wait And Click Element
    [Arguments]    ${selector}    ${timeout}=${TRANSITION_DELAY}
    Wait Until Element Is Visible    ${selector}    ${timeout}
    Click Element    ${selector}

Wait And Input
    [Arguments]    ${selector}    ${content}    ${timeout}=${TRANSITION_DELAY}
    Wait Until Element Is Visible    ${selector}    ${timeout}
    Input Text    ${selector}    ${content}
