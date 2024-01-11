*** Settings ***
Documentation     Filling Business License form
Library           SeleniumLibrary

*** Variables ***

${name}    Nancy smith

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

searchInListView

	 Click Element    //button[@class='btn me-1 btn-light']
	 sleep    3
	 Click Element    //div[@class='Select-Task-Variables task-filter-list-view']/button
	 Click Element    //div[@class='filter-container-list task-filter-list-view']/button
	 Input Text    //input[@name='name']   ${name}
	 Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
	 Click Element    //button[text()='Show results']
	 sleep                       3
    page should contain           ${name}
    Click Element    //div[@class='filter-container-list task-filter-list-view']/button
    Input Text    //input[@name='applicationId']   112
   ${response}=    Get Text    //div[@class='not-selected mt-2 ms-1 row']
	 Should Be Equal As Strings    ${response}    No task matching filters found.

