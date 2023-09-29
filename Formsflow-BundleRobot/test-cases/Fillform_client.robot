
*** Settings ***
Documentation    Fill Business form as client.
Library           SeleniumLibrary
Library           DateTime

Test Setup        Open chrome Browser and goto QAbundle instance

Resource            ../resources/variables.robot
Resource            ../resources/keywords.robot


*** Test Cases ***
Logintest
  LoginToApplication_client
  FillForm



