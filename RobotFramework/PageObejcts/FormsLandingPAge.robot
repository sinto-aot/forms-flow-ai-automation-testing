*** Settings ***
Documentation     All the page objects and keywords of formpage
Library           SeleniumLibrary

Library         DateTime
*** Variables ***


${title}          automation_Test
${category}       checking template
${intro}          Test
${description}    creating template from a form


*** Keywords ***

Search Form
    [Arguments]    ${formname_client}
	Input Text    //input[@placeholder='Search...']
    Press Keys    //input[@placeholder='Search...']    ENTER
    sleep    3
    click Button    //*[@id="main"]/div/section/div[2]/div/table/tbody/tr/td[2]/span/button
    sleep    5

Search Bundle_Form
    [Arguments]    ${Bundle_form}
	Input Text    //input[@placeholder='Search...']    ${Bundle_form}
    Press Keys    //input[@placeholder='Search...']    ENTER
    sleep    3
    click Button    //*[@id="main"]/div/section/div[2]/div/table/tbody/tr/td[2]/span/button
    sleep    5
select a form and saving it as template
	Click Button    //*[@id="main"]/div/section/div[2]/div/table/tbody/tr[1]/td[2]/span/button

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
Choose From Template
		Click Element       //*[@id="main"]/div/section/div[1]/div[2]/a[1]

