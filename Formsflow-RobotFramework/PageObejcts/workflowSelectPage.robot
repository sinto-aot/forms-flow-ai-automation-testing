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
      ${BG}   Get WebElement     xpath=//label[@for='form-publish']
      Log To Console        ${BG}
    ${bg color}    Call Method    ${BG}    value_of_css_property    background-color
    Log   ${bg color}
    Run Keyword If    '${bg color}'=='rgba(0, 0, 0, 0)'    Click Element      xpath=//div[@class="custom-control custom-switch"]
    Click Button    xpath=//button[text()='Save']
    sleep    5