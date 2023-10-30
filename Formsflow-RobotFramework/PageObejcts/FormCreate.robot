*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${formname}   Automation_Form

*** Keywords ***
Create new Form
    wait until page contains element    //span[normalize-space()='Forms']
    click element                //a[@class='btn btn-primary btn-left btn-sm']
    sleep                        4s
    ${CurrentDate}               Get Time
    input text                   xpath://input[@id='title']      ${formname} + ${CurrentDate}
    drag and drop                xpath://span[@data-type='textarea']       xpath://div[@role='alert']
    input text                   name=data[label]      Feedback
    click button                 xpath://button[@class='btn btn-success']
    click button                 xpath://button[@class='btn btn-primary']
    sleep                        4s
    element should be visible    xpath://div[@role='alert']
    sleep                        4s
    click button                 xpath://button[normalize-space()='Next']
    sleep                        2s
    click button                 xpath://button[normalize-space()='Next']
    sleep                        4s
    select checkbox              name=Check box to associate form with a workflow
    click button                 xpath://button[normalize-space()='Save']
    sleep                        4