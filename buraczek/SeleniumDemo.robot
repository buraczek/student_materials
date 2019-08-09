*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
OpenBrowser
    Open Browser    https://en.wikipedia.org/wiki/J%C3%B3zef_Pi%C5%82sudski
    Wait Until Element Is Visible    //*[@id="searchInput"]
    Input Text    //*[@id="searchInput"]    Xpath
    Click Button    //*[@id="searchButton"]
    Comment    Close All Browsers
