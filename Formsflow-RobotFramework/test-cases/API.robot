*** Settings ***
Documentation       This test case is for checking all the permission available for admin user.
Test Setup          Open chrome Browser and goto QAbundle instance
Library             SeleniumLibrary
Library  RequestsLibrary
Library  JSON
Resource            ../PageObjects/AdminPageDashboard.robot
Resource            ../PageObjects/Generic.robot
Test Teardown    Close Browser

*** Variables ***

*** Test Cases ***

Send GET Request and Extract ID by Name

    ${body}=    create dictionary    grant_type=client_credentials  client_id=forms-flow-bpm        client_secret=786001d6-68a8-4519-903c-bc5b5a870d68

    ${header}=  create dictionary    Content-Type=x-www-form-urlencoded
    ${resp}=    POST        https://forms-flow-idm-qa.aot-technologies.com/auth/realms/forms-flow-ai/protocol/openid-connect/token    ${body}    ${header}
    Log To Console    ${resp}
      ${access_token}    Set Variable    ${resp.json().get('access_token')}
    Should Not Be Empty    ${access_token}
    Log    The access token is: ${access_token}
    ${name} =  Set Variable  automation  # Replace with the actual name
#    ${response} =  Get Request  ${BASE_URL}/your-endpoint?name=${name}
    ${headers} =  Create Dictionary  Authorization=Bearer ${resp}
    ${response} =  GET     url=https://forms-flow-api-qaee.aot-technologies.com/form?pageNo=1&limit=5&sortBy=formName&sortOrder=asc&formType=form,resource&formName=${name}   headers=${access_token}
    Log  Response: ${response.content}
        :FOR    ${form}    IN    @{response.json()}    # Assumes the API returns a JSON array of forms
             \    Run Keyword If    '${name}' in ${form.name}    \    Set Variable    ${form_id}    ${form.id}
        Should Not Be Empty    ${form_id}
        Log    The form ID for form ${form_name} is: ${form_id}

