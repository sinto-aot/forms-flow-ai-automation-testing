*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SearchRole}           formsflow-reviewer
${UpdateMessage}        Permission updated successfully!
${NewGroup}             group4
${FilterGroup}          formsflow-designer
*** Keywords ***

Click on Users
     click element                   //a[normalize-space()='Admin']
     sleep                           3
     click element                  //span[@class="application-text" and text()="Users"]
     sleep                          2

Search for a default User
    click on users
    input text                      //input[@placeholder='Search by name, username or email']       ${SearchRole}
    sleep                           3
    element should be visible       //div[normalize-space()='Reviewer FFA']
    element should be visible       //span[normalize-space()='${SearchRole}']

Add a new usergroup to the role
    click button                    //button[normalize-space()='Add Role']
    sleep                           3
    element should be visible       //div[contains(@class,'role-list')]//div[2]
    wait until page contains element    //div[contains(@class, 'role-highlighted')]
    sleep                           3
    Scroll Element Into View        //div[@class='role-list']/div[text()='/formsflow-analytics/${NewGroup}']
    Click Element                   //div[@class='role-list']/div[text()='/formsflow-analytics/${NewGroup}']
    element should be visible       //i[contains(@class,'fa fa-check')]
    sleep                           2
    click button                    //button[normalize-space()='Done']
    wait until element is visible   //div[contains(text(),'${UpdateMessage}')]
    sleep                           3
    element should be visible       //span[normalize-space()='${NewGroup}']
    log to console                  Group added successfully.


Remove added user group
    sleep                           4
    click element                   //span[contains(text(), '${NewGroup}')]//i[contains(@class, 'fa-xmark')]
    wait until element is visible   //div[@role='alert']//div[contains(text(),'${UpdateMessage}')]
    log to console                  Group is removed successfully.
    click button                    //button[normalize-space()='Clear']
    sleep                           3

Filter By Usergroup
    click element                   //select[@title='Filter here']
    sleep                           2
    click element                  //select[@title='Filter here']/option[@value='/formsflow/${FilterGroup}']
    wait until element is visible    //span[normalize-space()='${FilterGroup}']







