*** Settings ***
Library    SeleniumLibrary
Resource    AdminPageUsers.robot
*** Variables ***

${Create newrole}         Create Role
${New role}               Automation-TestRole
${New role2}              Test
${Invalid role}           Automation#Test(Role)
${Description}            This role is for testing new role creation with Robot Frame work
${Edit rolename}          /Checking-automation
${DefaultRole}            camunda-admin
${EditConfirm}            Edit Role
${DeleteConfirm}          Are you sure deleting the role
${Not found}              No data Found
${ErrorMessage}           Role names cannot contain special characters except _ , - , /

*** Keywords ***

# These test cases are in Roles page of Admin


Click on Roles
    click element                       //a[@data-testid='admin-nav-link']
    sleep                               3
    click element                       //*[@data-testid="application-text-1"]
    sleep                               2

Roles Creation
    click on roles
    click button                       //button[@data-testid="roles-create-new-role-button"]
    ${Create role} =                   get text       //div[@class='modal-header']
    should be equal                    ${Create role}        ${Create newrole}
    sleep                               2
    input text                         //input[@id='role-name']            ${New role}
    element should be disabled         //button[@data-testid="create-new-role-modal-submit-button"]
    input text                         //textarea[@id='role-description']  ${Description}
    click button                       //button[@data-testid="create-new-role-modal-submit-button"]
    wait until element is visible      //div[contains(text(),'Role created successfully!')]
    sleep                   3

Duplicate role
    sleep                               2
    click button                        //button[@data-testid="roles-create-new-role-button"]
    ${Create role} =                    get text       //div[@class='modal-header']
    should be equal                     ${Create role}        ${Create newrole}
    sleep                               2
    input text                          //input[@id='role-name']            ${DefaultRole}
    element should be disabled          //button[@type='submit']
    input text                          //textarea[@id='role-description']  ${Description}
    click button                        //button[@data-testid="create-new-role-modal-submit-button"]
    sleep                               2
    element should be visible           //div[contains(text(),'Failed to create role!')]
    sleep                               2
    click element                       //button[@data-testid="create-new-role-modal-cancel-button"]
    sleep                               3
    Log To Console                      Not able to create duplicate roles.


Searching for default user
    input text                          //input[@data-testid="search-role-input"]       ${DefaultRole}
    sleep                               4
    page should contain                 ${DefaultRole}
    element should not be visible       //i[@data-testid="admin-roles-delete-icon"]
    sleep                               2
    element should not be visible       //i[@data-testid="admin-roles-edit-icon"]
    click element                       //div[@data-testid="user-list-view-dropdown"]
    sleep                               2
    element should be visible           //div[@class='role-list']/div[@class='role-user']
    sleep                                3
    click button                        //button[@data-testid="clear-role-search-button"]


Search for created Role
    sleep                               3
    input text                          //input[@data-testid="search-role-input"]      ${New role}
    sleep                               2
    page should contain                 ${New role}
    element should be visible           //i[@data-testid="admin-roles-delete-icon"]
    sleep                               2
    element should be visible           //i[@data-testid="admin-roles-edit-icon"]
    click element                       //div[@data-testid="user-list-view-dropdown"]
    wait until element is visible      //div[contains(text(),'No results found')]
    log to console                      Created role can be edit, delete and view from here.
    sleep                               4

Edit a Role
    click element                       //i[@data-testid="admin-roles-edit-icon"]
    page should contain                 ${EditConfirm}
    sleep                               2
    input text                          //input[@id="edit-role-name"]      ${Edit rolename}
    sleep                               2
    click button                        //button[@data-testid="edit-role-modal-save-button"]
    wait until element is visible       //div[contains(text(),'Role updated successfully!')]
    log to console                      Role Name updated succesfully !
    click button                        //button[@data-testid="clear-role-search-button"]

Add a Usergroup to the new role
    click on users
    Search for a default User
    click button                        //button[@data-testid="users-add-role-button"]
    sleep                               3
    element should be visible           //div[contains(@class,'role-list')]//div[2]
    wait until page contains element    //div[contains(@class, 'role-highlighted')]
    sleep                               3
    Scroll Element Into View            //div[contains(text(), '${Edit rolename}')]
    Click Element                       //div[contains(text(), '${Edit rolename}')]
    element should be visible           //i[contains(@class,'fa fa-check')]
    sleep                               2
    click button                        //button[@data-testid="add-role-popover-done-button"]
    wait until element is visible       //div[contains(text(),'${UpdateMessage}')]



Delete a Role
    Click on Roles
    sleep                               3
    input text                          //input[@data-testid="search-role-input"]       ${Edit rolename}
    sleep                               3
    click element                       //i[@data-testid="admin-roles-delete-icon"]
    sleep                               3
    page should contain                 ${DeleteConfirm} ${Edit rolename}
    click button                        //button[@data-testid="roles-confirm-delete-button"]
    wait until element is visible       //div[contains(text(),'Role deleted successfully!')]
    Log To Console                      Role deleted successfully


Search for invalid rolename
    sleep                               3
    input text                          //input[@data-testid="search-role-input"]      ${Invalid role}
    sleep                               2
    page should contain                 ${Not found}
    click button                        //button[@data-testid="clear-role-search-button"]

Create new role with specialcharacters
    sleep                               5
    click button                        //button[@data-testid="roles-create-new-role-button"]
    ${Create role} =     get text       //div[@class='modal-header']
    should be equal                     ${Create role}        ${Create newrole}
    sleep                                2
    input text                          //input[@id='role-name']            ${Invalid role}
    element should be disabled          //button[@data-testid="create-new-role-modal-submit-button"]
    input text                          //textarea[@id='role-description']  ${Description}
    click button                        //button[@data-testid="create-new-role-modal-submit-button"]
    wait until element is visible       //div[contains(text(),'${ErrorMessage} ')]
    sleep                                2
    click button                        //button[@data-testid="clear-role-search-button"]



