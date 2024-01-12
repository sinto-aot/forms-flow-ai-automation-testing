
*** Settings ***
Documentation    Fill Business form as client.
Library           SeleniumLibrary
Library           DateTime

Test Setup      Open chrome Browser and goto QAbundle instance

Resource            ../PageObejcts/FormsLandingPAge.robot
Resource            ../PageObejcts/FormfillClient.robot
Resource            ../PageObejcts/Generic.robot
Resource            ../PageObejcts/ApplicationPage.robot

Suite Teardown    Close Browser

*** Variables ***
${formname_client}       New Business
${formname_freedom}     freedom
${form_id}          64b8dd187b3d9f92a25474ca
*** Test Cases ***
Logintest
  Generic.LoginToApplication_client
  FormsLandingPAge.Search Form     ${formname_client}     ${form_id}
  FormfillClient.Fill_Form
   Applicationpage.Check status of form submitted

