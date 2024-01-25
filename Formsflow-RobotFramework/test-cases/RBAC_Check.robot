*** Settings ***
Documentation     RBAC
Test Setup     Open chrome Browser and goto QAbundle instance
Resource            ../PageObjects/Generic.robot
Resource            ../PageObjects/RBAC_DesignerPermission.robot

Suite Teardown    Close Browser

*** Test Cases ***


#RBAC
#    [Tags]    Sanity1
#    Generic.Login To QA Instance  ${designer_user}
#    RBAC_DesignerPermission.RBAC
