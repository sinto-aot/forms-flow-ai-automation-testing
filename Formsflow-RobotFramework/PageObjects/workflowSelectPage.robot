*** Settings ***
Documentation     Filling Business License form
Library           SeleniumLibrary

*** Variables ***

${workflow-name}   One Step Approval

*** Keywords ***

select workflow and publish to client
	sleep    5
    Click Button    xpath=//button[@data-testid='bundle-save-next-button']
    sleep   3
  Click Button    xpath=//button[@data-testid='workflow-edit-button']
    sleep   4
    click Element    xpath=//div[@class=' css-1hwfws3']
    sleep    2
    Input Text    xpath=//*[@id="selectWorkflow"]    ${workflow-name}
    Press Keys    xpath=//div[@class=' css-1hwfws3']/div/div/input    ENTER
    Click Button    xpath=//button[@data-testid='bundle-save-next-button']
#    Wait Until Element Is Visible     xpath=//label[@for='form-publish']

    sleep    0.5s
    Click Button    //input[@data-testid='bundle-publish-switch']
    Click Button     xpath=//button[text()='Save']
    sleep    5


