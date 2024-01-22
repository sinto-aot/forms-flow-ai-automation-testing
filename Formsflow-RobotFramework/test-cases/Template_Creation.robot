*** Settings ***
Documentation     Form BundlingRBAC.
Test Setup     Open chrome Browser and goto QAbundle instance
Library           SeleniumLibrary
Library           DateTime
Resource            ../PageObjects/Generic.robot
Resource            ../PageObjects/FormsLandingPAge.robot
Resource            ../PageObjects/TemplatePage.robot

Suite Teardown    Close Browser

*** Test Cases ***
Template_Create
    [Tags]    Sanity
    Generic.Login To QA Instance  ${designer_user}
    FormsLandingPAge.select a form and saving it as template    656968a07eb909f9083f7766
    FormsLandingPAge.Choose From Template
    TemplatePage.Search category
#    workflowSelectPage.select workflow and publish to client


#RBAC
#    [Tags]    Sanity1
#    Generic.Login To QA Instance  ${designer_user}
#    FormsLandingPAge.RBAC
