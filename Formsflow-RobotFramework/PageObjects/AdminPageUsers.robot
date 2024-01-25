*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SearchRole}           formsflow-reviewer
${UpdateMessage}        Permission updated successfully!
${NewGroup}             group4
${FilterGroup}          formsflow-designer
*** Keywords ***

Click on Users
     click element                      //a[@data-testid='admin-nav-link']
     sleep                              3
     click element                      //*[@data-testid="application-text-2"]
     sleep                              5

Search for a default User
    click on users
    input text                          //input[@data-testid="search-users-input"]       ${SearchRole}
    sleep                               3
    element should be visible           //div[normalize-space()='Reviewer FFA']
    element should be visible           //span[normalize-space()='${SearchRole}']

Add a new usergroup to the role
    click button                        //button[@data-testid="users-add-role-button"]
    sleep                                3
    element should be visible           //*[@data-testid="users-add-role-popover"]
    wait until page contains element    //div[contains(@class, 'role-highlighted')]
    sleep                               3
    Click Element                       //div[@class='role-list']/div[text()='/formsflow-analytics/${NewGroup}']
    element should be visible           //i[contains(@class,'fa fa-check')]
    sleep                               2
    click button                        //button[normalize-space()='Done']
    wait until element is visible       //div[contains(text(),'${UpdateMessage}')]
    sleep                               3
    element should be visible           //span[normalize-space()='${NewGroup}']
    log to console                      Group added successfully.


Remove added user group
    sleep                               4
    click element                       //span[contains(text(), '${NewGroup}')]//i[contains(@class, 'fa-xmark')]
    wait until element is visible       //div[@role='alert']//div[contains(text(),'${UpdateMessage}')]
    log to console                      Group is removed successfully.
    click button                        //button[@data-testid="clear-users-search-button"]
    sleep                               3

Filter By Usergroup
    click element                       //select[@data-testid="users-roles-filter-select"]
    sleep                               2
    click element                       //select[@title='Filter here']/option[@value='/formsflow/${FilterGroup}']
    wait until element is visible       //span[normalize-space()='${FilterGroup}']







