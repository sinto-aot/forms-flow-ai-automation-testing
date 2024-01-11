*** Settings ***
Documentation     Filling Business License form
Library           SeleniumLibrary

*** Variables ***

${workflow-name}   One Step Approval

*** Keywords ***

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
#    Wait Until Element Is Visible     xpath=//label[@for='form-publish']

    sleep    0.5s
    Click Button    //input[@id='form-publish']
    Click Button     xpath=//button[text()='Save']
    sleep    5


