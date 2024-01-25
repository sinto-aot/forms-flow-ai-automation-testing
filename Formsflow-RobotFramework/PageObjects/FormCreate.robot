*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${formname}      Automation_Form
${labelname}     Feedback
${copy}                             -copy
*** Keywords ***

Create new Form
    wait until page contains element    //span[text()='Forms']
    click element                       //button[@data-testid='create-form-btn']
    sleep                               4s
    ${CurrentDate}                      Get Time
     ${title}    set variable           ${formname}+${CurrentDate}
    input text                          //input[@data-testid='create-form-title']      ${title}
    sleep                                2
    Execute JavaScript                  window.scrollTo(0, document.body.scrollHeight)
    drag and drop                       //span[@data-type='textarea']                  //div[@role='alert']
    Sleep                                2
    input text                          name=data[label]                               ${labelname}
    click button                        //button[@class='btn btn-success']
    click button                        //button[@data-testid='create-form-btn-save']
    sleep                               4
    element should be visible           //div[@role='alert']
    sleep                               4
    click button                        //button[@data-testid="form-next-button"]
    sleep                               2
    click button                        //button[@data-testid="form-save-next-button"]
    sleep                               4
    Click Button                        //input[@data-testid="form-publish-switch"]
    click button                        //button[@data-testid='save-form-button']
    sleep                               4
    Set Global Variable                 ${title}
    Log To Console                      Form created successfully.

check form status
    Input Text                         //input[@placeholder='Search by form title']    ${title}
    Press Keys                         //input[@placeholder='Search by form title']     ENTER
    sleep                               3
    ${publish_status}=                 Get Text    xpath=//span[@class='badge rounded-pill px-3 py-2 published-forms-label']
    Log To Console                     The newly created form is ${publish_status}.


Create Duplicate Form
    Sleep                               8
    input text                          //*[@data-testid="form-search-input-box"]        ${formname}
    Press Keys                          //*[@data-testid="form-search-input-box"]        ENTER
    sleep                               5
    wait until page contains            ${formname}
    Click Element                       //i[@class='fa-solid fa-ellipsis']
    Click Element                       //a[contains(@data-testid, 'designer-form-option-') and contains(@data-testid, '-view-details')]
    Sleep                               6
    Click Button                        //button[@data-testid="form-duplicate-button"]
    wait until page contains            Create a duplicate form
    click button                        //button[@data-testid="form-duplicate-yes-button"]
    sleep                                4
    page should contain                 Duplicate form created successfully
    sleep                               3
    page should contain                 ${copy}
    click button                        //button[@data-testid="form-next-button"]
    click button                        //button[@data-testid="form-save-next-button"]
    Sleep                               3
    Click Button                        //button[@data-testid="save-form-button"]
    sleep                               5
    Log To Console                      Duplicate form created successfully.








API Testing
	[Tags]                             Sanity

    ${body}=    create dictionary     grant_type=client_credentials  client_id=forms-flow-bpm        client_secret=786001d6-68a8-4519-903c-bc5b5a870d68

    ${header}=  create dictionary     Content-Type=x-www-form-urlencoded
    ${resp}=    POST                  https://forms-flow-idm-qa.aot-technologies.com/auth/realms/forms-flow-ai/protocol/openid-connect/token    ${body}    ${header}
    Log To Console                    ${resp}
