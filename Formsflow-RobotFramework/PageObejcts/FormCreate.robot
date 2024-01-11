*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${formname}   Automation_Form
${title}
*** Keywords ***

Create new Form
    wait until page contains element    //span[text()='Forms']
    click element                //button[@class='btn btn-primary']
    sleep                        4s
    ${CurrentDate}               Get Time
     ${title}    set variable   ${formname}+${CurrentDate}
    input text                   //*[@id="title"]      ${title}
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
    Click Element                  //div[@class='custom-control custom-switch']
    click button                 xpath://button[normalize-space()='Save']
    sleep                        4
    Set Global Variable   ${title}
check form status
    Input Text     //input[@placeholder='Search by form title']    ${title}
    Press Keys        //input[@placeholder='Search by form title']     ENTER
    sleep    3
      ${publish_status}=    Get Text    xpath=//span[@class='badge rounded-pill px-3 py-2 published-forms-label']
        Log To Console    "form is" ${publish_status}
API Testing
	[Tags]    Sanity


    ${body}=    create dictionary    grant_type=client_credentials  client_id=forms-flow-bpm        client_secret=786001d6-68a8-4519-903c-bc5b5a870d68

    ${header}=  create dictionary    Content-Type=x-www-form-urlencoded
    ${resp}=    POST        https://forms-flow-idm-qa.aot-technologies.com/auth/realms/forms-flow-ai/protocol/openid-connect/token    ${body}    ${header}
    Log To Console    ${resp}
