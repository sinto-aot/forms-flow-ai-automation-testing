
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
    sleep    2
    Wait Until Element Is Visible   //button[contains(text(),'Create Bundle')]
    Click Element    //button[contains(text(),'Create Bundle')]
    ${CurrentDate}    Get Time
    Input Text    //input[@placeholder='Enter name']    ${Bundlename} + ${CurrentDate}
    Input Text    //div[@class='ql-editor ql-blank']    ${BundleDesc}
    Click Element    //button[contains(text(),'Add Forms')]
    sleep    3
    Input Text    //input[@placeholder='Search...']    ${formname}
    Press Keys    //input[@placeholder='Search...']    ENTER
    sleep    3
    Select Checkbox    xpath=//th[@class='text-center']/input
    Click Button    xpath=//button[contains(text(),'Insert')]
    Click Button    xpath=//button[contains(text(),' Add Conditions')]
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
    ${form_bundlename}    Get Text    xpath=//td[@headers='search-container bundle-name']
    Click Element    //button[@class='btn btn-primary']

    Input Text    //input[@placeholder='Enter name']    ${form_bundlename}
    Input Text    //div[@class='ql-editor ql-blank']    ${BundleDesc}
    Click Element    //button[normalize-space()='Add Forms']
    sleep    3
    Input Text    //input[@placeholder='Search...']    ${formname}
    Press Keys    //input[@placeholder='Search...']    ENTER
    sleep    3
    Select Checkbox    xpath=//table[@class='table']//th[@class='text-center']/input
    Click Button    xpath=//button[contains(text(),'Insert')]
    scroll element into view    xpath=//button[contains(text(),'Save & Preview')]
    sleep    0.5s
    Click Button    xpath=//button[contains(text(),'Save & Preview')]
    sleep    5
    ${negative}=    Get Text    xpath=//div[contains(@role,'alert')]//div[1]
    log     ${negative}
    Should Be Equal As Strings    ${negative}    ValidatorError (name) - The Name must be unique per Project.
