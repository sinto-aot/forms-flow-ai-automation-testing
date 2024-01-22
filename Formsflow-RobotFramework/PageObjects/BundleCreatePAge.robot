
*** Settings ***
Documentation     This testcase is for checking the formbundle creation
Library           SeleniumLibrary

*** Variables ***

${formname}       automation
${condition_form}    Automation_Freedom

${Bundlename}     Automation_bundle
${BundleDesc}     bundleAutomation
${workflow-name}   One Step Approval

${criteria}       textField== 'yes'

*** Keywords ***
CreateBundle
    Wait Until Element Is Visible    //span[text()='Form Bundle']
    Click Element                    //span[text()='Form Bundle']
    sleep    2
    Wait Until Element Is Visible    //button[@data-testid='create-bundle-button']
    Click Element                    //button[@data-testid='create-bundle-button']
    ${CurrentDate}    Get Time
    Input Text                       //input[@data-testid='create-bundle-name-input']    ${Bundlename} + ${CurrentDate}
    Input Text                       //div[@class='ql-editor ql-blank']    ${BundleDesc}
    Click Element                    //button[@data-testid='bundle-add-forms-button']
    sleep                             3
    Input Text                       //input[@data-testid='bundle-search-forms-input']    ${formname}
    Click Element                    //div[@data-testid='create-bundle-search-forms-click-button']
    sleep                             3
    Select Checkbox                  //input[@data-testid='bundle-select-all-form-checkbox']
    Click Button                     //button[@data-testid='bundle-form-selected-insert-button']
    Click Button                     //button[@data-testid='bundle-add-conditions-button']
    Input Text                       //textarea[@data-testid='bundle-create-condition-input']    ${criteria}
    click Element                    //div[contains(@class, 'css-tlfecz-indicatorContainer')]
    sleep                             3
    Press Keys                       xpath=/html/body/div[2]/div/div/div[2]/div/div[2]/div[2]/div/div[1]/div[2]/div/input    ${condition_form}+ENTER
    Click Button                     //button[@data-testid='bundle-create-condition-submit-button']
    sleep                             3
    Click Button                     //button[@data-testid='bundle-save-preview-button']
    sleep                             5
    ${create}=    Get Text           xpath=//div[contains(text(),'Bundle Create Successfully')]
    Should Be Equal As Strings       ${create}    Bundle Create Successfully

#select workflow and publish to client
#	sleep    5
#    Click Button    xpath=//button[text()='Next']
#    sleep   3
#  Click Button    xpath=//button[contains(text(),'Edit')]
#    sleep   4
#    click Element    xpath=//div[@class=' css-1hwfws3']
#    sleep    2
#    Input Text    xpath=//*[@id="selectWorkflow"]    ${workflow-name}
#    Press Keys    xpath=//div[@class=' css-1hwfws3']/div/div/input    ENTER
#    Click Button    xpath=//button[contains(text(),'Next')]
#    Click Element        xpath=//input[@id='form-publish']
#    Click Button    xpath=//button[text()='Save']
#    sleep    5

Verify negative flow-enter same bundle name created earlier

    Click Element                    //span[text()='Form Bundle']
    sleep    2
    ${form_bundlename}    Get Text   //div[@data-testid="wrapper"]/div/table/tbody/tr[2]/td[1]
#    Log To Console       ${form_bundlename}
    sleep    2
    Click Element                   //button[@data-testid='create-bundle-button']

    Input Text                      //input[@data-testid='create-bundle-name-input']   ${form_bundlename}
    Input Text                      //div[@class='ql-editor ql-blank']    ${BundleDesc}
    Click Element                   //button[@data-testid='bundle-add-forms-button']
    sleep                           3
    Input Text                      //input[@data-testid='bundle-search-forms-input']    ${formname}
    Click Element                   //div[@data-testid='create-bundle-search-forms-click-button']
    sleep                           3
    Select Checkbox                 //input[@data-testid='bundle-select-all-form-checkbox']
    Click Button                    //button[@data-testid='bundle-form-selected-insert-button']
    sleep                           4
     Click Button                   //button[@data-testid='bundle-save-preview-button']
    sleep                           5
    ${negative}=    Get Text        xpath=//div[contains(@role,'alert')]//div[1]
    log     ${negative}
    Should Be Equal As Strings     ${negative}    ValidatorError (name) - The Name must be unique per Project.
