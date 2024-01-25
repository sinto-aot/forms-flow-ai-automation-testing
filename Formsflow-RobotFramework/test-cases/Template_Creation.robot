*** Settings ***
Documentation     Form BundlingRBAC.
Test Setup        Open chrome Browser and goto QAbundle instance
Library           SeleniumLibrary
Library           DateTime
Resource          ../PageObjects/Generic.robot
Resource          ../PageObjects/TemplatePage.robot

Suite Teardown    Close Browser

*** Test Cases ***
Template_Create
    [Tags]    Sanity
    Generic.Login To QA Instance  ${designer_user}
    TemplatePage.select a form and saving it as template    6579aad77eb909f9083f87ee
    TemplatePage.Choose From Template
    TemplatePage.Search category
#   workflowSelectPage.select workflow and publish to client

