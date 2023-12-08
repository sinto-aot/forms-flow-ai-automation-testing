*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${formname}   Automation_Form

*** Keywords ***
Check status of form submitted
	Click Element    xpath=//a[contains(@href,'/application')]
	sleep    3
	Click Element    xpath=//button[@class='btn btn-link mt-2' and text()='View Details']
	sleep   3
	Click Element    xpath=//*[@id='application-details-tab-form']
	sleep   2
	Click Element    xpath=//*[@id='application-details-tab-history']
	sleep    2
	Click Element    xpath=//*[@id='application-details-tab-process-diagram']
	Log To Console    History and diagram displayed
