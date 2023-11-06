*** Settings ***
Documentation        New Form Creation.
Test Setup           Open chrome Browser and goto QAbundle instance
Library             SeleniumLibrary  executable_path=/path/to/chromedriver
Resource            ../PageObejcts/FormOrBundleDelete.robot
Resource            ../PageObejcts/Generic.robot

*** Test Cases ***

Deleting a Form
    [Tags]    Sanity
    Generic.Login To Qaee instance as designer
    FormOrBundleDelete.Delete a form
#    FormOrBundleDelete.Delete a Bundle
    Generic.logout
