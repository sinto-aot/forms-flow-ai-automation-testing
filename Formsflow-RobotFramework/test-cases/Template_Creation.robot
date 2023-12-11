*** Settings ***
Documentation     Form BundlingRBAC.
Test Setup     Open chrome Browser and goto QAbundle instance
Library           SeleniumLibrary
Library           DateTime
Resource            ../PageObejcts/Generic.robot
Resource            ../PageObejcts/FormsLandingPAge.robot
Resource            ../PageObejcts/TemplatePage.robot

Suite Teardown    Close Browser

*** Test Cases ***
Template_Create
    [Tags]    Sanity
    Generic.Login To Qaee instance as designer
    FormsLandingPAge.select a form and saving it as template
    FormsLandingPAge.Choose From Template
    TemplatePage.Search category
#     workflowSelectPage.select workflow and publish to client
<<<<<<< HEAD
=======

>>>>>>> 45dbadc5c4dac44a248e8a9551f8469d18b9e705


RBAC
    [Tags]    Sanity1
    Generic.Login To Qaee instance as designer
    FormsLandingPAge.RBAC
