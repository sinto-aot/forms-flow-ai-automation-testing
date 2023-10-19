
*** Settings ***
Documentation     Filling Business License form
Library           SeleniumLibrary

*** Variables ***

${formname}       automation
${condition_form}    automation1

${Bundlename}     Automation_bundle
${BundleDesc}     bundleAutomation
${workflow-name}    One step Approval

${criteria}       textField== 'yes'

*** Keywords ***
CreateBundle

    Click Element    //*[@id="main"]/div/section/div[1]/div[1]/div/div[2]/h3/span
    Click Element    //*[@id="main"]/div/section/div[1]/div[2]/a
    ${CurrentDate}    Get Time
    Input Text    //*[@id="main"]/div/div[2]/div[2]/section[1]/div/div[1]/input    ${Bundlename} + ${CurrentDate}
    Input Text    //*[@id="main"]/div/div[2]/div[2]/section[1]/div/div[2]/div/div[2]/div/div[1]    ${BundleDesc}
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
select workflow and publish to client

    Click Button    xpath=//button[contains(text(),'Edit')]
    sleep   2
    click Element    xpath=//*[@id="main"]/div/div[2]/div[4]/div/div/div[1]/div/div/div[1]/div[1]
    sleep    2
    Input Text    xpath=//*[@id="main"]/div/div[2]/div[4]/div/div/div[1]/div/div/div[1]/div[2]/div/input    ${workflow-name}
    Press Keys    xpath=//*[@id="main"]/div/div[2]/div[4]/div/div/div[1]/div/div/div[1]/div[1]    ENTER
    Click Button    xpath=//button[contains(text(),'Next')]
    Click Element        xpath=//input[@name='Check box to associate form with a workflow']
    Click Button    xpath=//button[contains(text(),'Save')]
    sleep    3

Verify negative flow-enter same bundle name created earlier

    Click Element    //*[@id="main"]/div/section/div[1]/div[1]/div/div[2]/h3/span
    sleep    2
    ${form_bundlename}    Get Text    xpath=//*[@id="main"]/div/section/div[2]/div/table/tbody/tr[3]/td[1]
    Click Element    //*[@id="main"]/div/section/div[1]/div[2]/a

    Input Text    //*[@id="main"]/div/div[2]/div[2]/section[1]/div/div[1]/input    ${form_bundlename}
    Input Text    //*[@id="main"]/div/div[2]/div[2]/section[1]/div/div[2]/div/div[2]/div/div[1]    ${BundleDesc}
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
