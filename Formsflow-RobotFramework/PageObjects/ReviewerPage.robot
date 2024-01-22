*** Settings ***
Documentation     Filling Business License form
Library           SeleniumLibrary

*** Variables ***

${name}     Nancy smith
${action}   Approved
*** Keywords ***
ReviewerAction
	sleep                           10
    Click Element                //span[contains(@title,'Form Name')]
    sleep                          10
    Click Element               //span[text()='Claim']
    sleep                          8
    Execute JavaScript           window.scrollTo(0, document.body.scrollHeight)
    sleep                          10
    Click Element               //span[contains(text(),'Automation_Freedom')]
    sleep                          10
    Execute JavaScript           window.scrollTo(0, document.body.scrollHeight)
    sleep                          8
    click Element               //div[@class='choices form-group formio-choices' and @tabindex='-1']
    sleep                          8
    Execute JavaScript           window.scrollTo(0, document.body.scrollHeight)
    Sleep                           4
    Input Text                  //*[@id="ec2oa9"]/div[1]/div[2]/input       ${action}
    Press Keys                  //*[@id="ec2oa9"]/div[1]/div[2]/input       ENTER
    Click Element               //button[@name='data[submitAction]']
    sleep                          5

searchInListView
    Click Element               //button[@class='btn me-1 btn-light']
    sleep                          3
    Click Element               //div[@class='Select-Task-Variables task-filter-list-view']/button
    Click Element               //div[@class='filter-container-list task-filter-list-view']/button
    Input Text                  //input[@name='name']   ${name}
    Execute JavaScript           window.scrollTo(0, document.body.scrollHeight)
    Click Element               //button[text()='Show results']
    sleep                           3
    page should contain           ${name}
    Click Element               //div[@class='filter-container-list task-filter-list-view']/button
    Input Text                  //input[@name='applicationId']   112
    Execute JavaScript          window.scrollTo(0, document.body.scrollHeight)
    Click Element               //button[text()='Show results']
    sleep     3
    ${response}=    Get Text    //div[@class='not-selected mt-2 ms-1 row']
    Should Be Equal As Strings    ${response}    No task matching filters found.
	Click Element               //button[text()='Show results']
	sleep     3
   ${response}=    Get Text    //div[@class='not-selected mt-2 ms-1 row']
	Should Be Equal As Strings    ${response}    No task matching filters found.

