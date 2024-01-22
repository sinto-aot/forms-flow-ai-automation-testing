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
    click element                       //span[@class="application-text" and text()="Roles"]
    sleep                               2

Roles Creation
    click on roles
    click button                        //button[normalize-space()='Create New Role']
    ${Create role} =                    get text       //div[@class='modal-header']
    should be equal                     ${Create role}        ${Create newrole}
    sleep                               2
    input text                         //input[@id='role-name']            ${New role}
    element should be disabled         //button[@type='submit']
    input text                         //textarea[@id='role-description']  ${Description}
    click button                       //button[@type='submit']
    wait until element is visible      //div[contains(text(),'Role created successfully!')]
    sleep                   3

Duplicate role
    sleep                               2
    click button                        //button[normalize-space()='Create New Role']
    ${Create role} =                    get text       //div[@class='modal-header']
    should be equal                     ${Create role}        ${Create newrole}
    sleep                               2
    input text                          //input[@id='role-name']            ${DefaultRole}
    element should be disabled          //button[@type='submit']
    input text                          //textarea[@id='role-description']  ${Description}
    click button                        //button[@type='submit']
    sleep                               2
    element should be visible           //div[contains(text(),'Failed to create role!')]
    sleep                               2
    click element                       //button[@aria-label='Close']
    sleep                               3
    Log To Console                      Not able to create duplicate roles.


Searching for default user
    input text                          //input[contains(@placeholder,'Search by role name')]       ${DefaultRole}
    sleep                               4
    page should contain                 ${DefaultRole}
    element should not be visible       //i[@class='fa fa-trash delete_button']
    sleep                               2
    element should not be visible       //i[contains(@class, 'fa-pencil')]
    click element                       //p[normalize-space()='View']
    sleep                               2
    element should be visible           //div[@class='role-list']/div[@class='role-user']
    sleep                                3
    click button                        //button[normalize-space()='Clear']


Search for created Role
    sleep                               3
    input text                          //input[contains(@placeholder,'Search by role name')]       ${New role}
    sleep                               2
    page should contain                 ${New role}
    element should be visible           //i[@class='fa fa-trash delete_button']
    sleep                               2
    element should be visible           //i[contains(@class, 'fa-pencil')]
    click element                       //p[normalize-space()='View']
    wait until element is visible      //div[contains(text(),'No results found')]
    log to console                      Created role can be edit, delete and view from here.
    sleep                               4

Edit a Role
    click element                       //i[contains(@class, 'fa-pencil')]
    page should contain                 ${EditConfirm}
    sleep                               2
    input text                          //input[@placeholder='Eg: Account Manager']      ${Edit rolename}
    sleep                               2
    click button                        //button[normalize-space()='Save']
    wait until element is visible       //div[contains(text(),'Role updated successfully!')]
    log to console                      Role Name updated succesfully !
    click button                        //button[normalize-space()='Clear']

Add a Usergroup to the new role
    click on users
    Search for a default User
    click button                        //button[normalize-space()='Add Role']
    sleep                               3
    element should be visible           //div[contains(@class,'role-list')]//div[2]
    wait until page contains element    //div[contains(@class, 'role-highlighted')]
    sleep                               3
    Scroll Element Into View            //div[contains(text(), '${Edit rolename}')]
    Click Element                       //div[contains(text(), '${Edit rolename}')]
    element should be visible           //i[contains(@class,'fa fa-check')]
    sleep                               2
    click button                        //button[normalize-space()='Done']
    wait until element is visible       //div[contains(text(),'${UpdateMessage}')]



Delete a Role
    Click on Roles
    sleep                               3
    input text                          //input[contains(@placeholder,'Search by role name')]       ${Edit rolename}
    sleep                               3
    click element                       //i[@class='fa fa-trash delete_button']
    sleep                               3
    page should contain                 ${DeleteConfirm} ${Edit rolename}
    click button                        //button[normalize-space()='Delete']
    wait until element is visible       //div[contains(text(),'Role deleted successfully!')]
    Log To Console                      Role deleted successfully


Search for invalid rolename
    sleep                               3
    input text                         //input[contains(@placeholder,'Search by role name')]       ${Invalid role}
    sleep                               2
    page should contain                 ${Not found}
    click button                        //button[normalize-space()='Clear']

Create new role with specialcharacters
    sleep                               5
    click button                        //button[normalize-space()='Create New Role']
    ${Create role} =     get text       //div[@class='modal-header']
    should be equal                     ${Create role}        ${Create newrole}
    sleep                                2
    input text                          //input[@id='role-name']            ${Invalid role}
    element should be disabled          //button[@type='submit']
    input text                          //textarea[@id='role-description']  ${Description}
    click button                        //button[@type='submit']
    wait until element is visible       //div[contains(text(),'${ErrorMessage} ')]
    sleep                                2
    click button                        //button[normalize-space()='Clear']



