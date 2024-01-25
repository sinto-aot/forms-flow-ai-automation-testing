*** Settings ***
Documentation     All the page objects and keywords of choose from Template page
Library           SeleniumLibrary
*** Variables ***

${template_name}   checking template
${title}          automation_Test
${category}       checking template
${intro}          Test
${description}    creating template from a form
*** Keywords ***

select a form and saving it as template
    [Arguments]    ${template_form_id}
	sleep                                 4
	Click Button                        //button[@data-testid='form-edit-button-${template_form_id}']
    Execute JavaScript                  window.scrollTo(0, document.body.scrollHeight)
	Sleep                                 8
    Click Button                        //button[@data-testid="form-save-new-version-save"]
	Sleep                                 8
	Click Button                        //button[@data-testid="form-next-button"]
	Sleep                                 8
	Click Button                        //button[@data-testid="form-save-next-button"]
	Sleep                                 3
	Wait Until Element Is Visible       //button[@data-testid="save-update-template-button"]
	${template}=    Get Text            //button[@data-testid="save-update-template-button"]
    ${value}=       Set Variable         Save as Template
    ${isExist}=     Run Keyword And Return Status         Should Be Equal As Strings    ${template}    ${value}
    Run Keyword If    ${isExist}==False
    ...    Update Template
    ...    ELSE
    ...    Save As Template


update template
	Click Element                      //button[@data-testid='save-update-template-button']
	Click Element                      //input[@data-testid='update-form-checkbox']
    sleep                               3
	Click Element                      //button[@data-testid='update-save-template-button']
	sleep                               2
	Page Should Contain                Template updated successfully
	sleep                               3
	Click Button                       //button[@data-testid='save-form-button']
    sleep                               5

save as template
    Click Element                      //button[@data-testid='save-update-template-button']
     ${min}=   Get Current Date         result_format=%M
	 ${min}=   Convert To Integer       ${min}
	Element Should Be Disabled          //button[@data-testid='update-save-template-button']
	Input Text                          //input[@data-testid='template-title-input']         ${title}'+'${min}
#	Click Element                       //div[@class='select__placeholder css-1wa3eu0-placeholder']
	Sleep                                2
	Input Text                          //div[@class='select__placeholder css-1wa3eu0-placeholder']           ${category}
	Press Keys                          //div[@class='select__placeholder css-1wa3eu0-placeholder']      ENTER
	Input Text                          //input[@data-testid='template-short-intro-input']    ${intro}
	Input Text                          //input[@data-testid='template-description-input']    ${description}
	Click Element                       //button[@data-testid='update-save-template-button']
	sleep                                2
	Page Should Contain                 Template created successfully
	sleep                                3
	Click Button                        //button[@data-testid='save-form-button']
    sleep                                5

Choose From Template

	Wait Until Element Is Visible       //button[@data-testid='choose-template-button']
	Click Element                       //button[@data-testid='choose-template-button']


Search category
    sleep                                3
	Input Text                         //input[@data-testid='template-search-category']    ${template_name}
    Press Keys                         //input[@data-testid='template-search-category']    ENTER
    Click Element                      //span[text()='checking template']
    sleep                               2
    Click Element                      //div[@data-testid='template-detail-57']
    sleep                               3
    Click Element                      //a[@data-testid='template-connected-workflow']
    Wait Until Element Is Visible      //button[@data-testid='template-use-button']
    Click Button                       //button[@data-testid='template-use-button']
    Click Button                       //button[@data-testid='template-reuse-workflow-button']
    sleep                               5
    Page Should Contain                Form created successfully
    click button                       //button[normalize-space()='Next']
    sleep                              2
    click button                       //button[normalize-space()='Next']
    sleep                              4
    Click Element                      //input[@id='form-publish']
    click button                       //button[@data-testid='save-form-button']