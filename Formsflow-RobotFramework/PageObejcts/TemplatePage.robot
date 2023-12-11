*** Settings ***
Documentation     All the page objects and keywords of choose from Template page
Library           SeleniumLibrary
*** Variables ***

${template_name}   checking template
*** Keywords ***
Search category
     sleep   3
	Input Text    //input[@placeholder='Search category...']    ${template_name}
    Press Keys    //input[@placeholder='Search category...']    ENTER

    Click Element        //span[text()='checking template']
    sleep     2
   Click Element    //h5[@class='card-title font-weight-bold text-truncate ']
   sleep    3
    Click Element       //a[contains( text(), 'Connected Workflow')]
   Wait Until Element Is Visible    //button[contains( text(), 'Use Template')]
    Click Button     //button[contains( text(), 'Use Template')]
    Click Button     //button[contains( text(), 'Reuse Existing Workflow')]
    sleep    5
    Page Should Contain    Form created successfully
    click button                 xpath://button[normalize-space()='Next']
    sleep                        2s
    click button                 xpath://button[normalize-space()='Next']
    sleep                        4s
    Click Element                  //div[@class='custom-control custom-switch']
    click button                 xpath://button[normalize-space()='Save']
