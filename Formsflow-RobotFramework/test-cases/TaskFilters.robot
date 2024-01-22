*** Settings ***
Documentation       This test case is for checking taskfilters updates.
Test Setup          Open chrome Browser and goto QAbundle instance
Library             SeleniumLibrary
Resource            ../PageObjects/TaskFilterCreate.robot

Resource            ../PageObjects/Generic.robot
Test Teardown    Close Browser

*** Variables ***

*** Test Cases ***

Task filters cases
    Generic.Login To QA Instance   ${test_reviewer}
    TaskFilterCreate.Check for taskfilters in the list
    TaskFilterCreate.Create new Taskfilter
