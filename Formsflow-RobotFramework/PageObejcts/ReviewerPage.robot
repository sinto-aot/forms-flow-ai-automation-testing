*** Settings ***
Documentation     Filling Business License form
Library           SeleniumLibrary

*** Variables ***

${BusinessName}    aot
${natureOfBusiness}    IT
${noOfEmployess}    15
${mail}           ati@gmail.com
${textField}     yes
${textArea}    check

*** Keywords ***
ReviewerAction
	sleep    6
    Click Element    xpath=//span[contains(@title,'Form Name')]
    sleep       10
    Click Element    xpath=//span[text()='Claim']
    sleep    5
    Scroll Element Into View  xpath=//button[contains(text(),'Next Form')]
    sleep    2
   Click Element        xpath=//span[contains(text(),'Automation_Freedom')]
    sleep    7

    Scroll Element Into View  xpath=//button[@name='data[submitAction]']
    sleep  2
    click Element    xpath=//div[@class='choices form-group formio-choices' and @tabindex='-1']
    sleep    3
    Input Text    xpath=//*[@id="ec2oa9"]/div[1]/div[2]/input    Approved
    Press Keys    xpath=//*[@id="ec2oa9"]/div[1]/div[2]/input    ENTER
  Scroll Element Into View    xpath=//button[contains(text(),'Previous Form')]
   Click Element       xpath=//button[@name='data[submitAction]']
   sleep     5