# Robot Framework with Selenium Library
## Introduction
[**Robot Framework**](https://robotframework.org/) is an open-source, generic test automation framework for acceptance testing and acceptance test-driven development (ATDD). It allows users to create, execute, and manage automated test scripts in a readable and maintainable format.

[**SeleniumLibrary**](https://github.com/robotframework/SeleniumLibrary) is a web testing library for Robot Framework that utilizes the Selenium WebDriver API to interact with web browsers.Robot Framework with SeleniumLibrary offers a powerful, flexible, and user-friendly solution for web automation testing. By combining Robot Framework's keyword-driven methodology, platform independence, and extensibility with SeleniumLibrary's web testing capabilities, organizations can establish efficient, maintainable, and scalable automated testing processes. Whether for web application development, regression testing, or continuous delivery pipelines, Robot Framework with SeleniumLibrary provides the tools and framework to meet evolving testing requirements effectively.

## Table of Content

1. [Installation](#installation)
2. [Creating a Test Project](#creating-a-test-project)
   * [Project Structure](#project-structure)
3. [Setting Up the Test Project](#setting-up-the-test-project)
4. [Writing Test Cases](#writing-test-cases)
   *  [Structure of a Test Case](#structure-of-a-test-case)
   *  [Sample Test Case](#sample-test-case)
6. [Example](#example)
   
## Installation
1. Download and Install [Python](https://www.python.org/downloads/).
2. pip: Python's package installer. Usually comes with Python installations.
3. Browser Drivers: Download and set up appropriate browser drivers (e.g., [ChromeDriver](https://chromedriver.chromium.org/downloads) for Chrome, [GeckoDriver](https://github.com/mozilla/geckodriver/releases) for Firefox)
4. Install **Robot Framework**
   
     `pip install robotframework`
   
6. Install **SeleniumLibrary**
   
     `pip install robotframework-seleniumlibrary`
7. Install an IDE  [Pycharm](https://www.jetbrains.com/pycharm/download/?section=windows)/[vscode](https://code.visualstudio.com/download).
## Creating a Test Project
### Project Structure
* Directory: Create a directory for your project.
* File Structure: The directory will contain .robot files for test cases, resource files, and any additional configurations or libraries.
## Setting Up the Test Project
When setting up a test project with Robot Framework, it's essential to maintain a structured directory layout for better organization and scalability. Here's a typical structure:
* `test-cases/`: Directory containing all .robot test case files.
    * Form_create.robot
    * Bundle_create.robot
* `PageObjects`: Directory for resource files containing reusable keywords and variables.
    * Generic.robot
    * FormfillClient.robot
* `Resources`: File containing all resources for the execution ( we used to store json files).
* `results`: Directory to store test execution logs and reports.
* `README.md`: Documentation detailing project setup, test execution steps, and other relevant information.

## Writing Test Cases
### Structure of a Test Case:
A typical test case comprises:
* Settings: Libraries and configurations.
* Variables: Dynamic or static values used across test cases.
* Test Cases: Actual tests with steps and assertions.
* Keywords: Reusable actions or sequences of actions.
### Sample Test Case:

``````````````````````````````````
*** Settings ***
Library           SeleniumLibrary


*** Variables ***
${URL}            http://example.com
${BROWSER}        Chrome


*** Test Cases ***
Open Example Website
    Open Browser    ${URL}    ${BROWSER}
    Page Should Contain    	Example Domain

````````````````````````````````````````````
## Example
Automating a straightforward login process is illustrated in this example.You can access a web page by entering the username `formsflow-designer` and password `formsflow`; otherwise, an error message will be displayed on the screen.

![image](https://github.com/AOT-Technologies/forms-flow-ai-automation-testing/assets/96716528/56e9323b-df71-4812-816b-16ab21b4f66f)
As the login test cases have to be used in many test cases, it has been added in the `Generic.robot` pageobject.

![image](https://github.com/AOT-Technologies/forms-flow-ai-automation-testing/assets/96716528/7578fa42-231e-4c5b-afb2-f0697b4b3990)

### Executing Tests
Testcases can be executed using the `robot` command:

`robot -d results test-cases/formLandingpage.robot`

### Running Specific Test Cases
Using tags, we may specify test scenarios within a testsuite. Use the `-i tagname` to execute these test cases(for example, sanity).

`robot -d -i sanity test-cases/formLandingpage.robot`

## Resources
* [Robot Framework Official Documentation](https://robotframework.org/).
* [SeleniumLibrary Documentation](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html).
