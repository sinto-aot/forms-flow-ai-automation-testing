*** Settings ***
Documentation     All the page objects and keywords of choose from Template page
Library           SeleniumLibrary
*** Variables ***

${template_name}   checking template
*** Keywords ***
Search category
     sleep   3
	Input Text    //input[@data-testid='template-search-category']    ${template_name}
    Press Keys    //input[@data-testid='template-search-category']    ENTER

    Click Element        //span[text()='checking template']
    sleep     2
   Click Element    //div[@data-testid='template-detail-57']
   sleep    3
    Click Element       //a[@data-testid='template-connected-workflow']
   Wait Until Element Is Visible    //button[@data-testid='template-use-button']
    Click Button     //button[@data-testid='template-use-button']
    Click Button     //button[@data-testid='template-reuse-workflow-button']
    sleep    5
    Page Should Contain    Form created successfully
    click button                 xpath://button[normalize-space()='Next']
    sleep                        2s
    click button                 xpath://button[normalize-space()='Next']
    sleep                        4s
    Click Element                  //input[@id='form-publish']
    click button                 //button[@data-testid='save-form-button']
