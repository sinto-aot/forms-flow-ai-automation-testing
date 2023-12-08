*** Settings ***
Documentation     Upload a file.
Test Setup     Open chrome Browser and goto QAbundle instance
Library           SeleniumLibrary
Library           DateTime
Resource            ../PageObejcts/FormsLandingPAge.robot
Resource            ../PageObejcts/Generic.robot
Suite Teardown    Close Browser

*** Test Cases ***

Upload Form
    Generic.Login To Qaee instance as designer
    FormsLandingPAge.Upload Form
