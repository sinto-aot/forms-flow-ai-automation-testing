*** Settings ***
Documentation     Filling Business License form
Library           SeleniumLibrary

*** Variables ***

${BusinessName}    aot
${natureOfBusiness}    IT
${noOfEmployess}    15
${mail}           ati@gmail.com
${textField}     yes
${textArea}    check

*** Keywords ***
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