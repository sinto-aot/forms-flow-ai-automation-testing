*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${AccessToAll}            All groups have access to the dashboard


*** Keywords ***

# These testcases are for testing Dashboard functinalities

Adding a new Group

    click element                       //div[@data-testid='dashboard-remaining-group-0']
    sleep                                4
    Element Should Be Visible           //div[contains(text(),'Update success!')]
    log to console                      Added a new group in the dashboard
    sleep                                 3



Checking if the groups are already added
    LOG TO CONSOLE                      All the Groups have access to this dashboard


Remove a group from Dashboard
    click element                       //a[@data-testid='admin-nav-link']
    sleep                               3
    sleep                               4
    click element                       //i[@data-testid='dashboard-remove-auth-btn-1']
    sleep                               2
    Element Should Be Visible           //div[contains(text(),'Update success!')]



Basic Dashboard Permissions

    click element                       //a[@data-testid='admin-nav-link']
    sleep                               3
    page should contain                   Dashboard
    click button                        //*[@data-testid="0"]
    sleep               2
    # Check if the popup message contains the specified text
    ${popup_message} =    Get Text      xpath=//div[@class='role']

    Run Keyword If    '${popup_message}' == '${AccessToAll}'        Checking if the groups are already added
...    ELSE     Adding a new Group




#








