*** Settings ***
Documentation     All the page objects and keywords of formpage
Library           SeleniumLibrary
Library    OperatingSystem
Library         DateTime
Library           AutoItLibrary  
Library    Process
Library  RequestsLibrary
#Library  JSON

*** Variables ***


${title}          automation_Test
${category}       checking template
${intro}          Test
${description}    creating template from a form
${AUTOIT_SCRIPT}     ${CURDIR}${/}Resource\\Fileuautoit.exe
${FILE_PATH}       ${CURDIR}${/}Resource\\BusinessFreedom.json
${name}   Automation_bundle + 2023-11-30 10:25:24
${TABLE_ROW_NUMBER}    1  # The actual row number
${TABLE_COLUMN_NUMBER}    1  # The actual column number
*** Keywords ***

Search Form
    [Arguments]    ${formname_client}      ${form_id}
	Input Text    //input[@data-testid='form-search-input-box']     ${formname_client}
    Click Element        //*[@data-testid='form-search-click-button']
    sleep    3
    click Button    //*[@data-testid='form-submit-button-${form_id}']
    sleep    5

Search Bundle_Form
    [Arguments]    ${Bundle_form}
	Input Text    //input[@placeholder='Search by form title']    ${Bundle_form}
    Press Keys    //input[@placeholder='Search by form title']    ENTER
    sleep    3
    click Button    //tbody/tr[1]/td[3]/button[1]
    sleep    5
RBAC
	sleep    3
	Click Button    //tbody/tr[1]/td[6]/span[1]/button[1]

	Wait Until Element Is Visible         //button[contains(text(),'Next')]
	Click Button     //button[contains(text(),'Next')]
	Click Button     //button[contains(text(),'Next')]
	sleep    2
	 ${is_selected}    Get Element Attribute   css=input[type='radio'][value='All Designers']     checked
	 Log To Console    value is + ${is_selected}
	  ${is_checked}    Convert To Boolean    ${is_selected}
	  Log To Console    value is + ${is_checked}
#    Should Be True         ${is_checked}
   Run Keyword If    ${is_checked}== True    log  "access to all designers"     ELSE    log  "not access to all designers"

select a form and saving it as template
    [Arguments]    ${template_form_id}
	sleep    3

	Click Button    //button[@data-testid='form-view-or-edit-button-${template_form_id}']

	Wait Until Element Is Visible         //button[contains(text(),'Next')]
	Click Button     //button[contains(text(),'Next')]
	Click Button     //button[contains(text(),'Next')]
	${template}=    Get Text      //button[contains(text(),'Template')]
	${value}=   Set Variable     Save as Template

	${isExist}=  Run Keyword And Return Status    Should Be Equal    ${template}   ${value}

	    Run Keyword If    ${isExist}== False    update template     ELSE    save as template

update template
	Click Element     //button[@data-testid='save-update-template-button']
	Click Element    //input[@data-testid='update-form-checkbox']
    sleep    3
	Click Element        //button[@data-testid='update-save-template-button']
	sleep    2
	Page Should Contain    Template updated successfully
	sleep    3
	Click Button    //button[@data-testid='save-form-button']
    sleep    5
save as template
     Click Element     //button[@data-testid='save-update-template-button']
     ${min}=   Get Current Date   result_format=%M
	 ${min}=   Convert To Integer   ${min}
	Input Text     //input[@data-testid='template-title-input']         ${title}'+'${min}
	Input Text      xpath=/html/body/div[2]/div/div/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/input      ${category}
	Press Keys     xpath=/html/body/div[2]/div/div/div/div[2]/div/div[2]/div/div/div/div[1]/div[1]      ENTER
	Input Text    //input[@data-testid='template-short-intro-input']    ${intro}
	Input Text    //input[@data-testid='template-description-input']    ${description}

	Click Element     //button[@data-testid='update-save-template-button'
	sleep    2
	Page Should Contain    Template created successfully
	sleep     3
	Click Button    //button[@data-testid='save-form-button']
    sleep    5
