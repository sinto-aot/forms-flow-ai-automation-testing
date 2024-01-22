*** Settings ***
Documentation    This test case is for create a duplicate form.
Test Setup       Open chrome Browser and goto QAbundle instance
Library          SeleniumLibrary
Resource         ../PageObjects/DuplicateForm.robot
Resource         ../PageObjects/Generic.robot


*** Variables ***



*** Test Cases ***

Create duplicate form
    Generic.Login To QA Instance   ${designer_user}
    DuplicateForm.Create Duplicate Form
    Generic.validate success message after form create
    Generic.logout
