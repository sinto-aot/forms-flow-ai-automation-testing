*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${formname}   Automation_Form

*** Keywords ***
Check status of form submitted
	Click Element    xpath=//a[contains(@href,'/application')]
	sleep    3
	Click Element    xpath=//*[@id="main"]/div[2]/table/tbody/tr[1]/td[6]/button
	sleep   3
	Click Element    xpath=//*[@id='application-details-tab-form']
	sleep   2
	Click Element    xpath=//*[@id='application-details-tab-history']
	sleep    2
	Click Element    xpath=//*[@id='application-details-tab-process-diagram']
	Log To Console    History and diagram displayed
