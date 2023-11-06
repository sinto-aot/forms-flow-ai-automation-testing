
*** Settings ***
Documentation     Form BundlingRBAC.
Test Setup     Open chrome Browser and goto QAbundle instance
Library           SeleniumLibrary  executable_path=/path/to/chromedriver
Library           DateTime
Resource            ../PageObejcts/BundleCreatePAge.robot
Resource            ../PageObejcts/Generic.robot
Resource            ../PageObejcts/FormsLandingPAge.robot
Resource            ../PageObejcts/FormfillClient.robot
Resource            ../PageObejcts/ReviewerPage.robot
Resource            ../PageObejcts/ApplicationPage.robot

Resource            ../PageObejcts/workflowSelectPage.robot

Suite Teardown    Close Browser

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
	[Tags]    Sanity
  Generic.LoginToApplication_reviewer
  ReviewerPage.ReviewerAction
  Applicationpage.Check status of form submitted

BundlingRBAC_negative

   Generic.Login To Qaee instance as designer
    BundleCreatePAge.Verify negative flow-enter same bundle name created earlier






