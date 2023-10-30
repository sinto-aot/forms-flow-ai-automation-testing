
*** Settings ***
Documentation     Filling Business License form
Library           SeleniumLibrary

*** Variables ***

${formname}       automation
${condition_form}    Automation_Freedom

${Bundlename}     Automation_bundle
${BundleDesc}     bundleAutomation
${workflow-name}   One Step Approval

${criteria}       textField== 'yes'

*** Keywords ***
CreateBundle

    Click Element    //span[text()='Form Bundle']
    Click Element    //a[contains(@href,'/bundleflow/create')]
    ${CurrentDate}    Get Time
    Input Text    //input[@placeholder='Enter name']    ${Bundlename} + ${CurrentDate}
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

select workflow and publish to client
	sleep    5
    Click Button    xpath=//button[text()='Next']
    sleep   3
  Click Button    xpath=//button[contains(text(),'Edit')]
    sleep   4
    click Element    xpath=//div[@class=' css-1hwfws3']
    sleep    2
    Input Text    xpath=//*[@id="selectWorkflow"]    ${workflow-name}
    Press Keys    xpath=//div[@class=' css-1hwfws3']/div/div/input    ENTER
    Click Button    xpath=//button[contains(text(),'Next')]
    Click Element        xpath=//input[@name='Check box to associate form with a workflow']
    Click Button    xpath=//button[text()='Save']
    sleep    5

Verify negative flow-enter same bundle name created earlier

    Click Element    //span[text()='Form Bundle']
    sleep    2
    ${form_bundlename}    Get Text    xpath=//*[@id="main"]/div/section/div[2]/div/table/tbody/tr[3]/td[1]
    Click Element    //*[@id="main"]/div/section/div[1]/div[2]/a

    Input Text    //input[@placeholder='Enter name']    ${form_bundlename}
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
