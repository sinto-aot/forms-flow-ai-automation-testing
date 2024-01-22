
*** Settings ***
Documentation     Form BundlingRBAC.
Test Setup     Open chrome Browser and goto QAbundle instance
Library           SeleniumLibrary
Library           DateTime
Resource            ../PageObjects/Generic.robot

Resource            ../PageObjects/ReviewerPage.robot


Test Teardown    Close Browser

*** Variables ***
${Bundle_form}       Automation_bundle
*** Test Cases ***

TaskSearchByReviewer_listview


  Generic.Login To QA Instance  ${reviewer_user}
  ReviewerPage.searchInListView


<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes






