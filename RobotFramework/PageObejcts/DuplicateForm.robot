*** Settings ***
Library    SeleniumLibrary


*** Variables ***

${editing_form}         Automation_Duplicate_test
${form_copy}            Automation_Duplicate_test-copy
*** Keywords ***

Create Duplicate Form
    input text                      xpath://input[@placeholder='Search...']          ${editing_form}
    Press Keys                      //input[@placeholder='Search...']    ENTER
    sleep                           3
    click button                    xpath://span/button[text()='View/Edit Form']
    wait until page contains        ${editing_form}
    click button                    xpath://button[@class='btn btn-outline-primary ml-2']
    wait until page contains        Create a duplicate form
    click button                    xpath://button[normalize-space()='Yes']
    sleep                           4
    page should contain             Duplicate form created successfully
    sleep                           3
    page should contain             ${form_copy}
    click button                    xpath://button[normalize-space()='Next']
    click button                 xpath://button[normalize-space()='Next']
    Click Element        xpath=//input[@name='Check box to associate form with a workflow']
    Click Button       xpath=//button[text()='Save']
    sleep    4






