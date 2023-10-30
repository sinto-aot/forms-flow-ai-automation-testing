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
Fill_Freedomform
	    sleep    2

	click Element    xpath=//div[@class='form-control ui fluid selection dropdown']
    sleep    2
    Input Text    xpath=//input[@placeholder='Type to search']          Agriculture
    Press Keys    xpath=//input[@placeholder='Type to search']       ENTER
    Input Text    xpath=//*[@name="data[firstName]"]      John
    Input Password    xpath=//*[@name="data[lastName]"]    raj
    Input Text    xpath=//*[@name="data[dayPhoneNo]"]     (224) 234-3242
    Input Text    xpath=//*[@name="data[eMailAddress]"]      John@aot.in
    Input Text     xpath=//*[contains(@name,'informationRequested')]            test
    Click Element    xpath=//span[contains(text(),'Receive Copy')]
    sleep    2
    Scroll Element Into View    //*[text()='Submit Form']
    Click Button    //*[text()='Submit Form']
    Wait Until Page Contains    Submission Saved.
    sleep    7
Fill_BundleForm
    Input Text    //*[@name="data[textField]"]    ${textField}
    Input Text     //*[@name="data[textArea]"]    ${textArea}
	Click Button     //button[contains(text(),'Submit Form')]
	sleep     7
check second bundle form displayed

	Wait Until Element Is Visible    xpath=//h3[contains(text(),'Automation_Freedom of Information and Protection of Privacy')]
	 ${next_formBundle}=    Get Text    //h3[contains(text(),'Automation_Freedom of Information and Protection of Privacy')]
	 Should Be Equal As Strings    ${next_formBundle}    Automation_Freedom of Information and Protection of Privacy
	 Log To Console    criteria satisfied.second form displayed
