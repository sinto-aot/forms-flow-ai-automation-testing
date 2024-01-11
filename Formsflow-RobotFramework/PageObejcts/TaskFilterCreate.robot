*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${FilterName}           Automation_Filter
*** Keywords ***

Check for taskfilters in the list
    sleep                                   2
    click element                            //span[@class='h4 fw-bold']
    wait until element is visible           //div[@class='dropdown-menu show']/a
    ${items}=    Get WebElements           xpath=//div[@class='dropdown-menu show']/a
    ${item_count}=    Get Length    ${items}

    # Log the count of items
    log to console     Number of Filters in the Task List is : ${item_count}

Create new Taskfilter
    sleep                                       2
    click button                              //button[@class='btn btn-link text-dark cursor-pointer']
    sleep                                       3
    input text                                 //input[@class='filter-name-textfeild' and @title='Add fliter name']         ${FilterName}
    sleep                                       1
    select checkbox                            //input[@title='Show task based on logged user roles']
    ${user_permission}=  Get Element Attribute  xpath=//*[@id="private-only"]         checked
    Should Be Equal As Strings          ${user_permission}              true
    sleep                                        2
    click button                                //button[@class='btn btn-primary submitButton']
    wait until element is visible               //div[@role='alert' and contains(text(), 'Filter Created Successfully')]

     #Update Taskfilter


Delete Taskfilter
    click element                            //span[@class='h4 fw-bold']
    click element                            //span[text()='${FilterName}']
    sleep                                       3
    click element                            //button[@class='btn btn-link text-danger cursor-pointer' and text()='Delete Filter']
    wait until element is visible            //font[contains(text(),'Filter Deleted Successfully')]


