
*** Settings ***
Documentation     Form BundlingRBAC.
Test Setup        Open chrome Browser and goto QAbundle instance
Library           SeleniumLibrary
Library           DateTime
Resource            ../resources/variables.robot
Resource            ../resources/keywords.robot



*** Test Cases ***


BundlingRBAC_negative
    [Tags]    Negative

    Login To Qaee instance as designer
    Verify negative flow-enter same bundle name created earlier

*** Keywords ***



Verify negative flow-enter same bundle name created earlier

    Click Element    //*[@id="main"]/div/section/div[1]/div[1]/div/div[2]/h3/span
    sleep    2
    ${form_bundlename}    Get Text    xpath=//*[@id="main"]/div/section/div[2]/div/table/tbody/tr[3]/td[1]
    Click Element    //*[@id="main"]/div/section/div[1]/div[2]/a

    Input Text    //*[@id="main"]/div/div[2]/div[2]/section[1]/div/div[1]/input    ${form_bundlename}
    Input Text    //*[@id="main"]/div/div[2]/div[2]/section[1]/div/div[2]/textarea    ${BundleDesc}
    Click Element    //*[@id="main"]/div/div[2]/div[2]/section[2]/div[1]/div/div[1]/div/table/tbody/tr[2]/td/button
    sleep    3
    Input Text    //input[@placeholder='Search...']    ${formname}
    Press Keys    //input[@placeholder='Search...']    ENTER
    sleep    3
    Select Checkbox    xpath=//html/body/div[2]/div/div/div[2]/div[2]/div/table/thead/tr/th[1]/span/span[1]/input
    Click Button    xpath=//button[contains(text(),'Insert')]
    scroll element into view    xpath=//button[contains(text(),'Save & Preview')]
    sleep    0.5s
    Click Button    xpath=//button[contains(text(),'Save & Preview')]
    sleep    5
    ${negative}=    Get Text    xpath=//*[@id="main"]/div/div[2]/div[1]
    Should Be Equal As Strings    ${negative}    ValidatorError (name) - The Name must be unique per Project.
