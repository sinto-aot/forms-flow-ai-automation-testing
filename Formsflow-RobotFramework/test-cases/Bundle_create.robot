
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
    [Tags]    BundleCreate
    Generic.Login To QA Instance    ${designer_user}
    BundleCreatePAge.CreateBundle
    workflowSelectPage.select bundle workflow and publish to client
    Generic.validate success message after form create
    Generic.logout

Bundle_FormfillByClient
   [Tags]    Fillform
  Generic.Login To QA Instance    ${client_user}
  FormsLandingPAge.Search Bundle_Form   ${Bundle_form}
  FormfillClient.Fill_BundleForm
  FormfillClient.check second bundle form displayed
  FormfillClient.Fill_Freedomform
  Applicationpage.Check status of form submitted
  Generic.logout


Bundle_TaskActionByReviewer
  [Tags]    ReviewerAction
  Generic.Login To QA Instance   ${reviewer_user}
  ReviewerPage.ReviewerAction
  Applicationpage.Check status of form submitted

BundlingRBAC_negative

	[Tags]    Sanity
    Generic.Login To QA Instance   ${designer_user}
    BundleCreatePAge.Verify negative flow-enter same bundle name created earlier






