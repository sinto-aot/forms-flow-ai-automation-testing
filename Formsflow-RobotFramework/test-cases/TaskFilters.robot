*** Settings ***
Documentation       This test case is for checking taskfilters updates.
Test Setup          Open chrome Browser and goto QAbundle instance
Library             SeleniumLibrary
Resource            ../PageObejcts/TaskFilterCreate.robot

Resource            ../PageObejcts/Generic.robot
Test Teardown    Close Browser

*** Variables ***

*** Test Cases ***

Task filters cases
    Generic.LoginToApplication_testreviewer
    TaskFilterCreate.Check for taskfilters in the list
    TaskFilterCreate.Create new Taskfilter
