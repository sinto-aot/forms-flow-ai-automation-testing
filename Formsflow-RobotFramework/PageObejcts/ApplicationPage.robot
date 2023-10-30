*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${formname}   Automation_Form

*** Keywords ***
Check status of form submitted
	Click Element    xpath=//a[contains(@href,'/application')]
	sleep    3
	Click Element    xpath=//*[@id="main"]/div/div[2]/div[1]/div/table/tbody[2]/tr[1]/td[1]/a
	sleep   3
	Click Element    xpath=//*[@id='application-details-tab-form']
	sleep   2
	Click Element    xpath=//*[@id='application-details-tab-history']
	sleep    2
	Click Element    xpath=//*[@id='application-details-tab-process-diagram']
	Log To Console    History and diagram displayed
