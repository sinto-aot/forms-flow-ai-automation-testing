
*** Settings ***
Documentation     Form BundlingRBAC.
Test Setup     Open chrome Browser and goto QAbundle instance
Library           SeleniumLibrary
Library           DateTime
Resource            ../PageObejcts/BundleCreatePAge.robot
Resource            ../PageObejcts/Generic.robot
Resource            ../PageObejcts/FormsLandingPAge.robot
Resource            ../PageObejcts/FormfillClient.robot
Suite Teardown    Close Browser

*** Variables ***
${Bundle_form}       Automation_bundle
*** Test Cases ***
Bundle_Create
    [Tags]    Sanity
    Generic.Login To Qaee instance as designer
    BundleCreatePAge.CreateBundle

   BundleCreatePAge.select workflow and publish to client
   Generic.validate success message after form create
     Generic.logout
Bundle_FormfillByClient
  Generic.LoginToApplication_client
  FormsLandingPAge.Search Bundle_Form   ${Bundle_form}
  FormfillClient.Fill_BundleForm
  Generic.logout
BundlingRBAC_negative

   Generic.Login To Qaee instance as designer
    BundleCreatePAge.Verify negative flow-enter same bundle name created earlier






