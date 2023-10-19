*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary


*** Variables ***
${user_name}             formsflow-designer
${password}       aot123
${username_client}   formsflow-client
${url}                   https://forms-flow-web-qaee.aot-technologies.com/
${browser_name}          Chrome




*** Keywords ***

Open chrome Browser and goto QAbundle instance

    Open Browser       ${url}      ${browser_name}
    Maximize Browser Window

Login To Qaee instance as designer

    Wait Until Element Is Visible    //*[@id="username"]
    Input Text    //*[@id="username"]     ${username}
    Input Password    //*[@id="password"]    ${password}
    Click Button    //*[@id="kc-login"]
    sleep    5
LoginToApplication_client

                Wait Until Element Is Visible    //*[@id="username"]
                Input Text    //*[@id="username"]    ${username_client}
                Input Password    //*[@id="password"]    ${password}
                Click Button    //*[@id="kc-login"]
                Sleep    5

Close Browser session
    Close Browser

Wait Until element passed is located on Page
    [arguments]         ${page_locator}
    Wait Until Element Is Visible        ${page_locator}        timeout=10
validate success message after form create
	${response}=    Get Text    xpath=//div[contains(text(),'Form-Workflow association saved.')]
    Should Be Equal As Strings    ${response}    Form-Workflow association saved.

logout
	Wait Until Element Is Visible     xpath://*[@id="responsive-navbar-nav"]/div[3]/div/a
	Click Element      xpath://*[@id="responsive-navbar-nav"]/div[3]/div/a
    Click Element         xpath://*[@id="responsive-navbar-nav"]/div[3]/div/div/a[2]





