*** Settings ***
Resource            ../resources/variables.robot
*** Keywords ***

Open chrome Browser and goto QAbundle instance

    Open Browser       ${url}      ${BROWSER}
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
FillForm

	Input Text    //input[@placeholder='Search...']    ${formname_client}
    Press Keys    //input[@placeholder='Search...']    ENTER
    sleep    3
    click Button    //*[@id="main"]/div/section/div[2]/div/table/tbody/tr/td[2]/span/button
    sleep    5
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
    Sleep    3
    Wait Until Page Contains    Submission Saved.
