*** Settings ***
Documentation     New Form Creation.
Test Setup     Open chrome Browser and goto QAbundle instance
Library           SeleniumLibrary  executable_path=/path/to/chromedriver
Library           DateTime
Resource            ../PageObejcts/FormCreate.robot
Resource            ../PageObejcts/Generic.robot
Suite Teardown    Close Browser

*** Test Cases ***

Newform_Create
    [Tags]    Sanity
    Generic.Login To Qaee instance as designer
    FormCreate.Create new Form
    Generic.validate success message after form create
    Generic.logout