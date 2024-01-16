*** Settings ***
Library    SeleniumLibrary
Library    DateTime
*** Variables ***

${formname}     Automation_Form
${name}         Nancy-smith
${age}          25
${form_id}      -65828a754f60733fe6acbf8a
${search}       Automation Draft test
${email}       nancy@gmail.com
${phonenum}    (555) 555-5555
${TABLE_ROW_NUMBER}    1  # The actual row number
${TABLE_COLUMN_NUMBER}    1  # The actual column number
${Invalid_ID}            2
${Invalid_DraftName}     Invalid Draft
${from_date}             December 5, 2023
${to_date}               January 4, 2024
*** Keywords ***

Create New draft

    Input Text                            //input[@name='data[name]']    ${name}
#        click button                         //*[@data-testid="form-submit-button${form_id}"]
    Input Text                             //input[@name='data[age]']   ${age}
	sleep                                 3
	click element                         //a[@title='Back to Form List']
	sleep                                 3
	wait until page contains element      //div[@role='alert']


Check for created Draft
    wait until element is visible           //a[normalize-space()='Submissions']
    click element                         //a[normalize-space()='Submissions']
    sleep                                  5
    click element                         //span[normalize-space()='Drafts']
    sleep                                  5
    element text should be                  //tbody/tr[1]/td[2]         ${search}

Fetch Draft ID
    [Arguments]    ${row_number}    ${column_number}
    # Construct XPath based on row and column numbers
    ${xpath} =    Set Variable    //table[contains(@class,'table custom-table table-responsive-sm')]/tbody/tr[${row_number}]/td[${column_number}]
    # Get the ID value using the constructed XPath
    ${id_value} =    Get Text    xpath=${xpath}
    [Return]    ${id_value}

Draft Details
    sleep               2
    ${id_value} =    Fetch Draft ID     ${TABLE_ROW_NUMBER}    ${TABLE_COLUMN_NUMBER}
    click element        //*[@data-testid="draft-view-button-${id_value}"]
    sleep               2
    click element         //a[@id="application-details-tab-form"]
    sleep                       3
    page should contain           ${search}
    click element               //a[@id="application-details-tab-process-diagram"]
    click element                 //a[@data-testid='back-to-drafts-link']



Filter with draftName
    sleep                                  4
    click button                          //*[@data-testid="draft-filter-button"]
    sleep                                  2
    input text                             //*[@data-testid="draft-filter-draftName-input"]          ${search}
    sleep                                  2
    click button                          //*[@data-testid="draft-filter-apply-button"]
    sleep                                   3
    page should contain                  ${search}
    sleep                                   3
    click button                          //*[@data-testid="draft-filter-button"]
    click element                          //*[@data-testid="draft-filter-clear-button"]



Delete draft
    ${id_value} =    Fetch Draft ID     ${TABLE_ROW_NUMBER}    ${TABLE_COLUMN_NUMBER}
    sleep                       2
    click element                xpath=//*[@data-testid="draft-delete-button-${id_value}"]
    page should contain         Delete Confirmation
    sleep                       2
    click button                //button[@class='btn btn-danger']
    sleep                       2
    page should contain         Draft Deleted Successfully


Edit Draft
    sleep               2
    ${id_value} =    Fetch Draft ID     ${TABLE_ROW_NUMBER}    ${TABLE_COLUMN_NUMBER}
    Log To Console     ${id_value}
    click element           xpath=//*[@data-testid="draft-edit-button-${id_value}"]
    sleep                   5
    input text            //input[@name='data[email]']              ${email}
    input text            //input[@name='data[phoneNumber]']         ${phonenum}
    sleep                  1
    click element        xpath=//*[@data-testid="back-to-drafts-link"]
    sleep                  3
    click element          xpath=//*[@data-testid="draft-view-button-${id_value}"]
    click element           xpath=//a[@id='application-details-tab-form']
    sleep                   4


Verify Form Field Component

    ${actual_value}    Get Text    xpath=//input[@name='data[name]']
    Log To Console   ${actual_value}
   Textfield Value Should Be    //input[@name='data[name]']    ${name}
   Textfield Value Should Be    //input[@name='data[age]']    ${age}
   Textfield Value Should Be    //input[@name='data[email]']              ${email}
   Textfield Value Should Be     //input[@name='data[phoneNumber]']         ${phonenum}

Filter with Id

    click button                          //*[@data-testid="draft-filter-button"]
    sleep                                  2
    ${id_value} =    Fetch Draft ID     ${TABLE_ROW_NUMBER}    ${TABLE_COLUMN_NUMBER}
    input text                             //*[@data-testid="draft-filter-id-input"]        ${id_value}
    click button                          //*[@data-testid="draft-filter-apply-button"]
    sleep                                   3
    page should contain                     ${id_value}
    sleep                                   2
    click button                          //*[@data-testid="draft-filter-button"]
    click element                          //*[@data-testid="draft-filter-clear-button"]

Filter with Modified Date
   click button                          //*[@data-testid="draft-filter-button"]
   sleep                                  2
   click element                        //main//div[contains(@data-testid,'wrapper')]//div[1]//input[2]
   click element                       //button[contains(text(),'‹')]
   sleep                                3
   click element                       //abbr[@aria-label='${from_date}']
   sleep                                1
   click element                       //button[contains(text(),'›')]
   sleep                                 3
   click element                       //abbr[@aria-label='${to_date}']
   click button                          //*[@data-testid="draft-filter-apply-button"]
   sleep                                   3
   click button                          //*[@data-testid="draft-filter-button"]
   click element                          //*[@data-testid="draft-filter-clear-button"]

Filter with Invalid draftName and draft Id
    click button                          //*[@data-testid="draft-filter-button"]
    sleep                                  2
    input text                             //*[@data-testid="draft-filter-id-input"]            ${Invalid_ID}
    input text                              //*[@data-testid="draft-filter-draftName-input"]    ${Invalid_DraftName}
    click button                          //*[@data-testid="draft-filter-apply-button"]
    sleep                                   3
    page should contain                     No drafts found
    sleep                                   2
    click button                          //*[@data-testid="draft-filter-button"]
    click element                          //*[@data-testid="draft-filter-clear-button"]