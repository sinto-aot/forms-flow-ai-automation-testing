*** Settings ***
Documentation    Submit form bundle as client.
Test Setup     Open chrome Browser and goto QAbundle instance
Library           SeleniumLibrary
Resource            ../PageObjects/DuplicateForm.robot
Resource            ../PageObjects/Generic.robot


*** Variables ***



*** Test Cases ***

Create duplicate form
    Generic.Login To Qaee instance as designer
    DuplicateForm.Create Duplicate Form
     Generic.validate success message after form create
     Generic.logout
