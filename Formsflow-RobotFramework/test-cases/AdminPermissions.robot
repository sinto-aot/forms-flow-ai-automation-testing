*** Settings ***
Documentation       This test case is for checking all the permission available for admin user.
Test Setup          Open chrome Browser and goto QAbundle instance
Library             SeleniumLibrary
Resource            ../PageObejcts/AdminPageDashboard.robot
Resource            ../PageObejcts/AdminPageRoles.robot
Resource            ../PageObejcts/AdminPageUsers.robot
Resource            ../PageObejcts/Generic.robot

*** Variables ***

*** Test Cases ***

Dashboard Permissions
    [Tags]    dashboard
    Generic.LoginToApplication_Admin
#  AdminPageDashboard.Basic Dashboard Permissions
    InsightsPage.Check for Assigned Dashboard
    AdminPageDashboard.Remove a group from Dashboard


Roles Creation Page permissions
    [Tags]    roles
    Generic.LoginToApplication_Admin
    AdminPageRoles.Roles Creation
    AdminPageRoles.Duplicate role
    AdminPageRoles.Searching for default user
    AdminPageRoles.Search for invalid rolename
    AdminPageRoles.Search for created Role
    AdminPageRoles.Edit a Role
#    AdminPageRoles.Add a Usergroup to the new role
    AdminPageRoles.Delete a Role


User Persmissions
    [Tags]    users
    Generic.LoginToApplication_Admin
    AdminPageUsers.Search for a default User
    AdminPageUsers.Add a new usergroup to the role
    AdminPageUsers.Remove added user group
    AdminPageUsers.Filter By Usergroup
