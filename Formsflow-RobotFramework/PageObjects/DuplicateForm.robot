*** Settings ***
Library    SeleniumLibrary


*** Variables ***

${editing_form}                     Automation Draft test
${copy}                             -copy
*** Keywords ***

Create Duplicate Form
    input text                      //*[@data-testid="form-search-input-box"]        ${editing_form}
    Press Keys                      //*[@data-testid="form-search-input-box"]        ENTER
    sleep                           3
    wait until page contains        ${editing_form}
    Click Element                   //button[@class='btn btn-link text-primary mt-2']
    Sleep                           4
    Click Button                    //button[@data-testid="form-duplicate-button"]
    wait until page contains        Create a duplicate form
    click button                    //button[@data-testid="form-duplicate-yes-button"]
    sleep                           4
    page should contain             Duplicate form created successfully
    sleep                           3
    page should contain             ${editing_form}${copy}
    click button                    //button[@data-testid="form-next-button"]
    click button                    //button[@data-testid="form-save-next-button"]
    Sleep                           3
    Click Button                    //button[@data-testid="save-form-button"]
    sleep                           5






