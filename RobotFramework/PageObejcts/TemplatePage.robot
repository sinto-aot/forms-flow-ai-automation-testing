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

    Click Element        //*[@id="main"]/div/div/div[4]/div[1]/div/div/div[2]/div/div/span[1]
    sleep     2
   Click Element    //*[@id="main"]/div/div/div[4]/div[2]/div/div/div/div[1]
   sleep    3
    Click Element       //a[contains( text(), 'Connected Workflow')]
   Wait Until Element Is Visible    //button[contains( text(), 'Use Template')]
    Click Button     //button[contains( text(), 'Use Template')]
    sleep    3
    Page Should Contain    Form created successfully