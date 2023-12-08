*** Settings ***
Library    SeleniumLibrary


*** Variables ***

${editing_form}         Automation_Duplicate_test
${form_copy}            Automation_Duplicate_test-copy
*** Keywords ***

Create Duplicate Form
    input text                      xpath://input[@placeholder='Search by form title']          ${editing_form}
    Press Keys                      //input[@placeholder='Search by form title']     ENTER
    sleep                           3
    click button                    xpath://tbody/tr[1]/td[6]/span[1]/button[1]
    wait until page contains        ${editing_form}
    click button                    xpath://button[@class='btn btn-outline-primary ml-md-2 my-md-0 my-2']
    wait until page contains        Create a duplicate form
    click button                    xpath://button[normalize-space()='Yes']
    sleep                           4
    page should contain             Duplicate form created successfully
    sleep                           3
    page should contain             ${form_copy}
    click button                    xpath://button[normalize-space()='Next']
    click button                 xpath://button[normalize-space()='Next']
    Click Element        xpath=//div[@class="custom-control custom-switch"]
    Click Button       xpath=//button[text()='Save']
    sleep    5






