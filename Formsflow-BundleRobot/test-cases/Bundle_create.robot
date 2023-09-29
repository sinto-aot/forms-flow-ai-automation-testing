
*** Settings ***
Documentation     Form BundlingRBAC.
Test Setup        Open chrome Browser and goto QAbundle instance
Library           SeleniumLibrary
Library           DateTime
Resource            ../resources/variables.robot
Resource            ../resources/keywords.robot



*** Test Cases ***
LoginBundle
    [Tags]    Sanity

        Login To Qaee instance as designer
        CreateBundle and publish the bundle to client


*** Keywords ***

CreateBundle and publish the bundle to client
    Click Element    //*[@id="main"]/div/section/div[1]/div[1]/div/div[2]/h3/span
    Click Element    //*[@id="main"]/div/section/div[1]/div[2]/a
    ${CurrentDate}    Get Time
    Input Text    //*[@id="main"]/div/div[2]/div[2]/section[1]/div/div[1]/input    ${Bundlename} + ${CurrentDate}
    Input Text    //*[@id="main"]/div/div[2]/div[2]/section[1]/div/div[2]/textarea    ${BundleDesc}
    Click Element    //*[@id="main"]/div/div[2]/div[2]/section[2]/div[1]/div/div[1]/div/table/tbody/tr[2]/td/button
    sleep    3
    Input Text    //input[@placeholder='Search...']    ${formname}
    Press Keys    //input[@placeholder='Search...']    ENTER
    sleep    3
    Select Checkbox    xpath=//html/body/div[2]/div/div/div[2]/div[2]/div/table/thead/tr/th[1]/span/span[1]/input
    Click Button    xpath=//button[contains(text(),'Insert')]
    Click Button    xpath=//*[@id="main"]/div/div[2]/div[2]/section[2]/div[2]/div/div[1]/table/tbody/tr[2]/td/button
    Input Text    xpath=//textarea[@placeholder='Enter criteria']    ${criteria}
    click Element    xpath=/html/body/div[2]/div/div/div[2]/div/div[2]/div[2]/div/div[1]
    sleep    2
    Press Keys    xpath=/html/body/div[2]/div/div/div[2]/div/div[2]/div[2]/div/div[1]/div[2]/div/input    ${condition_form}+ENTER
    Click Button    xpath=/html/body/div[2]/div/div/div[3]/button
    scroll element into view    xpath=//button[contains(text(),'Save & Preview')]
    sleep    0.5s
    Click Button    xpath=//button[contains(text(),'Save & Preview')]
    sleep    5
    ${create}=    Get Text    xpath=//div[contains(text(),'Bundle Create Successfully')]
    Should Be Equal As Strings    ${create}    Bundle Create Successfully
    sleep    3
    Click Button    xpath=//button[contains(text(),'Next')]
    Click Button    xpath=//button[contains(text(),'Edit')]
    click Element    xpath=//*[@id="main"]/div/div[2]/div[4]/div/div/div[1]/div/div/div[1]/div[1]
    sleep    2
    Input Text    xpath=//*[@id="main"]/div/div[2]/div[4]/div/div/div[1]/div/div/div[1]/div[2]/div/input    ${workflow-name}
    Press Keys    xpath=//*[@id="main"]/div/div[2]/div[4]/div/div/div[1]/div/div/div[1]/div[1]    ENTER
    Click Button    xpath=//button[contains(text(),'Next')]
    Select Checkbox    xpath=//*[@id="main"]/div/div[2]/div[2]/div/div/div/div[1]/div[4]/label/label[2]/span[1]/span[1]/input
    Click Button    xpath=//button[contains(text(),'Save')]
    sleep    3
    ${response}=    Get Text    xpath=//div[contains(text(),'Form-Workflow association saved.')]
    Should Be Equal As Strings    ${response}    Form-Workflow association saved.

