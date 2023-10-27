*** Settings ***
Documentation     Filling Business License form
Library           SeleniumLibrary

*** Variables ***

${BusinessName}    aot
${natureOfBusiness}    IT
${noOfEmployess}    15
${mail}           ati@gmail.com
${textField}     yes
${textArea}    check

*** Keywords ***
Fill_Form
    Input Text    //input[@name='data[businessOperatingName]']    ${BusinessName}
    ${my_date_to_select}    Get Current Date    result_format=%d%m%Y
    Input Text    //*[@id="e8pvw39"]/div[1]/div/input[2]    ${my_date_to_select}
    Press Keys    //*[@id="e8pvw39"]/div[1]/div/input[2]    ENTER
    Input Text    //input[@name='data[natureOfBusiness]']    ${natureOfBusiness}
    Input Text    //input[@name='data[numberOfEmployees]']    ${noOfEmployess}
    Input Text    //*[@id="e7m8htm-eMail"]    ${mail}
    Scroll Element Into View    //div[@id='e0tc0f']/div/div/label/input[contains(@name,'data[typeOfBussiness]') and @value='Sole Proprietor']
    Click Element    //div[@id='e0tc0f']/div/div/label/input[contains(@name,'data[typeOfBussiness]') and @value='Sole Proprietor']
    Click Element    //*[@id="eyfajb"]/div[1]/div[2]/label/input
    Click Element    //*[@id="elacr9"]/div[1]/div[2]/label/input
    Click Element    //*[@id="ecqy9f8"]/div[1]/div[2]/label/input
    Wait Until Element Is Enabled    //*[@name="data[submit]"]
    Scroll Element Into View    //*[@id="elmutrg"]/button
    Click Button    //*[@name="data[submit]"]
    Wait Until Page Contains    Submission Saved.
Fill_BundleForm
    Input Text    //*[@name="data[textField]"]    ${textField}
    Input Text     //*[@name="data[textArea]"]    ${textArea}
	Click Button     //button[contains(text(),'Submit Form')]
	sleep     3
	Wait Until Element Is Visible    xpath=//h3[contains(text(),'automation1')]
	 ${next_formBundle}=    Get Text    //h3[contains(text(),'automation1')]
	 Should Be Equal As Strings    ${next_formBundle}    automation1
	 Log To Console    criteria satisfied.second form displayed
	 ${next_textField}=     Get Value     xpath=//*[@name="data[textField]"]
	 Should Be Equal As Strings    ${next_textField}    ${textField}
	 Click Button     //button[contains(text(),'Submit Form')]
    Wait Until Page Contains    Submission Saved.