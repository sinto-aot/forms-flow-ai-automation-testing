*** Settings ***
Library    SeleniumLibrary
Resource    DraftPage.robot
*** Variables ***

${formname}   Automation_Form
${TABLE_ROW_SUBMISSION}      1
${TABLE_COLUMN_SUBMISSION}      1
*** Keywords ***

Fetch Submission ID
    [Arguments]                   ${row_number}    ${column_number}
    # Construct XPath based on row and column numbers

    ${xpath} =    Set Variable    //table[contains(@class,'table custom-table table-responsive-sm')]/tbody/tr[${row_number}]/td[${column_number}]

    # Get the ID value using the constructed XPath
    ${id_value} =               Get Text    xpath=${xpath}
    RETURN                      ${id_value}

Check status of form submitted
	Click Element      //a[@data-testid='applications-nav-link']
	sleep    3

	${id_value} =    Fetch Submission ID     ${TABLE_ROW_SUBMISSION}    ${TABLE_COLUMN_SUBMISSION}
    sleep                       5
	Click Button     //button[@data-testid='submission-details-button-${id_value}']
	sleep   3
	Click Element    //*[@id='application-details-tab-form']
	sleep   2
	Click Element    //*[@id='application-details-tab-history']
	sleep    2
	Click Element    //*[@id='application-details-tab-process-diagram']
	Log To Console    History and diagram displayed
