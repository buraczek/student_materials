*** Settings ***
Force Tags        FORCED_TAG
Default Tags      DEFAULT_TAG

*** Test Cases ***
TestWithNoTags
    No Operation

TestWithTag
    [Tags]    TEST_TAG
    No Operation

TestWithEmptyTags
    [Tags]
    No Operation
