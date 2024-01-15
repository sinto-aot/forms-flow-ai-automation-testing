
*** Settings ***
Documentation     Form BundlingRBAC.
Test Setup     Open chrome Browser and goto QAbundle instance
Library           SeleniumLibrary
Library           DateTime
Resource            ../PageObjects/BundleCreatePAge.robot
Resource            ../PageObjects/Generic.robot
Resource            ../PageObjects/FormsLandingPAge.robot
Resource            ../PageObjects/FormfillClient.robot
Resource            ../PageObjects/ReviewerPage.robot
Resource            ../PageObjects/ApplicationPage.robot

Resource            ../PageObjects/workflowSelectPage.robot

Test Teardown    Close Browser

*** Variables ***
${Bundle_form}       Automation_bundle
*** Test Cases ***
Bundle_Create


    Generic.Login To Qaee instance as designer
    BundleCreatePAge.CreateBundle
     workflowSelectPage.select workflow and publish to client
   Generic.validate success message after form create
     Generic.logout
Bundle_FormfillByClient

  Generic.LoginToApplication_client
  FormsLandingPAge.Search Bundle_Form   ${Bundle_form}
  FormfillClient.Fill_BundleForm
  FormfillClient.check second bundle form displayed
  FormfillClient.Fill_Freedomform
  Applicationpage.Check status of form submitted
  Generic.logout
Bundle_TaskActionByReviewer


  Generic.LoginToApplication_reviewer
  ReviewerPage.ReviewerAction
  Applicationpage.Check status of form submitted

BundlingRBAC_negative
	        [Tags]    Sanity

   Generic.Login To Qaee instance as designer
    BundleCreatePAge.Verify negative flow-enter same bundle name created earlier






