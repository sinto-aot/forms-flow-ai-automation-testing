*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${Dashboard}       Latest Dashboard
${DROPDOWN_LOCATOR}      xpath=//div[contains(@class,'css-1uccc91-singleValue')]
${List_item}                      //div[contains(@class,'css-1uccc91-singleValue')]//div[text()='QA test dashboard']

*** Keywords ***

Click on Insights
    click element               //a[normalize-space()='Dashboards']
    sleep                       2
    click element               //span[normalize-space()='Insights']
    sleep                       2

Check for Assigned Dashboard
    Click on Insights
    click element                   //div[@class=' css-1uccc91-singleValue']
    input text                      //div[@class=' css-1hwfws3']/div/div/input           ${Dashboard}
    press keys                      //div[@class=' css-1hwfws3']/div/div/input                ENTER
    sleep                            60
    page should contain              ${Dashboard}






