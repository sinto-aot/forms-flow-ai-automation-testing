*** Settings ***
Documentation     All the page objects and keywords of loginpage
Library           SeleniumLibrary
Documentation    logged in as designer
*** Variables ***
${username}       formsflow-designer
*** Keywords ***
Login To Qaee instance as designer

    Wait Until Element Is Visible    //*[@id="username"]
    Input Text    //*[@id="username"]     ${username}
    Input Password    //*[@id="password"]    ${password}
    Click Button    //*[@id="kc-login"]
    sleep    5
