*** Settings ***

Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.

Library           SeleniumLibrary

*** Variables ***

${url}                   https://forms-flow-web-qaee.aot-technologies.com/
${enter_username}        //*[@id="username"]
${enter_password}        //*[@id="password"]
${login}                 //*[@id="kc-login"]
${designer_user}         formsflow-designer
${client_user}           formsflow-client
${browser_name}          Chrome
${reviewer_user}         formsflow-reviewer
${admin_user}            john.honai
${test_reviewer}         test-reviewer
${password}              aot123

*** Keywords ***

Open chrome Browser and goto QAbundle instance

#      Open Browser       ${url}        browser=chrome    options=add_argument("--headless")
#   Open Browser       ${url}        ${browser_name}
    Open Browser       ${url}        browser=chrome
      Maximize Browser Window

Login To QA Instance
	  sleep                             5
	  [Arguments]                      ${username}
      Input Text                       ${enter_username}     ${username}
      Input Password                   ${enter_password}     ${password}
      Click Button                     ${login}
      sleep                             5

Close Browser session
    Close Browser

Wait Until element passed is located on Page
    [arguments]                         ${page_locator}
    Wait Until Element Is Visible       ${page_locator}        timeout=10

validate success message after form create
	${response}=    Get Text            xpath=//div[contains(text(),'Form-Workflow association saved.')]
    Should Be Equal As Strings          ${response}    Form-Workflow association saved.

logout
	sleep                               10
	Click Element                       //div[@class='nav-item dropdown']/a[@class='dropdown-toggle nav-link']
    Click Element                       //a[normalize-space()='Logout']

