*** Settings ***
Documentation       This test case is for checking all the permission available for admin user.
Test Setup          Open chrome Browser and goto QAbundle instance
Library             SeleniumLibrary
Resource            ../PageObjects/AdminPageDashboard.robot
Resource            ../PageObjects/AdminPageRoles.robot
Resource            ../PageObjects/AdminPageUsers.robot
Resource            ../PageObjects/Generic.robot
Resource            ../PageObjects/InsightsPage.robot
Test Teardown       Close Browser

*** Variables ***

${username}         john.honai

*** Test Cases ***

Dashboard Permissions
    [Tags]    dashboard
    Generic.Login To QA Instance    ${username}
    AdminPageDashboard.Basic Dashboard Permissions
    InsightsPage.Check for Assigned Dashboard
    AdminPageDashboard.Remove a group from Dashboard


Roles Creation Page permissions
    [Tags]    roles
    Generic.Login To QA Instance    ${username}
    AdminPageRoles.Roles Creation
    AdminPageRoles.Duplicate role
    AdminPageRoles.Searching for default user
    AdminPageRoles.Search for invalid rolename
    AdminPageRoles.Search for created Role
    AdminPageRoles.Edit a Role
    AdminPageRoles.Add a Usergroup to the new role
    AdminPageRoles.Delete a Role


User Persmissions
    [Tags]    users
    Generic.Login To QA Instance    ${username}
    AdminPageUsers.Search for a default User
    AdminPageUsers.Add a new usergroup to the role
    AdminPageUsers.Remove added user group
    AdminPageUsers.Filter By Usergroup
