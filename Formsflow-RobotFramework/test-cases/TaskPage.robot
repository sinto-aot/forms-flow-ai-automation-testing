
*** Settings ***
Documentation     Form BundlingRBAC.
Test Setup     Open chrome Browser and goto QAbundle instance
Library           SeleniumLibrary
Library           DateTime
Resource            ../PageObejcts/BundleCreatePAge.robot
Resource            ../PageObejcts/Generic.robot
Resource            ../PageObejcts/FormsLandingPAge.robot
Resource            ../PageObejcts/FormfillClient.robot
Resource            ../PageObejcts/ReviewerPage.robot
Resource            ../PageObejcts/ApplicationPage.robot

Resource            ../PageObejcts/workflowSelectPage.robot

Test Teardown    Close Browser

*** Variables ***
${Bundle_form}       Automation_bundle
*** Test Cases ***

TaskSearchByReviewer_listview


  Generic.LoginToApplication_reviewer
  ReviewerPage.searchInListView
  Applicationpage.Check status of form submitted

BundlingRBAC_negative
	        [Tags]    Sanity

   Generic.Login To Qaee instance as designer
    BundleCreatePAge.Verify negative flow-enter same bundle name created earlier






