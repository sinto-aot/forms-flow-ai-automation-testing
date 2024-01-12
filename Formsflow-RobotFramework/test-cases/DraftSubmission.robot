*** Settings ***
Documentation     Form BundlingRBAC.
Test Setup     Open chrome Browser and goto QAbundle instance
Library           SeleniumLibrary
Resource            ../PageObejcts/Generic.robot
Resource            ../PageObejcts/FormsLandingPAge.robot

Resource            ../PageObejcts/DraftPage.robot

Test Teardown    Close Browser

*** Variables ***
${search}       Automation Draft test
${form_id}      65828aa77eb909f9083f8fb4
*** Test Cases ***

New Draft
    Generic.LoginToApplication_client
    FormsLandingPAge.Search Form     ${search}   ${form_id}
    DraftPage.Create New draft
   DraftPage.Check for created Draft
   DraftPage.Draft Details
    DraftPage.Edit Draft
    DraftPage.Verify Form Field Component
#    DraftPage.Delete draft

Draft Filters
	[Tags]    sanity
    Generic.LoginToApplication_client
    DraftPage.Check for created Draft
#    DraftPage.Filter with draftName
    DraftPage.Filter with Modified Date
    DraftPage.Filter with Invalid draftName and draft Id