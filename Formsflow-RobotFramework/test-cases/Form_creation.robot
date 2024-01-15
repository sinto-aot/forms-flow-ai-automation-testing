*** Settings ***
Documentation     New Form Creation.
Test Setup     Open chrome Browser and goto QAbundle instance
Library           SeleniumLibrary
Library           DateTime
Resource            ../PageObjects/FormCreate.robot
Resource            ../PageObjects/Generic.robot
Suite Teardown    Close Browser

*** Test Cases ***

Newform_Create

    Generic.Login To Qaee instance as designer
    FormCreate.Create new Form
    Generic.validate success message after form create
    FormCreate.check form status
    Generic.logout
