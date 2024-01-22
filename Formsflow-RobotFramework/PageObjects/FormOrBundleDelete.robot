*** Settings ***
Library    SeleniumLibrary
Library    XML

*** Variables ***
${Search_form}     Automation Draft test-copy
${Search_bundle}   Automation_bundle +
${Delete_alert}    Delete Confirmation

*** Keywords ***

Delete a form

    input text                          //input[@data-testid='form-search-input-box']     ${Search_form}
    Press Keys                          //input[@data-testid='form-search-input-box']     ENTER
    sleep                               4s
    click element                       //i[@class='fa-solid fa-ellipsis']
    Click Element                       //a[contains(@data-testid, 'designer-form-option-') and contains(@data-testid, '-delete')]
    sleep                                3
    Wait Until Page Contains            Delete Confirmation
    click button                        //button[@data-testid="delete-confirm-button"]
    Click Element                       //*[@data-testid="form-search-cear-button"]
    Wait Until Page Contains            Form deleted successfully
    sleep                               5

Delete a Bundle
   Sleep                                4
   click element                        //span[normalize-space()='Form Bundle']
   input text                           //*[@data-testid="bundle-search-input-box"]    ${Search_bundle}
   Sleep                                 2
   Click Element                        //div[@data-testid="bundle-search-click-button"]
   sleep                                4
   Click Element                        //i[@class='fa-solid fa-ellipsis']
   Sleep                                4
   click element                        //a[contains(@data-testid, 'designer-bundle-option') and contains(@data-testid, '-delete')]
   Wait Until Page Contains             Delete Confirmation
   click button                         //button[@data-testid="delete-confirm-button"]
   Wait Until Page Contains             Bundle deleted successfully

