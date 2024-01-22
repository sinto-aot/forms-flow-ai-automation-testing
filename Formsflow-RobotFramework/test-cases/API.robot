*** Settings ***
Documentation       This test case is for checking all the permission available for admin user.
Test Setup          Open chrome Browser and goto QAbundle instance
Library             SeleniumLibrary
Library  RequestsLibrary
Library  JSON
Resource    ../PageObjects/FormsLandingPAge.robot
Resource            ../PageObjects/Generic.robot
Test Teardown    Close Browser

*** Variables ***
${name}   Automation_bundle + 2023-11-30 10:25:24
${TABLE_ROW_NUMBER}    1  # The actual row number
${TABLE_COLUMN_NUMBER}    1  # The actual column number
${username}            formsflow-designer
*** Test Cases ***

#Get acess token and form id of a form
#	Generic.Login To QA Instance    ${username}
#	FormsLandingPAge.Send GET Request and Extract ID by Name


