*** Settings ***
Documentation     Filling Business License form
Library           SeleniumLibrary

*** Variables ***

${workflow-name}    One Step Approval

*** Keywords ***

select bundle workflow and publish to client
	sleep                    5
    Click Button            //button[@data-testid='bundle-save-next-button']
    sleep                    3
    Click Button            //button[@data-testid='workflow-edit-button']
    sleep                    4
    click Element           //div[@class=' css-1hwfws3']
    sleep                    2
    Input Text              //*[@id="selectWorkflow"]    ${workflow-name}
    Press Keys              xpath=//div[@class=' css-1hwfws3']/div/div/input    ENTER
    Click Button            //button[@data-testid='bundle-save-next-button']
#   Wait Until Element Is Visible     xpath=//label[@for='form-publish']
    sleep    0.5s
    Click Button            //input[@data-testid='bundle-publish-switch']
    Click Button            //button[text()='Save']
    sleep    5


