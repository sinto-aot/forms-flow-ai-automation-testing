*** Settings ***
Documentation     All the page objects and keywords of formpage
Library           SeleniumLibrary
Library    OperatingSystem
Library         DateTime
Library           AutoItLibrary
Library    Process


*** Variables ***


${title}          automation_Test
${category}       checking template
${intro}          Test
${description}    creating template from a form
${AUTOIT_SCRIPT}     ${CURDIR}${/}Resource\\Fileuautoit.exe
${FILE_PATH}       ${CURDIR}${/}Resource\\forms(2)-2023-12-01T05_16_42.json

*** Keywords ***

Search Form
    [Arguments]    ${formname_client}
	Input Text    //input[contains(@placeholder,'Search by form title')]     ${formname_client}
    Press Keys    //input[contains(@placeholder,'Search by form title')]    ENTER
    sleep    3
    click Button    //tbody/tr[1]/td[3]/button[1]
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

	sleep    3
	Click Button    //tbody/tr[1]/td[6]/span[1]/button[1]

	Wait Until Element Is Visible         //button[contains(text(),'Next')]
	Click Button     //button[contains(text(),'Next')]
	Click Button     //button[contains(text(),'Next')]
	${template}=    Get Text      //button[contains(text(),'Template')]
	${value}=   Set Variable     Save as Template

	${isExist}=  Run Keyword And Return Status    Should Be Equal    ${template}   ${value}

	    Run Keyword If    ${isExist}== False    update template     ELSE    save as template

update template
	Click Element     //button[contains(text(),'Update Template')]
	Click Element    //*[@id="updateFormData"]
    sleep    3
	Click Element        xpath=/html/body/div[2]/div/div/div/div[3]/button[2]
	sleep    2
	Page Should Contain    Template updated successfully
	sleep    3
	Click Button    xpath=//button[contains(text(),'Save')]
    sleep    5
save as template
     Click Element     //button[contains(text(),'Save as Template')]
     ${min}=   Get Current Date   result_format=%M
	 ${min}=   Convert To Integer   ${min}
	Input Text     //input[@placeholder='Enter title']         ${title}'+'${min}
	Input Text      xpath=/html/body/div[2]/div/div/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/input      ${category}
	Press Keys     xpath=/html/body/div[2]/div/div/div/div[2]/div/div[2]/div/div/div/div[1]/div[1]      ENTER
	Input Text    //textarea[@placeholder='Enter short intro']    ${intro}
	Input Text    //textarea[@placeholder='Enter description']    ${description}

	Click Element     xpath=/html/body/div[2]/div/div/div/div[3]/button[2]
	sleep    2
	Page Should Contain    Template created successfully
	sleep     3
	Click Button    xpath=//button[contains(text(),'Save')]
    sleep    5
Choose From Template

	  Wait Until Element Is Visible    //button[@class='btn btn-secondary ml-4']
		Click Element       //button[@class='btn btn-secondary ml-4']

Upload Form

#	 Click Element       //button[@title='Upload json form only']
#	Upload File By Selector        //button[@title='Upload json form only']     ${CURDIR}${/}New Business License Application-2023-10-06T09_26_57.353Z


        # Continue with the rest of your test

        Click Element       //button[@title='Upload json form only']
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
#        sleep     9
        ${check_element}=  Run Keyword and Return Status   Wait Until Page Contains Element    //div[contains(text(),'2 of 2 form uploaded')]    12s
     Run Keyword If      '${check_element}' == 'True'     Log To Console    "upload succesfull"

     ${upload}=    Get Text    xpath=//div[@class='modal-body']/div

    Log To Console    ${upload}