Choose From Template

	  Wait Until Element Is Visible    //button[@data-testid='choose-template-button']
		Click Element       //button[@data-testid='choose-template-button']

Upload Form

#	 Click Element       //button[@title='Upload json form only']
#	Upload File By Selector        //button[@title='Upload json form only']     ${CURDIR}${/}New Business License Application-2023-10-06T09_26_57.353Z


        # Continue with the rest of your test

        Click Element       //button[@data-testid='upload-form-btn']
        sleep    2

        # Get all window titles
#    ${window_titles}=    Get Window Titles
#
#    # Print all window titles (optional)
#    Log Many    ${window_titles}
#
#    # Get the title of the current window
#    ${current_window_title}=    Get Title
#
#    # Log the title (optional)
#    Log    Current Window Title: ${current_window_title}


      Run Process     ${AUTOIT_SCRIPT}    ${FILE_PATH}
    # Continue with other test steps or verifications
       sleep     15
        ${check_element}=  Run Keyword and Return Status   Wait Until Page Contains Element    //div[contains(text(),'2 of 2 form uploaded')]    12s
     Run Keyword If      '${check_element}' == 'True'     Log To Console    "upload succesfull"

     ${upload}=    Get Text    xpath=//div[@class='modal-body']/div

    Log To Console    ${upload}



Send GET Request and Extract ID by Name
	sleep   2
	${form_name} =    Fetch Form ID       ${TABLE_ROW_NUMBER}    ${TABLE_COLUMN_NUMBER}
    Log To Console    ${form_name}
    ${pattern}=   Set Variable    like
    ${encoded_form_name}    Evaluate    urllib.parse.quote("${form_name}")
    Log    Encoded Form Name: ${encoded_form_name}
    ${base_url}      Set Variable    http://forms-flow-api-qaee.aot-technologies.com

    Create Session    alias_name    ${base_url}
    ${body}=    create dictionary    grant_type=password  client_id=forms-flow-web        username=formsflow-designer    password=aot123

    ${header}=  create dictionary    Content-Type=x-www-form-urlencoded
    ${resp}=    POST      https://forms-flow-idm-qa.aot-technologies.com/auth/realms/forms-flow-ai/protocol/openid-connect/token    ${body}    ${header}
    Log To Console    ${resp}
      ${json_response}    Set Variable    ${resp.json()}
    ${access_token}    Set Variable    ${json_response["access_token"]}
    Should Not Be Empty    ${access_token}

    Log    Access Token: ${access_token}
    ${query_params}    Create Dictionary    pageNo=1    limit=5    sortBy=formName    sortOrder=asc    formType=form   formName=${encoded_form_name}
    ${headers}    Create Dictionary    Authorization=Bearer ${access_token}

    ${response}    GET On Session         alias_name  /form    params=${query_params}    headers=${headers}

    Log    Response Status Code: ${response.status_code}
    Log    Response Content: ${response.content}


   Should Be Equal As Numbers    ${response.status_code}    200
   ${form_id}=     Get Form ID From API Response    ${response.content}
    Log             Form ID: ${form_id}

Fetch form ID
    [Arguments]    ${row_number}    ${column_number}
    # Construct XPath based on row and column numbers
    ${xpath} =    Set Variable    //table[contains(@class,'table custom-table table-responsive-sm')]/tbody/tr[${row_number}]/td[${column_number}]
    # Get the ID value using the constructed XPath
    ${id_value} =    Get Text    xpath=${xpath}
    [Return]    ${id_value}


Get Form ID From API Response

    [Arguments]    ${api_response}
    ${json_data}=    Evaluate    json.loads($api_response)    json
    Log             JSON Data: ${json_data}
    ${form_id}=    Set Variable    ${json_data['forms'][0]['formId']}
#    Log    Form ID: ${form_id}
    [Return]         ${form_id}